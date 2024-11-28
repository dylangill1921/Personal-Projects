const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const dotenv = require('dotenv');

dotenv.config();

const app = express();
const port = process.env.PORT || 3000;

app.use(cors());
app.use(bodyParser.json());

// Logging middleware
app.use((req, res, next) => {
    console.log(`Received ${req.method} request for '${req.url}'`);
    next();
});

// API Routes
const driversRoutes = require('./routes/driversRoute'); 
const constructorsRoutes = require('./routes/constructorsRoute'); 
const tracksRoutes = require('./routes/tracksRoute');

app.use('/api/drivers', driversRoutes); 
app.use('/api/constructors', constructorsRoutes);
app.use('/api/tracks', tracksRoutes);

// Test route
app.get('/api/test', (req, res) => {
    res.json({ message: 'API is working' });
});

// Catch-all route for 404 errors
app.use((req, res) => {
    res.status(404).json({ error: 'Resource not found' });
});

// Start server
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
