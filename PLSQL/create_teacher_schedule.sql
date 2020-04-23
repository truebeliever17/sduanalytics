CREATE OR REPLACE FUNCTION create_teacher_schedule (
    p_emp_id   course_sections.emp_id%TYPE,
    p_year     course_sections.year%TYPE,
    p_term     course_sections.term%TYPE
) RETURN records_pkg.teacher_schedule_table
    PIPELINED
IS

    CURSOR c_subjects IS
    SELECT teachers.emp_id,
           schedule.ders_kod,
           schedule.section,
           to_char (start_time, 'Day') AS day,
           to_number (to_char (start_time, 'HH24')) AS start_time,
           p_year,
           p_term
    FROM course_schedule   schedule
    JOIN course_sections   teachers ON schedule.year = teachers.year
                                     AND schedule.term = teachers.term
                                     AND schedule.section = teachers.section
                                     AND schedule.ders_kod = teachers.ders_kod
    WHERE teachers.emp_id = p_emp_id
          AND teachers.year = p_year
          AND teachers.term = p_term
    ORDER BY to_char (schedule.start_time, 'D'),
             start_time;

BEGIN
    FOR v_rec IN c_subjects LOOP
        PIPE ROW (v_rec);
    END LOOP;
END create_teacher_schedule;

SELECT *
FROM TABLE (create_teacher_schedule (10521, 2019, 2));