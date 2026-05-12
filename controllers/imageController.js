const db = require('../config/database');
const NodeCache = require('node-cache');
const sharp = require('sharp');
const path = require('path');
const fs = require('fs');

// Cache for 10 minutes
const imageCache = new NodeCache({ stdTTL: 600 });

// GET all images (supports ?category=logo&type=transparant filters)
exports.getAllImages = async (req, res) => {
  try {
    const { category, type } = req.query;
    const cacheKey = `images_${category || 'all'}_${type || 'all'}`;

    // Return cached data if available
    const cachedData = imageCache.get(cacheKey);
    if (cachedData) {
      return res.status(200).json({
        success: true,
        data: cachedData,
        source: 'cache'
      });
    }
    
    // SQL query with display_name cleaning directly from DB
    let query = `
      SELECT *, 
        TRIM(REPLACE(REPLACE(REPLACE(REPLACE(
          SUBSTRING_INDEX(file_name, '.', 1), 
          '(NON TRANSPARENT)', ''), 
          '(TRANSPARENT)', ''), 
          '_', ' '),
          '-', ' '
        )) as display_name
      FROM images
    `;
    
    const params = [];
    const conditions = [];

    if (category) {
      conditions.push('category = ?');
      params.push(category);
    }
    if (type) {
      conditions.push('type = ?');
      params.push(type);
    }

    if (conditions.length > 0) {
      query += ' WHERE ' + conditions.join(' AND ');
    }
    query += ' ORDER BY created_at DESC';

    const [rows] = await db.query(query, params);
    
    // Add full URL and WebP option
    const baseUrl = `${req.protocol}://${req.get('host')}`;
    const dataWithUrl = rows.map(row => ({
      ...row,
      full_url: `${baseUrl}${encodeURI(row.path)}`,
      webp_url: `${baseUrl}/api/images/webp/${row.id_image}` // New WebP endpoint
    }));

    // Save to cache
    imageCache.set(cacheKey, dataWithUrl);

    res.status(200).json({
      success: true,
      data: dataWithUrl,
      source: 'database'
    });
  } catch (error) {
    console.error('Error fetching images:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to fetch images'
    });
  }
};

/**
 * NEW: Serve image as WebP format using Sharp
 */
exports.serveWebP = async (req, res) => {
  try {
    const { id } = req.params;
    const [rows] = await db.query('SELECT path FROM images WHERE id_image = ?', [id]);
    
    if (rows.length === 0) {
      return res.status(404).json({ success: false, message: 'Image not found' });
    }

    const relativePath = rows[0].path;
    const absolutePath = path.join(__dirname, '../../', relativePath);

    if (!fs.existsSync(absolutePath)) {
      return res.status(404).json({ success: false, message: 'File not found on disk' });
    }

    // Process image with Sharp
    res.set('Content-Type', 'image/webp');
    res.set('Cache-Control', 'public, max-age=31536000, immutable');

    sharp(absolutePath)
      .webp({ quality: 80 })
      .pipe(res);

  } catch (error) {
    console.error('Error processing WebP:', error);
    res.status(500).send('Error processing image');
  }
};

// GET image by ID
exports.getImageById = async (req, res) => {
  try {
    const { id } = req.params;
    const [rows] = await db.query('SELECT * FROM images WHERE id_image = ?', [id]);
    
    if (rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Image not found'
      });
    }

    const baseUrl = `${req.protocol}://${req.get('host')}`;
    const imageData = {
      ...rows[0],
      full_url: `${baseUrl}${rows[0].path}`
    };

    res.status(200).json({
      success: true,
      data: imageData
    });
  } catch (error) {
    console.error('Error fetching image by ID:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to fetch image'
    });
  }
};

// POST new image
exports.createImage = async (req, res) => {
  try {
    const { file_name, category, path, type } = req.body;

    // Validate required fields
    if (!file_name || !category || !path || !type) {
      return res.status(400).json({
        success: false,
        message: 'Please provide all required fields: file_name, category, path, type'
      });
    }

    const [result] = await db.query(
      'INSERT INTO images (file_name, category, path, type) VALUES (?, ?, ?, ?)',
      [file_name, category, path, type]
    );

    res.status(201).json({
      success: true,
      message: 'Image created successfully',
      data: {
        id_image: result.insertId,
        file_name,
        category,
        path,
        type
      }
    });
  } catch (error) {
    console.error('Error creating image:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to create image'
    });
  }
};

// DELETE image
exports.deleteImage = async (req, res) => {
  try {
    const { id } = req.params;
    const [result] = await db.query('DELETE FROM images WHERE id_image = ?', [id]);
    
    if (result.affectedRows === 0) {
      return res.status(404).json({
        success: false,
        message: 'Image not found'
      });
    }

    res.status(200).json({
      success: true,
      message: 'Image deleted successfully'
    });
  } catch (error) {
    console.error('Error deleting image:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to delete image'
    });
  }
};
