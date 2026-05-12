const express = require('express');
const router = express.Router();
const teamController = require('../controllers/teamController');

// Routes for team members
router.get('/', teamController.getAllTeamMembers);
router.get('/:id', teamController.getTeamMemberById);

module.exports = router;
