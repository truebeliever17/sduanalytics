CREATE OR REPLACE FUNCTION find_courses_rating (
    p_year   course_sections.year%TYPE,
    p_term   course_sections.term%TYPE
) RETURN records_pkg.courses_rating_table
    PIPELINED
IS

    CURSOR c_ratings IS
    SELECT ders_kod,
           AVG (qiymet_yuz) / 10 AS avg_rating,
           p_year,
           p_term
    FROM course_selections
    WHERE year = p_year
          AND term = p_term
    GROUP BY ders_kod
    ORDER BY avg_rating DESC;

BEGIN
    FOR v_rec IN c_ratings LOOP
        PIPE ROW (v_rec);
    END LOOP;
END find_courses_rating;

SELECT *
FROM TABLE (find_courses_rating (2018, 2));