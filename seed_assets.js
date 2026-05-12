const mysql = require('mysql2/promise');
const fs = require('fs').promises;
const path = require('path');
require('dotenv').config();

const assetsDir = path.join(__dirname, '../assets');

async function seedAssets() {
  try {
    const connection = await mysql.createConnection({
      host: process.env.DB_HOST || 'localhost',
      user: process.env.DB_USER || 'root',
      password: process.env.DB_PASSWORD || '',
      database: process.env.DB_NAME || 'pt_sanita_akses_nusantara'
    });

    console.log('Connected to MySQL server');

    // Kosongkan tabel
    await connection.query('SET FOREIGN_KEY_CHECKS = 0');
    await connection.query('TRUNCATE TABLE images');
    await connection.query('SET FOREIGN_KEY_CHECKS = 1');
    console.log('Table images cleared');

    // Baca folder assets
    const folders = ['logo', 'people', 'catalog'];

    for (const folder of folders) {
      const folderPath = path.join(assetsDir, folder);
      try {
        const files = await fs.readdir(folderPath);
        for (const file of files) {
          // Hanya file gambar
          if (!file.toLowerCase().endsWith('.png') && !file.toLowerCase().endsWith('.jpg') && !file.toLowerCase().endsWith('.jpeg')) {
            continue;
          }

          let type = 'non-transparant';
          if (file.toLowerCase().includes('(transparent)')) {
            type = 'transparant';
          } else if (file.toLowerCase().includes('(non transparent)')) {
            type = 'non-transparant';
          }

          const dbPath = `/assets/${folder}/${file}`;
          
          await connection.query(
            'INSERT INTO images (file_name, category, path, type) VALUES (?, ?, ?, ?)',
            [file, folder, dbPath, type]
          );
          console.log(`Inserted: ${file}`);
        }
      } catch (err) {
        console.log(`Folder ${folder} not found or error reading:`, err.message);
      }
    }

    console.log('All assets seeded successfully.');
    await connection.end();

  } catch (error) {
    console.error('Error seeding assets:', error);
  }
}

seedAssets();
