const express = require('express');
const app = express();
const port = 8080;

// Password removed for security!

app.get('/', (req, res) => {
  res.send('Hello, Node.js DevSecOps World!');
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
