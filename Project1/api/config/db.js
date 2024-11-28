// api/config/db.js
const sql = require('mssql');
const dotenv = require('dotenv');
const path = require('path'); 

// Load environment variables
dotenv.config({ path: path.join(__dirname, '.env') });

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
        console.log('Connected to SQL Server\n');
        return pool;
    })
    .catch(err => {
        console.error('Database connection failed:', err);
    });

module.exports = poolPromise;


