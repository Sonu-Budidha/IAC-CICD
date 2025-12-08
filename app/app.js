const express = require('express');
const app = express();
const port = 8080;

app.get('/', (req, res) => {
	  res.send('Hello from Dockerized Node.js App! 🚀');
});

app.listen(port, () => {
	  console.log(`App running on port ${port}`);
});

