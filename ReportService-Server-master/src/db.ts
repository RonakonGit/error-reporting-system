import mysql, { Connection } from 'mysql';
const connection: Connection = mysql.createConnection({
    user: process.env.MYSQL_USER ? process.env.MYSQL_USER : 'root',
    password: process.env.MYSQL_PASSWORD ? process.env.MYSQL_PASSWORD : "",
    database: process.env.MYSQL_DATABASE ? process.env.MYSQL_DATABASE : "ReportService"
});
connection.connect((err) => {
    if (err) console.error(err);
    else console.log("Logs: \x1b[32mConnection to Mysql established\x1b[0m");
});
export default connection;