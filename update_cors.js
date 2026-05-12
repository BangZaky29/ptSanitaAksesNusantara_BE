const fs = require('fs');
const path = '/home/nuansasolution/apps/company-profile/ptSanitaAksesNusantara_BE/index.js';
let content = fs.readFileSync(path, 'utf8');
content = content.replace(/origin: \[.*?\]/, "origin: '*'");
fs.writeFileSync(path, content);
console.log('CORS updated to wildcard');
