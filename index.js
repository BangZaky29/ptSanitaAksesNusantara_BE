require('dotenv').config();
const express = require('express');
const cors = require('cors');
const path = require('path');
const helmet = require('helmet');
const compression = require('compression');
const rateLimit = require('express-rate-limit');

const app = express();

// Security & Performance Middlewares
app.use(helmet({
  crossOriginResourcePolicy: { policy: "cross-origin" } // Allow frontend to load images
}));
app.use(compression()); // Gzip/Brotli compression

// Rate Limiting to prevent spam/DDoS
const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 150, // Limit each IP to 150 requests per windowMs
  standardHeaders: true,
  legacyHeaders: false,
  message: { error: "Too many requests, please try again later." }
});
app.use('/api', limiter); // Apply rate limiter to all API routes

// Middleware
app.use(cors({
  origin: '*',
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  credentials: true,
}));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Serve static assets
// Agar karakter spesial seperti spasi tertangani dengan baik di express.static
app.use('/assets', express.static(path.join(__dirname, '../assets')));

// Routes
const imageRoutes = require('./routes/imageRoutes');
const teamRoutes = require('./routes/teamRoutes');
const clientRoutes = require('./routes/clientRoutes');
const businessRoutes = require('./routes/businessRoutes');
const approachRoutes = require('./routes/approachRoutes');

// Health Check Route
app.get('/api/health', (req, res) => {
  res.status(200).json({
    status: 'OK',
    timestamp: new Date().toISOString(),
    uptime: process.uptime()
  });
});

app.use('/api/images', imageRoutes);
app.use('/api/team', teamRoutes);
app.use('/api/clients', clientRoutes);
app.use('/api/business', businessRoutes);
app.use('/api/approach', approachRoutes);

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});