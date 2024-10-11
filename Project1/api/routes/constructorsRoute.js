// API routes
const express = require('express');
const router = express.Router();

// Import constructors controller
const constructorsController = require('../controllers/constructorsController');

// Define the GET route for fetching constructors
router.get('/', constructorsController.getAllConstructors);

module.exports = router;