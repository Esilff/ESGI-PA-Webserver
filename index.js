require('dotenv').config();
const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const PORT = process.env.PORT;
const db = require('./queries.js');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true,
}));

app.get('/', (request, response) => {
    response.json({info: 'Node JS/Express JS server for Hyper Rush User database api'});
});

app.get('/users', db.getUsers);

app.get('/users/:id', db.getUser);

app.listen(PORT, () => {
    console.log(`Server is running at http://localhost:${PORT}`);
});

