const db = require('../config/database');
const NodeCache = require('node-cache');
const businessCache = new NodeCache({ stdTTL: 3600 }); // 1 hour

// GET all core business with items
exports.getAllBusiness = async (req, res) => {
  try {
    const cached = businessCache.get('all_business');
    if (cached) return res.status(200).json({ success: true, data: cached, source: 'cache' });

    const [businesses] = await db.query('SELECT * FROM core_business ORDER BY created_at ASC');
    const [items] = await db.query('SELECT * FROM core_business_items');

    const formattedData = businesses.map(bus => ({
      ...bus,
      items: items
        .filter(item => item.business_id === bus.id)
        .map(item => item.item_name)
    }));

    businessCache.set('all_business', formattedData);

    res.status(200).json({
      success: true,
      data: formattedData,
      source: 'database'
    });
  } catch (error) {
    console.error('Error fetching core business:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to fetch core business'
    });
  }
};
