CREATE OR REPLACE FUNCTION find_most_clever_flow (
    p_emp_id     course_sections.emp_id%TYPE,
    p_ders_kod   course_selections.ders_kod%TYPE,
    p_year       course_sections.year%TYPE,
    p_term       course_sections.term%TYPE
) RETURN records_pkg.clever_flow_table
    PIPELINED
IS
    v_record       records_pkg.clever_flow_rec;
    v_section      course_sections.section%TYPE;
    v_avg_rating   FLOAT;
BEGIN
    SELECT section,
           average_rating
    INTO
        v_section,
        v_avg_rating
    FROM (
        SELECT teachers.section,
               AVG (students.qiymet_yuz) AS average_rating
        FROM course_selections   students
        JOIN course_sections     teachers ON students.ders_kod = teachers.ders_kod
                                         AND students.year = teachers.year
                                         AND students.term = teachers.term
                                         AND students.section = teachers.section
        WHERE teachers.emp_id = p_emp_id
              AND teachers.ders_kod = p_ders_kod
              AND teachers.year = p_year
              AND teachers.term = p_term
        GROUP BY teachers.section
        ORDER BY average_rating DESC
    )
    WHERE ROWNUM < 2;

    v_record.section := v_section;
    v_record.average_rating := v_avg_rating;
    v_record.emp_id := p_emp_id;
    v_record.ders_kod := p_ders_kod;
    v_record.year := p_year;
    v_record.term := p_term;
    PIPE ROW (v_record);
END find_most_clever_flow;

SELECT *
FROM TABLE (find_most_clever_flow (10301, 'INF 354', 2019, 1));