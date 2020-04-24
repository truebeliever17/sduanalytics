CREATE OR REPLACE FUNCTION grade_to_gpa (
    score course_selections.qiymet_yuz%TYPE
) RETURN FLOAT IS
    v_grade FLOAT;
BEGIN
    IF score >= 95 THEN
        v_grade := 4;
    ELSIF score >= 90 THEN
        v_grade := 3.67;
    ELSIF score >= 85 THEN
        v_grade := 3.33;
    ELSIF score >= 80 THEN
        v_grade := 3.0;
    ELSIF score >= 75 THEN
        v_grade := 2.67;
    ELSIF score >= 70 THEN
        v_grade := 2.33;
    ELSIF score >= 65 THEN
        v_grade := 2.0;
    ELSIF score >= 60 THEN
        v_grade := 1.67;
    ELSIF score >= 55 THEN
        v_grade := 1.33;
    ELSIF score >= 50 THEN
        v_grade := 1.0;
    ELSE
        v_grade := 0;
    END IF;

    RETURN v_grade;
END grade_to_gpa;

CREATE OR REPLACE FUNCTION find_credits_of_subject (
    p_ders_kod course_sections.ders_kod%TYPE
) RETURN NUMBER IS
    v_credits NUMBER;
BEGIN
    SELECT MAX (credits)
    INTO v_credits
    FROM course_sections
    WHERE ders_kod = p_ders_kod;

    IF (v_credits IS NULL) THEN
        v_credits := 2;
    END IF;
    RETURN v_credits;
END find_credits_of_subject;

CREATE OR REPLACE FUNCTION find_total_gpa (
    p_stud_id course_selections.stud_id%TYPE
) RETURN FLOAT IS

    CURSOR c_subjects IS
    SELECT grade_to_gpa (qiymet_yuz) AS score,
           find_credits_of_subject (ders_kod) AS credits
    FROM course_selections
    WHERE stud_id = p_stud_id
          AND qiymet_yuz IS NOT NULL;

    v_credits_sum   NUMBER := 0;
    v_result        FLOAT := 0;
BEGIN
    FOR v_rec IN c_subjects LOOP
        v_result := v_result + v_rec.score * v_rec.credits;
        v_credits_sum := v_credits_sum + v_rec.credits;
    END LOOP;

    IF v_credits_sum = 0 OR v_credits_sum IS NULL THEN
        RETURN NULL;
    END IF;
    RETURN v_result / v_credits_sum;
END find_total_gpa;

CREATE OR REPLACE FUNCTION find_spa_and_gpa (
    p_stud_id   course_selections.stud_id%TYPE,
    p_year      course_selections.year%TYPE,
    p_term      course_selections.term%TYPE
) RETURN records_pkg.student_gpa_table
    PIPELINED
IS

    v_credits_sum    NUMBER := 0;
    v_result         FLOAT := 0;
    v_final_result   FLOAT;
    v_record         records_pkg.student_gpa_rec;
    CURSOR c_subjects IS
    SELECT grade_to_gpa (qiymet_yuz) AS score,
           find_credits_of_subject (ders_kod) AS credits
    FROM course_selections
    WHERE stud_id = p_stud_id
          AND year = p_year
          AND term = p_term
          AND qiymet_yuz IS NOT NULL;

BEGIN
    FOR v_rec IN c_subjects LOOP
        v_result := v_result + v_rec.score * v_rec.credits;
        v_credits_sum := v_credits_sum + v_rec.credits;
    END LOOP;

    IF v_credits_sum != 0 AND v_credits_sum IS NOT NULL THEN
        v_final_result := v_result / v_credits_sum;
    END IF;

    v_record.stud_id := p_stud_id;
    v_record.year := p_year;
    v_record.term := p_term;
    v_record.gpa := find_total_gpa (p_stud_id);
    v_record.spa := v_final_result;
    PIPE ROW (v_record);
END find_spa_and_gpa;

SELECT *
FROM TABLE (find_spa_and_gpa ('3F2F30658127C29328718C132E7C71CE6BD484D8', 2019, 1));