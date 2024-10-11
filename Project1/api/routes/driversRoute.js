// API routes
const express = require('express');
const router = express.Router();

// Import the drivers controller
const driversController = require('../controllers/driversController');

// Define the GET route for fetching drivers
router.get('/', driversController.getAllDrivers);

module.exports = router;