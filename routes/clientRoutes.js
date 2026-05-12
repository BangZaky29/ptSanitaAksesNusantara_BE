const express = require('express');
const router = express.Router();
const clientController = require('../controllers/clientController');

// Routes for clients
router.get('/', clientController.getAllClients);

module.exports = router;
