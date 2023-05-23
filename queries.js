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
            console.error(error);
        }
        response.status(200).json(results.rows);
    });
};

const getUser = (request, response) => {
    const id = parseInt(request.params.id);
    pool.query('SELECT * FROM users WHERE id = $1', [id], (error, results) => {
        if (error) {
            console.error(error);
        }
        response.status(200).json(results.rows);
    });
};



module.exports = {
    getUsers,
    getUser
}