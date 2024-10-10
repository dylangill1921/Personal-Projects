// api/driversController.js
const poolPromise = require('./db.js'); 

// Function to get all drivers
const getAllDrivers = async (req, res) => {
    try {
        // Wait for the connection pool
        const pool = await poolPromise;

        // Execute the SQL query
        const result = await pool.request().query('SELECT TOP 21 * FROM drivers;');
        
        // Send back the results
        res.status(200).json(result.recordset);
    } catch (error) {
        console.error('Error fetching drivers:', error);
        res.status(500).json({ error: 'An error occurred while fetching drivers.' });
    }
};

module.exports = { getAllDrivers };
