CREATE TABLE course_schedule (
    ders_kod VARCHAR2(8),
    year NUMBER,
    term NUMBER,
    ders_s_id NUMBER,
    section VARCHAR2(5),
    start_time DATE
);

CREATE TABLE course_sections (
    ders_sobe_id NUMBER,
    ders_kod VARCHAR2(8),
    year NUMBER,
    term NUMBER,
    section VARCHAR2(5),
    type VARCHAR2(2),
    emp_id NUMBER,
    message VARCHAR2(200),
    week_num NUMBER,
    hour_num NUMBER,
    emp_id_ent NUMBER,
    last_modified DATE,
    credits NUMBER
);

CREATE TABLE course_selections (
    stud_id VARCHAR2(50),
    ders_kod VARCHAR2(8),
    year NUMBER,
    term NUMBER,
    section VARCHAR2(5),
    qiymet_yuz NUMBER,
    qiymet_herf VARCHAR2(3),
    grading_type VARCHAR2(3),
    practice NUMBER,
    reg_date DATE
);

CREATE TABLE log_course_selections (
    id NUMBER,
    stud_id VARCHAR2(50),
    ders_kod VARCHAR2(8),
    year NUMBER,
    term NUMBER,
    section VARCHAR2(5),
    qiymet_yuz NUMBER,
    qiymet_herf VARCHAR2(3),
    grading_type VARCHAR2(3),
    practice NUMBER,
    reg_date DATE
);

ALTER TABLE log_course_selections ADD (
    CONSTRAINT log_selections_pk PRIMARY KEY(id));
    
CREATE SEQUENCE log_selections_seq START WITH 1;