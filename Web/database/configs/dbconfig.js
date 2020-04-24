module.exports = {
  user: process.env.NODE_ORACLEDB_USER || "hr",
  password: process.env.NODE_ORACLEDB_PASSWORD,
  connectString:
    process.env.NODE_ORACLEDB_CONNECTIONSTRING || "localhost/orcldb",
};
