const mysql = require('mysql2/promise');

async function setupDB() {
  try {
    const connection = await mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: ''
    });
    
    console.log('Connected to MySQL server');
    
    await connection.query('DROP DATABASE IF EXISTS pt_sanita_akses_nusantara;');
    console.log('Dropped existing database');

    await connection.query('CREATE DATABASE pt_sanita_akses_nusantara;');
    console.log('Database created');
    
    await connection.query('USE pt_sanita_akses_nusantara;');
    
    await connection.query('DROP TABLE IF EXISTS images;');
    console.log('Table images dropped if existed');

    await connection.query(`
      CREATE TABLE images (
        id_image INT AUTO_INCREMENT PRIMARY KEY,
        file_name VARCHAR(255) NOT NULL,
        category VARCHAR(50) NOT NULL,
        path VARCHAR(255) NOT NULL,
        type VARCHAR(50) NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      );
    `);
    console.log('Table images created or already exists');
    
    // No dummy data here since we use seed_assets.js
    console.log('Setup complete');
    await connection.end();
  } catch (error) {
    console.error('Error setting up DB:', error);
  }
}

setupDB();
