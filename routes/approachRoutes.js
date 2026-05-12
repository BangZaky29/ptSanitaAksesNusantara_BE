const express = require('express');
const router = express.Router();
const approachController = require('../controllers/approachController');

router.get('/', approachController.getAllSteps);

module.exports = router;
