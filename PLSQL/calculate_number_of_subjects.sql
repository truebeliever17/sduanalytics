CREATE OR REPLACE FUNCTION calculate_number_of_subjects (
    p_stud_id   course_selections.stud_id%TYPE,
    p_year      course_sections.year%TYPE,
    p_term      course_sections.term%TYPE
) RETURN records_pkg.subjects_number_table
    PIPELINED
IS

    v_record     records_pkg.subjects_number_rec;
    v_credits    NUMBER := 0;
    v_subjects   NUMBER := 0;
    CURSOR c_subjects IS
    SELECT ders_kod,
           find_credits_of_subject (ders_kod) AS credits
    FROM course_selections
    WHERE stud_id = p_stud_id
          AND year = p_year
          AND term = p_term
    GROUP BY ders_kod;

BEGIN
    FOR v_rec IN c_subjects LOOP
        v_credits := v_credits + v_rec.credits;
        v_subjects := v_subjects + 1;
    END LOOP;

    v_record.stud_id := p_stud_id;
    v_record.subjects_count := v_subjects;
    v_record.credits_count := v_credits;
    v_record.year := p_year;
    v_record.term := p_term;
    PIPE ROW (v_record);
END calculate_number_of_subjects;

SELECT *
FROM TABLE (calculate_number_of_subjects ('3F2F30658127C29328718C132E7C71CE6BD484D8', 2019, 1));