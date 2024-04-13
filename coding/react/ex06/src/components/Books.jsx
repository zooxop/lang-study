import React, { useEffect, useState } from 'react';
import axios from 'axios';
import {Col, Row, Card, Button, InputGroup, Form} from 'react-bootstrap';
import Book from './Book';

const Books = () => {
    const [books, setBooks] = useState([]);
    const [page, setPage] = useState(1);
    const [loading, setLoading] = useState(false);
    const [is_end, setIs_end] = useState(false);
    const [query, setQuery] = useState('리액트');

    const onSubmit = (e) => { 
        e.preventDefault();  // Refresh 방지
        setPage(1);
        callAPI();
    }

    const callAPI = async () => {
        const url = `https://dapi.kakao.com/v3/search/book?target=title&query=${query}&size=12&page=${page}`;
        const config = {
            headers: {
                "Authorization": "KakaoAK a9c177322b9b68faa0a497e8b4f1d4d3"
            }
        }

        setLoading(true);

        const response = await axios.get(url, config);
        const data = response.data;
        setBooks(data.documents);
        setIs_end(data.meta.is_end);
        setTimeout(()=>{
            setLoading(false);
        }, 100);        
    }

    useEffect(()=>{
        callAPI();
    }, [page]);

    if (loading) return <h1 className='my-5'>로딩중</h1>
    return (
        <div>
            <h1 className='my-5'>도서 검색</h1>

            <Row className='mx-5 mb-3'>
                <Col md={4} lg={6}>
                    <form onSubmit={onSubmit}>
                        <InputGroup>
                            <Form.Control value={query} onChange={(e)=>setQuery(e.target.value)}/>
                            <Button type='submit'>검색</Button>
                        </InputGroup>
                    </form>
                </Col>
            </Row>
            <Row className='mx-5'>
                {books.map( book =>
                    <Col className='mb-3' xs={6} md={4} lg={2}>
                        <Card>
                            <Card.Body>
                                <Book book={book}/>
                            </Card.Body>
                            <Card.Footer>
                                <div className='ellipsis'>{book.title}</div>
                            </Card.Footer>
                        </Card>
                    </Col>
                )}
            </Row>
            
            <div className='my-3'>
                <Button onClick={()=>setPage(page-1)} disabled={page===1}>이전</Button>
                <span className='mx-3'>{page}</span>
                <Button onClick={()=>setPage(page+1)} disabled={is_end}>다음</Button>
            </div>
        </div>
    )
}

export default Books
