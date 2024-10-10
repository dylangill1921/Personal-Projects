// api/config/db.js
const sql = require('mssql');
const dotenv = require('dotenv');

// Load environment variables
dotenv.config();

// SQL Server configuration
const config = {
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    server: process.env.DB_HOST, 
    database: process.env.DB_NAME,
    options: {
        encrypt: false,
        enableArithAbort: true
    }
};

// Create a connection pool
let poolPromise = sql.connect(config)
    .then(pool => {
        console.log('Connected to SQL Server');
        return pool;
    })
    .catch(err => {
        console.error('Database connection failed:', err);
    });

module.exports = poolPromise;


