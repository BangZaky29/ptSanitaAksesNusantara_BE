const db = require('../config/database');
const NodeCache = require('node-cache');
const teamCache = new NodeCache({ stdTTL: 3600 }); // 1 hour

// GET all team members with their image data (JOIN)
exports.getAllTeamMembers = async (req, res) => {
  try {
    const cached = teamCache.get('all_team');
    if (cached) return res.status(200).json({ success: true, data: cached, source: 'cache' });

    const [rows] = await db.query(`
      SELECT 
        t.id_team,
        t.member_id,
        t.name,
        t.short_name,
        t.role,
        t.quote,
        t.bio,
        t.theme,
        t.id_image,
        i.file_name,
        i.category AS image_category,
        i.path AS image_path,
        i.type AS image_type
      FROM our_team t
      JOIN images i ON t.id_image = i.id_image
      ORDER BY t.id_team ASC
    `);

    const baseUrl = `${req.protocol}://${req.get('host')}`;
    const dataWithUrl = rows.map(row => ({
      id_team: row.id_team,
      member_id: row.member_id,
      name: row.name,
      shortName: row.short_name,
      role: row.role,
      quote: row.quote,
      bio: row.bio,
      theme: row.theme,
      image: `${baseUrl}${encodeURI(row.image_path)}`,
      image_type: row.image_type,
    }));

    teamCache.set('all_team', dataWithUrl);

    res.status(200).json({
      success: true,
      data: dataWithUrl,
      source: 'database'
    });
  } catch (error) {
    console.error('Error fetching team members:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to fetch team members'
    });
  }
};

// GET team member by member_id
exports.getTeamMemberById = async (req, res) => {
  try {
    const { id } = req.params;
    const [rows] = await db.query(`
      SELECT 
        t.id_team,
        t.member_id,
        t.name,
        t.short_name,
        t.role,
        t.quote,
        t.bio,
        t.theme,
        t.id_image,
        i.file_name,
        i.path AS image_path,
        i.type AS image_type
      FROM our_team t
      JOIN images i ON t.id_image = i.id_image
      WHERE t.member_id = ?
    `, [id]);

    if (rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Team member not found'
      });
    }

    const baseUrl = `${req.protocol}://${req.get('host')}`;
    const row = rows[0];
    const memberData = {
      id_team: row.id_team,
      member_id: row.member_id,
      name: row.name,
      shortName: row.short_name,
      role: row.role,
      quote: row.quote,
      bio: row.bio,
      theme: row.theme,
      image: `${baseUrl}${encodeURI(row.image_path)}`,
      image_type: row.image_type,
    };

    res.status(200).json({
      success: true,
      data: memberData
    });
  } catch (error) {
    console.error('Error fetching team member:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to fetch team member'
    });
  }
};
