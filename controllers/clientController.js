const db = require('../config/database');

// GET all clients
exports.getAllClients = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM clients ORDER BY id_client ASC');
    
    res.status(200).json({
      success: true,
      data: rows
    });
  } catch (error) {
    console.error('Error fetching clients:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to fetch clients'
    });
  }
};
