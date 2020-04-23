CREATE OR REPLACE FUNCTION create_student_schedule (
    p_stud_id   course_selections.stud_id%TYPE,
    p_year      course_sections.year%TYPE,
    p_term      course_sections.term%TYPE
) RETURN records_pkg.student_schedule_table
    PIPELINED
IS

    CURSOR c_subjects IS
    SELECT p_stud_id,
           schedule.ders_kod,
           schedule.section,
           to_char (start_time, 'Day') AS day,
           to_number (to_char (start_time, 'HH24')) AS start_time,
           p_year,
           p_term
    FROM course_selections   students
    JOIN course_schedule     schedule ON schedule.year = students.year
                                     AND schedule.term = students.term
                                     AND schedule.section = students.section
                                     AND schedule.ders_kod = students.ders_kod
    WHERE stud_id = p_stud_id
          AND schedule.year = p_year
          AND schedule.term = p_term
    ORDER BY to_char (schedule.start_time, 'D'),
             start_time;

BEGIN
    FOR v_rec IN c_subjects LOOP
        PIPE ROW (v_rec);
    END LOOP;
END create_student_schedule;

SELECT *
FROM TABLE (create_student_schedule ('3F2F30658127C29328718C132E7C71CE6BD484D8', 2019, 2));