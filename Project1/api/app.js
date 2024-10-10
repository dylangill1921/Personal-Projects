// api/app.js
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const dotenv = require('dotenv');

// Load environment variables
dotenv.config();

const app = express();
const port = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Routes
const driversRoutes = require('./routes/driversRoutes');
app.use('/api', driversRoutes);

// Start server
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});