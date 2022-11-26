const mysql = require('mysql');
const config = require('./config');

const pool = mysql.createPool({
    host: config.development.host,
    user: config.development.user,
    password: config.development.password,
    database: config.development.database
});

// getConnection을 통해 다른 js파일에서는
// pool에서 connection을 받아오고 처리하도록 해준다.
function getConnection(callback) {
    pool.getConnection(function(err, conn) {
        if(!err) {
            callback(conn);
        }
    });
}

module.exports = getConnection;
