// Create races controllers
const db = require('../config/db');

// Get all races
exports.getAllRaces = async (req, res) => {
    try {
        const [rows] = await db.query('SELECT * FROM races');
        res.json(rows);
    } catch (err) {
        res.status(500).json({ error: err.message})
    }
};

// Create a new Race
