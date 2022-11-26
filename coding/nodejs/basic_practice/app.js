const express = require('express');
const bodyParser = require('body-parser');

const config = require('./config/config')
const getConnection = require('./config/database')

const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

getConnection((conn) => {
    conn.query();
    
    conn.release();
});

// app.listen() 함수를 사용해서 서버를 실행해준다.
app.listen(config.port, () => {
    console.log('서버 실행. http://localhost:${port}');
});