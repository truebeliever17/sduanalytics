CREATE OR REPLACE FUNCTION find_popular_teachers (
    p_ders_kod   course_selections.ders_kod%TYPE,
    p_year       course_selections.year%TYPE,
    p_term       course_selections.term%TYPE
) RETURN records_pkg.popular_teachers_table
    PIPELINED
IS

    CURSOR c_emps IS
    SELECT emp.emp_id,
           COUNT (*) AS reg_count,
           (MAX (reg_date) - MIN (reg_date)) / COUNT (*) AS diff, emp.year, emp.term
    FROM course_selections   stud
    JOIN course_sections     emp ON stud.ders_kod = emp.ders_kod
                                AND stud.section = emp.section
                                AND stud.year = emp.year
                                AND stud.term = emp.term
    WHERE stud.ders_kod = p_ders_kod
          AND stud.year = p_year
          AND stud.term = p_term
    GROUP BY emp.emp_id, emp.year, emp.term
    HAVING ((MAX (reg_date) - MIN (reg_date)) / COUNT (*) != 0
            OR MAX (reg_date) IS NULL)
           AND COUNT (*) > 30
    ORDER BY diff,
             reg_count DESC;

BEGIN
    FOR v_rec IN c_emps LOOP
        PIPE ROW (v_rec);
    END LOOP;
END find_popular_teachers;

SELECT *
FROM TABLE (find_popular_teachers ('MAT 251', 2019, 1));