require('dotenv').config();
const Pool = require('pg').Pool;
const pool = new Pool({
    user: 'banari',
    host: 'localhost',
    database: 'esgi_pa_user_api',
    password: process.env.PASSWORD,
    port: 5433
});

const getUsers = (request, response) => {
    console.log("Getting to users path");
    pool.query('SELECT * FROM users ORDER BY id ASC',(error, results) => {
        if (error) {
            response.status(404).send(error);
        }
        response.status(200).json(results.rows);
    });
};

const getUser = (request, response) => {
    const id = parseInt(request.params.id);
    pool.query('SELECT * FROM users WHERE id = $1', [id], (error, results) => {
        if (error) {
            response.status(404).send(error);
        }
        response.status(200).json(results.rows);
    });
};

const createUser = (request, response) => {
    const {name, email, password} = request.body;
    pool.query('INSERT INTO, users (username, email, password) VALUES ($1,$2,$3) RETURNING *', [name, email, password], (error ,results) => {
        if (error) {
            response.status(404).send(error);
        }
        response.status(201).send(`User added with ID: ${results.rows[0].id}`);
    });
};

const updateUser = (request, response) => {
    const id = parseInt(request.params.id);
    const {name, email, password} = request.body;
    pool.query(
        'UPDATE users SET username = $1, email = $2, password = $3 WHERE id = $4',
        [name, email, password, id],
        (error, results) => {
            if (error) {
                response.status(404).send(error);
            }
            response.status(200).send(`User modified with ID: ${id}`);
        }
    );
};

const deleteUser = (request, response) => {
    const id = parseInt(request.params.id);

    pool.query('DELETE FROM users WHERE id = $1', [id], (error, results) => {
        if (error) {
            response.status(404).send(error);
        }
        response.status(200).send(`User deleted with ID: ${id}`);
    });
};


module.exports = {
    getUsers,
    getUser,
    createUser,
    updateUser,
    deleteUser
};