const oracledb = require("oracledb");
const dbConfig = require("./configs/dbconfig.js");
const fs = require("fs");
const path = require("path");

async function run() {
  let pool;

  try {
    pool = await oracledb.createPool(dbConfig);

    let connection;
    try {
      connection = await pool.getConnection();
      let queries = [
        [
          "SELECT * FROM TABLE(find_popular_courses(:year, :term))",
          `SELECT DISTINCT year, term FROM course_selections`,
          "popular_courses.json",
        ],
        [
          "SELECT * FROM TABLE(find_popular_teachers(:ders_kod, :year, :term))",
          `SELECT DISTINCT ders_kod, year, term FROM course_selections`,
          "popular_teachers.json",
        ],
        [
          "SELECT * FROM TABLE(find_spa_and_gpa(:stud_id, :year, :term))",
          `SELECT DISTINCT stud_id, year, term FROM course_selections`,
          "gpa.json",
        ],
        [
          "SELECT * FROM TABLE(find_nonregistered_students(:year, :term))",
          `SELECT DISTINCT year, term FROM course_selections`,
          "nonregistered_students.json",
        ],
        [
          "SELECT * FROM TABLE(calculate_retake_expenses(:stud_id, :year, :term))",
          `SELECT DISTINCT stud_id, year, term FROM course_selections`,
          "retake_expenses.json",
        ],
        [
          "SELECT * FROM TABLE(calculate_teacher_loading(:emp_id, :year, :term))",
          `SELECT DISTINCT emp_id, year, term FROM course_sections`,
          "teachers_loading.json",
        ],
        [
          "SELECT * FROM TABLE(create_student_schedule(:stud_id, :year, :term))",
          `SELECT DISTINCT stud_id, year, term FROM course_selections`,
          "students_schedule.json",
        ],
        [
          "SELECT * FROM TABLE(create_teacher_schedule(:emp_id, :year, :term))",
          `SELECT DISTINCT emp_id, year, term FROM course_sections`,
          "teachers_schedule.json",
        ],
        [
          "SELECT * FROM TABLE(calculate_number_of_subjects(:stud_id, :year, :term))",
          `SELECT DISTINCT stud_id, year, term FROM course_selections`,
          "students_number_of_subjects.json",
        ],
        [
          "SELECT * FROM TABLE(find_most_clever_flow(:emp_id, :ders_kod, :year, :term))",
          `SELECT DISTINCT emp_id, ders_kod, year, term FROM course_sections WHERE emp_id IS NOT NULL`,
          "most_clever_flows.json",
        ],
        [
          "SELECT * FROM TABLE(find_teachers_rating(:year, :term))",
          `SELECT DISTINCT year, term FROM course_sections`,
          "teachers_rating.json",
        ],
        [
          "SELECT * FROM TABLE(find_courses_rating(:year, :term))",
          `SELECT DISTINCT year, term FROM course_selections`,
          "courses_rating.json",
        ],
        [
          "SELECT * FROM TABLE(calculate_all_retakes())",
          "",
          "all_retakes_info.json",
        ],
      ];

      for (query_set of queries) {
        let arr = [];
        if (query_set[1].length < 1) {
          let query_result = await connection.execute(
            query_set[0],
            {},
            {
              outFormat: oracledb.OUT_FORMAT_OBJECT,
            }
          );
          arr = query_result.rows;
        } else {
          let permutations = await connection.execute(query_set[1], []);
          console.log(permutations.rows);
          for (instance of permutations.rows) {
            let query_result = await connection.execute(
              query_set[0],
              instance,
              {
                outFormat: oracledb.OUT_FORMAT_OBJECT,
              }
            );
            arr = arr.concat(query_result.rows);
          }
        }
        let json = JSON.stringify(arr);
        fs.writeFile(
          path.join(__dirname, "./json/" + query_set[2]),
          json,
          "utf8",
          function(err) {
            if (err) {
              console.log(err);
            }
          }
        );
      }
    } catch (err) {
      throw err;
    } finally {
      if (connection) {
        try {
          await connection.close();
        } catch (err) {
          throw err;
        }
      }
    }
  } catch (err) {
    console.error(err.message);
  } finally {
    await pool.close(0);
  }
}

run();
