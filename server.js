const express = require('express');
const app = express();
const port = 8080;

// BAD PRACTICE: Hardcoded secret (SonarQube will catch this!)
const DB_PASSWORD = "super_secret_password_123";

app.get('/', (req, res) => {
  res.send('Hello, Node.js DevSecOps World!');
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
