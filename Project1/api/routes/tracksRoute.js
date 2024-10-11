// API routes
const express = require('express');
const router = express.Router();

// Import tracks controller
const tracksController = require('../controllers/tracksController');

// Define the GET route for fetching tracks
router.get('/', tracksController.getAllTracks);

module.exports = router;