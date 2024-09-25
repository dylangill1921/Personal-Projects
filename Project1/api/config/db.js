// api/config/db.js
const mysql = reuire('mysql');
const dotenv = require('dotenv');

// Load environment variables
dotenv.config({path: '/.gitignore/.env'});

// Connection pool
const pool = mysql.createPool({
    connectionLimit: 10,
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
});

const promisePool = pool.promise();

module.exports = promisePool;

