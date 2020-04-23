CREATE OR REPLACE FUNCTION find_subject_hours (
    p_ders_kod   course_schedule.ders_kod%TYPE,
    p_year       course_schedule.year%TYPE,
    p_term       course_schedule.term%TYPE,
    p_section    course_sections.term%TYPE
) RETURN NUMBER IS
    v_result NUMBER;
BEGIN
    SELECT COUNT (*) AS hour
    INTO v_result
    FROM course_schedule
    WHERE ders_kod = p_ders_kod
          AND year = p_year
          AND term = p_term
          AND section = p_section
    GROUP BY ders_kod;

    RETURN v_result;
END find_subject_hours;

CREATE OR REPLACE FUNCTION calculate_teacher_loading (
    p_emp_id   course_sections.emp_id%TYPE,
    p_year     course_sections.year%TYPE,
    p_term     course_sections.term%TYPE
) RETURN records_pkg.teacher_loading_table
    PIPELINED
IS

    v_hours_sum   NUMBER := 0;
    v_result      records_pkg.teacher_loading_rec;
    CURSOR c_emps IS
    SELECT ders_kod,
           section,
           hour_num
    FROM course_sections
    WHERE year = p_year
          AND term = p_term
          AND emp_id = p_emp_id;

BEGIN
    FOR v_rec IN c_emps LOOP IF (v_rec.hour_num IS NOT NULL) THEN
        v_hours_sum := v_hours_sum + v_rec.hour_num;
    ELSE
        v_hours_sum := v_hours_sum + 15 * find_subject_hours (v_rec.ders_kod, p_year, p_term, v_rec.section);
    END IF;
    END LOOP;

    v_result.emp_id := p_emp_id;
    v_result.year := p_year;
    v_result.term := p_term;
    v_result.hours := v_hours_sum;
    PIPE ROW (v_result);
END calculate_teacher_loading;

SELECT *
FROM TABLE (calculate_teacher_loading (10521, 2019, 2));