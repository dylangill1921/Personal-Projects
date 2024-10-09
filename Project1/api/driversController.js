// Create drivers controllers
const promisePool = require('./db.js');

// Get first 21 drivers
const getAllDrivers = async (req, res) => {
    try {
        const [rows] = await promisePool.query('SELECT * FROM drivers LIMIT 21');
        res.status(200).json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'An error occurred while fetching drivers.' });
    }
};

// Export the function
module.exports = { getAllDrivers };
