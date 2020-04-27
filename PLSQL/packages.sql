CREATE OR REPLACE PACKAGE records_pkg IS
    TYPE popular_courses_rec IS RECORD (
        ders_kod    course_selections.ders_kod%TYPE,
        reg_count   NUMBER,
        diff        FLOAT,
        year        course_selections.year%TYPE,
        term        course_selections.term%TYPE
    );
    TYPE popular_courses_table IS
        TABLE OF popular_courses_rec;
    TYPE popular_teachers_rec IS RECORD (
        ders_kod    course_selections.ders_kod%TYPE,
        emp_id      course_sections.emp_id%TYPE,
        reg_count   NUMBER,
        diff        FLOAT,
        year        course_selections.year%TYPE,
        term        course_selections.term%TYPE
    );
    TYPE popular_teachers_table IS
        TABLE OF popular_teachers_rec;
    TYPE student_gpa_rec IS RECORD (
        stud_id   course_selections.stud_id%TYPE,
        spa       FLOAT,
        gpa       FLOAT,
        year      course_selections.year%TYPE,
        term      course_selections.term%TYPE
    );
    TYPE student_gpa_table IS
        TABLE OF student_gpa_rec;
    TYPE students_id_rec IS RECORD (
        stud_id   course_selections.stud_id%TYPE,
        year      course_selections.year%TYPE,
        term      course_selections.term%TYPE
    );
    TYPE students_id_table IS
        TABLE OF students_id_rec;
    TYPE teacher_loading_rec IS RECORD (
        emp_id   course_sections.emp_id%TYPE,
        hours    NUMBER,
        year     course_selections.year%TYPE,
        term     course_selections.term%TYPE
    );
    TYPE teacher_loading_table IS
        TABLE OF teacher_loading_rec;
    TYPE retake_expenses_rec IS RECORD (
        stud_id       course_selections.stud_id%TYPE,
        term_spent    NUMBER,
        total_spent   NUMBER,
        year          course_selections.year%TYPE,
        term          course_selections.term%TYPE
    );
    TYPE retake_expenses_table IS
        TABLE OF retake_expenses_rec;
    TYPE teacher_schedule_rec IS RECORD (
        emp_id       course_sections.emp_id%TYPE,
        ders_kod     course_selections.ders_kod%TYPE,
        section      course_sections.section%TYPE,
        day          VARCHAR2 (15),
        start_time   NUMBER,
        year         course_selections.year%TYPE,
        term         course_selections.term%TYPE
    );
    TYPE teacher_schedule_table IS
        TABLE OF teacher_schedule_rec;
    TYPE student_schedule_rec IS RECORD (
        stud_id      course_selections.stud_id%TYPE,
        ders_kod     course_selections.ders_kod%TYPE,
        section      course_sections.section%TYPE,
        day          VARCHAR2 (15),
        start_time   NUMBER,
        year         course_selections.year%TYPE,
        term         course_selections.term%TYPE
    );
    TYPE student_schedule_table IS
        TABLE OF student_schedule_rec;
    TYPE subjects_number_rec IS RECORD (
        stud_id          course_selections.stud_id%TYPE,
        subjects_count   NUMBER,
        credits_count    NUMBER,
        year             course_selections.year%TYPE,
        term             course_selections.term%TYPE
    );
    TYPE subjects_number_table IS
        TABLE OF subjects_number_rec;
    TYPE clever_flow_rec IS RECORD (
        emp_id           course_sections.emp_id%TYPE,
        ders_kod         course_sections.ders_kod%TYPE,
        section          course_sections.section%TYPE,
        average_rating   FLOAT,
        year             course_selections.year%TYPE,
        term             course_selections.term%TYPE
    );
    TYPE clever_flow_table IS
        TABLE OF clever_flow_rec;
    TYPE teachers_rating_rec IS RECORD (
        emp_id           course_sections.emp_id%TYPE,
        average_rating   FLOAT,
        year             course_selections.year%TYPE,
        term             course_selections.term%TYPE
    );
    TYPE teachers_rating_table IS
        TABLE OF teachers_rating_rec;
    TYPE courses_rating_rec IS RECORD (
        ders_kod         course_sections.ders_kod%TYPE,
        average_rating   FLOAT,
        year             course_selections.year%TYPE,
        term             course_selections.term%TYPE
    );
    TYPE courses_rating_table IS
        TABLE OF courses_rating_rec;
    TYPE all_retakes_rec IS RECORD (
        retakes   NUMBER,
        profit    NUMBER
    );
    TYPE all_retakes_table IS
        TABLE OF all_retakes_rec;
END records_pkg;