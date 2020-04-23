CREATE OR REPLACE FUNCTION calculate_all_retakes RETURN records_pkg.all_retakes_table
    PIPELINED
IS

    v_record        records_pkg.all_retakes_rec;
    v_profit        NUMBER := 0;
    v_retakes       NUMBER;
    v_retake_cost   NUMBER := 25000;
    CURSOR c_retakes IS
    SELECT ders_kod,
           COUNT (*) - 1 AS retakes_spent
    FROM course_selections
    GROUP BY stud_id,
             ders_kod
    HAVING COUNT (*) - 1 > 0;

BEGIN
    SELECT COUNT (*)
    INTO v_retakes
    FROM course_selections
    WHERE qiymet_herf = 'F';

    FOR v_rec IN c_retakes LOOP 
        v_profit := v_profit + v_retake_cost * v_rec.retakes_spent * find_credits_of_subject (v_rec.ders_kod);
    END LOOP;

    v_record.retakes := v_retakes;
    v_record.profit := v_profit;
    PIPE ROW (v_record);
END calculate_all_retakes;

SELECT *
FROM TABLE (calculate_all_retakes ());