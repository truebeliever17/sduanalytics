CREATE OR REPLACE FUNCTION find_teachers_rating (
    p_year   course_sections.year%TYPE,
    p_term   course_sections.term%TYPE
) RETURN records_pkg.teachers_rating_table
    PIPELINED
IS

    CURSOR c_ratings IS
    SELECT teachers.emp_id,
           AVG (students.qiymet_yuz) / 10 AS avg_rating,
           p_year,
           p_term
    FROM course_selections   students
    JOIN course_sections     teachers ON students.ders_kod = teachers.ders_kod
                                     AND students.year = teachers.year
                                     AND students.term = teachers.term
                                     AND students.section = teachers.section
    WHERE students.year = p_year
          AND students.term = p_term
    GROUP BY teachers.emp_id
    ORDER BY avg_rating DESC;

BEGIN
    FOR v_rec IN c_ratings LOOP
        PIPE ROW (v_rec);
    END LOOP;
END find_teachers_rating;

SELECT *
FROM TABLE (find_teachers_rating (2018, 2));