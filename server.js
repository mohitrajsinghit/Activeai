const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const port = 3000;

app.use(cors());
app.use(bodyParser.json());

let userData = {};

app.post('/gender', (req, res) => {
  const { userId, gender } = req.body;
  userData[userId] = { gender };
  console.log(`User ID: ${userId}, Gender: ${gender}`);
  res.status(200).send({ message: 'Gender updated successfully' });
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
