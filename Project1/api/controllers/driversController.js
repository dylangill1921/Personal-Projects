// api/driversController.js
const poolPromise = require('../config/db.js'); 

// Function to get all drivers
const getAllDrivers = async (req, res) => {
    console.log('Fetching all drivers...');
    try {
        const pool = await poolPromise;
        const result = await pool.request().query(`
            SELECT 
                d.DriverID,
                d.firstName,
                d.lastName,
                d.dateOfBirth,
                d.born,
                d.number,
                c.teamName
            FROM drivers d
            INNER JOIN constructors c ON d.TeamID = c.TeamID
            ORDER BY c.teamName;
        `);
        res.status(200).json(result.recordset);
    } catch (error) {
        console.error('Error fetching drivers:', error);
        res.status(500).json({ error: 'An error occurred while fetching drivers.' });
    }
};


module.exports = { getAllDrivers };
