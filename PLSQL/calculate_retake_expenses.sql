CREATE OR REPLACE FUNCTION calculate_total_expenses (
    p_stud_id course_selections.stud_id%TYPE
) RETURN NUMBER IS

    CURSOR c_occurences IS
    SELECT ders_kod,
           COUNT (*) - 1 AS subject_occurences
    FROM course_selections
    WHERE stud_id = p_stud_id
          AND ders_kod IN (
        SELECT DISTINCT ders_kod
        FROM course_selections
        WHERE stud_id = p_stud_id
              AND qiymet_herf = 'F'
    )
    GROUP BY ders_kod
    HAVING COUNT (*) - 1 > 0;

    v_credits       NUMBER;
    v_expenses      NUMBER := 0;
    v_credit_cost   NUMBER := 25000;
BEGIN
    FOR v_rec IN c_occurences LOOP
        v_credits := find_credits_of_subject (v_rec.ders_kod);
        v_expenses := v_expenses + v_credit_cost * v_credits * v_rec.subject_occurences;
    END LOOP;

    RETURN v_expenses;
END calculate_total_expenses;

CREATE OR REPLACE FUNCTION calculate_retake_expenses (
    p_stud_id   course_selections.stud_id%TYPE,
    p_year      course_sections.year%TYPE,
    p_term      course_sections.term%TYPE
) RETURN records_pkg.retake_expenses_table
    PIPELINED
IS

    v_result        records_pkg.retake_expenses_rec;
    v_credits       NUMBER;
    v_expenses      NUMBER := 0;
    v_credit_cost   NUMBER := 25000;
    CURSOR c_occurences IS
    SELECT DISTINCT ders_kod,
                    COUNT (*) AS subject_occurences
    FROM course_selections
    WHERE stud_id = p_stud_id
          AND year = p_year
          AND term = p_term
          AND ders_kod IN (
        SELECT DISTINCT ders_kod
        FROM course_selections
        WHERE stud_id = p_stud_id
              AND (year < p_year
                   OR (year = p_year
                       AND term < p_term))
              AND qiymet_herf = 'F'
    )
    GROUP BY ders_kod;

BEGIN
    FOR v_rec IN c_occurences LOOP
        v_credits := find_credits_of_subject (v_rec.ders_kod);
        v_expenses := v_expenses + v_credit_cost * v_credits * v_rec.subject_occurences;
    END LOOP;

    v_result.stud_id := p_stud_id;
    v_result.term_spent := v_expenses;
    v_result.total_spent := calculate_total_expenses (p_stud_id);
    v_result.year := p_year;
    v_result.term := p_term;
    PIPE ROW (v_result);
END calculate_retake_expenses;

SELECT *
FROM TABLE (calculate_retake_expenses ('005A546C9A84D7FA23670D1692540E14D5707E76', 2018, 3));

SELECT *
FROM course_selections
WHERE stud_id = '005A546C9A84D7FA23670D1692540E14D5707E76';