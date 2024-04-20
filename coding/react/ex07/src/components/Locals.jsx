import React, { useEffect, useState } from 'react'
import axios from 'axios';
import { Button, Col, Form, InputGroup, Row, Table } from 'react-bootstrap';
import Local from './Local';

const Locals = () => {

    const[locals, setLocals] = useState([]);
    const[query, setQuery] = useState('인하대학교');
    const[page, setPage] = useState(1);
    const[end, setEnd] = useState(false);
    const[size, setSize] = useState(10);
    const[loading, setLoading] = useState(false);

    const callAPI = async() => {
        setLoading(true);

        const url = `https://dapi.kakao.com/v2/local/search/keyword.json?query=${query}&size=${size}&page=${page}`;
        const config = {
            headers:{
                "Authorization": "KakaoAK a9c177322b9b68faa0a497e8b4f1d4d3"
            }
        }
        
        const res = await axios.get(url, config);
        const data = res.data;
        setLocals(data.documents);
        setEnd(data.meta.is_end);

        setTimeout(() => {
            setLoading(false);
        }, 200);
    }

    useEffect(()=>{
        callAPI();  
    }, [page, size]);

    const onSubmit = (e) => {
        e.preventDefault();
        if(query ==="")
        {
            alert("검색어를 입력하세요");
        }
        else
        {
            setPage(1);
            callAPI();
        }
    }

    if(loading) return <h1 className='mx-5'>로딩중입니다....</h1>

    return (
        <div className='mx-5'>
            <Row className='m-5 mb-3'>
                <Col md={4} className="right-align">
                    <form onSubmit={onSubmit}>
                        <InputGroup>
                            <Form.Control value={query} onChange={(e) => setQuery(e.target.value)} />
                            <Button>검색</Button>
                        </InputGroup>
                    </form>
                </Col>

                <Col md={3}>
                    <Form.Select onChange={(e)=>setSize(e.target.value)}>
                        <option value={5}>5행</option>
                        <option value={10} selected >10행</option>
                        <option value={15}>15행</option>
                    </Form.Select>
                </Col>
            </Row> 
        
            
            <Table striped bordered hover>
                <thead>
                    <tr>
                        <td>장소명</td>
                        <td>전화번호</td>
                        <td>주소</td>
                        <td>위치</td>
                    </tr>
                </thead>
                
                <tbody>
                    {locals.map(local=>
                        <tr key={local.id}> 
                            <td>{local.place_name}</td>
                            <td>{local.phone}</td>
                            <td>{local.address_name}</td>
                            <td><Local local = {local}/></td>
                        </tr>
                    )}
                </tbody>
            </Table>

            <div>
                <Button onClick={()=>setPage(page-1)} disabled = {page===1} variant='success'>이전</Button>
                <span className = 'mx-3'>{page}</span>
                <Button onClick={()=>setPage(page+1)} disabled = {end}>다음</Button>
            </div>

        </div>
    )
}

export default Locals