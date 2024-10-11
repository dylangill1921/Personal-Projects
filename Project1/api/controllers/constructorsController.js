// api/constructorsController.js
const poolPromise = require('../config/db.js'); 

// Function to get all drivers
const getAllConstructors = async (req, res) => {
    try {
        // Wait for the connection pool
        const pool = await poolPromise;

        // Execute the SQL query
        const result = await pool.request().query('SELECT TOP 10 * FROM constructors;');
        
        // Send back the results
        res.status(200).json(result.recordset);
    } catch (error) {
        console.error('Error fetching constructors:', error);
        res.status(500).json({ error: 'An error occurred while fetching constructors info.' });
    }
};

module.exports = { getAllConstructors };