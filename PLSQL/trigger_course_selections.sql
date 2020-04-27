CREATE OR REPLACE TRIGGER trig_course_selections BEFORE
    INSERT ON course_selections
    FOR EACH ROW
DECLARE
    v_id NUMBER;
BEGIN
    SELECT log_selections_seq.NEXTVAL
    INTO v_id
    FROM dual;

    INSERT INTO log_course_selections VALUES (
        v_id,
        :new.stud_id,
        :new.ders_kod,
        :new.year,
        :new.term,
        :new.section,
        :new.qiymet_yuz,
        :new.qiymet_herf,
        :new.grading_type,
        :new.practice,
        :new.reg_date
    );

END;

INSERT INTO course_selections VALUES (
    'ABCDKASDASDASDSADASFASDSA',
    'MAT 251',
    2019,
    2,
    '01',
    100,
    'A',
    'N',
    20406,
    sysdate
);

COMMIT;