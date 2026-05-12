const db = require('../config/database');
const NodeCache = require('node-cache');
const approachCache = new NodeCache({ stdTTL: 3600 }); // 1 hour

// GET all approach steps
exports.getAllSteps = async (req, res) => {
  try {
    const cached = approachCache.get('all_approach');
    if (cached) return res.status(200).json({ success: true, data: cached, source: 'cache' });

    const [rows] = await db.query('SELECT * FROM approach_steps ORDER BY step ASC');
    
    approachCache.set('all_approach', rows);

    res.status(200).json({
      success: true,
      data: rows,
      source: 'database'
    });
  } catch (error) {
    console.error('Error fetching approach steps:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to fetch approach steps'
    });
  }
};
