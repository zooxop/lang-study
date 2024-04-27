import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { Col, Row, Button, Container, InputGroup, Form } from 'react-bootstrap';

const Blogs = () => {
    const [blogs, setBlogs] = useState([]);
    const [page, setPage] = useState(1);
    const [loading, setLoading] = useState(false);
    const [is_end, setIs_end] = useState(false);
    const [query, setQuery] = useState('부산여행');
    const textStyle = { color: 'gray' }; // 회색 글씨 스타일 정의

    const callAPI = async () => {
        const url = `https://dapi.kakao.com/v2/search/blog?query=${query}&size=3&page=${page}`;
        const config = {
            headers: {
                "Authorization": "KakaoAK a9c177322b9b68faa0a497e8b4f1d4d3"
            }
        }

        setLoading(true);

        const response = await axios.get(url, config);
        const data = response.data;

        console.log(data);

        setBlogs(data.documents);

        setIs_end(data.meta.is_end);
        setTimeout(() => {
            setLoading(false);
        }, 100);
    }

    const onSubmit = (e) => {
        e.preventDefault();  // Refresh 방지
        setPage(1);
        callAPI();
    }

    useEffect(() => {
        callAPI();
    }, [page]);

    return (
        <div>
            <h1 className='my-5'>블로그 검색</h1>

            <Row className='mx-5 mb-3'>
                <Col md={4} lg={6}>
                    <form onSubmit={onSubmit}>
                        <InputGroup>
                            <Form.Control value={query} onChange={(e) => setQuery(e.target.value)} />
                            <Button type='submit'>검색</Button>
                        </InputGroup>
                    </form>
                </Col>
            </Row>
            <Container>
                <Row className="my-4">
                    {blogs.map(blog =>
                        <Col xs={12}>
                            <div dangerouslySetInnerHTML={{ __html: blog.title }}></div>

                            <Row className="my-1">
                                <Col md={8} className="d-flex align-items-center">
                                    <div dangerouslySetInnerHTML={{ __html: blog.contents }}></div>
                                </Col>
                                <Col md={4} className="d-flex align-items-center">
                                    <img src={blog.thumbnail ? blog.thumbnail : 'https://via.placeholder.com/120x170'}
                                        style={{ cursor: 'pointer' }}
                                        alt="blog thumbnail"
                                    />
                                </Col>
                            </Row>

                            <Row className="my-1">
                                <Col md={4} className="d-flex align-items-center">
                                    <span style={textStyle}>{blog.blogname} {blog.datetime.substr(0,10)}</span>
                                </Col>
                            </Row>
                        </Col>
                    )}
                </Row>
            </Container>

            <div className='my-3'>
                <Button onClick={() => setPage(page - 1)} disabled={page === 1}>이전</Button>
                <span className='mx-3'>{page}</span>
                <Button onClick={() => setPage(page + 1)} disabled={is_end}>다음</Button>
            </div>
        </div>
    )
}

export default Blogs
