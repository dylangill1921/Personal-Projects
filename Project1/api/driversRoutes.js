// API routes
const express = require('express');
const router = express.Router();
const driversController = require('./driversController'); 

// Define routers for drivers
router.get('/drivers', driversController.getAllDrivers); 

module.exports = router;
