CREATE OR REPLACE FUNCTION find_popular_courses (
    p_year   course_selections.year%TYPE,
    p_term   course_selections.term%TYPE
) RETURN records_pkg.popular_courses_table
    PIPELINED
IS

    CURSOR c_courses IS
    SELECT DISTINCT ders_kod,
           COUNT (*) AS reg_count,
           (MAX (reg_date) - MIN (reg_date)) / COUNT (*) AS diff, year, term
    FROM course_selections
    WHERE year = p_year
          AND term = p_term
    GROUP BY ders_kod, year, term
    HAVING ((MAX (reg_date) - MIN (reg_date)) / COUNT (*) != 0
            OR MAX (reg_date) IS NULL)
           AND COUNT (*) > 30
    ORDER BY diff,
             reg_count DESC;

BEGIN
    FOR v_rec IN c_courses LOOP
        PIPE ROW (v_rec);
    END LOOP;
END find_popular_courses;

SELECT *
FROM TABLE (find_popular_courses (2019, 2));