// API routes
const express = require('express');
const router = express.Router();

// Import the drivers controller
const driversController = require('./driversController');

// Define the GET route for fetching drivers
router.get('/drivers', driversController.getAllDrivers);

module.exports = router;