// 환경변수를 조회하기 위한 코드 작성

const dotenv = require('dotenv');

dotenv.config();

const config = {
    port: 3000,
    development: {
        host: process.env.DATABASE_HOST,
        user: process.env.DATABASE_USER,
        password: process.env.DATABASE_PASSWORD,
        database: process.env.DATABASE_NAME
    },
    test: {
        host: process.env.DATABASE_HOST,
        user: process.env.DATABASE_USER,
        password: process.env.DATABASE_PASSWORD,
        database: process.env.DATABASE_NAME
    }
};

module.exports = config;