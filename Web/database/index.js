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
      ];
      for (query_set of queries) {
        let permutations = await connection.execute(query_set[1], []);
        let arr = [];
        console.log(permutations.rows);
        for (instance of permutations.rows) {
          let query_result = await connection.execute(query_set[0], instance, {
            outFormat: oracledb.OUT_FORMAT_OBJECT,
          });
          arr = arr.concat(query_result.rows);
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
