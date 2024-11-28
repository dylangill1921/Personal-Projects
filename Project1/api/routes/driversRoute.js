// Driver routes
const express = require('express');
const router = express.Router();

// Import drivers controller
const driversController = require('../controllers/driversController.js');

// Define the GET route for fetching drivers
router.get('/', driversController.getAllDrivers);

module.exports = router;
