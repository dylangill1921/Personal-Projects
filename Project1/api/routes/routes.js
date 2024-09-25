// Api Routes
const express = require('express');
const router = express.Router();

const racesController = require('../controllers/resultController');

// Define routers for results
router.get('/results', racesController.getAllRaces);
router.post('/results', racesController.createRaces);

module.exports = router;
