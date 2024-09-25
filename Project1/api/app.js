const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const dotenv = require('dotenv');

// Load environment variables
dotenv.gitignore();

const app = express();
const port = process.env.port || 3000;

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Routes
const apiRoutes = require('./routes/apiRoutes');
app.use('/api', apiRoutes);

// Start server
app.listen(port, () => {
    console.log('Server is runing on port ${port}');
});