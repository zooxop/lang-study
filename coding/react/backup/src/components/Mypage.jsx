import React from 'react'
import { Row, Col, Card, Form, Button } from 'react-bootstrap'

const Mypage = () => {
    const image={
        borderRadius:'50%',
        width:'50px',
        marginRight: '20px',
        cursor:'pointer'
    }
    return (
        <Row className='my-5 justify-content-center'>
            <Col xs={12} md={10} lg={8}>
                <Card>
                    <Card.Header>
                        <h3 className='text-center'>마이페이지</h3>
                    </Card.Header>
                    <Card.Body>
                        <div>
                            <img src="http://via.placeholder.com/50x50" style={image}/>
                            <span style={{fontSize:'20px'}}>{sessionStorage.getItem("email")}</span>
                            <hr/>
                        </div>
                        <div>
                            이름:
                            <hr/>
                        </div>
                        <div>
                            전화:
                            <hr/>
                        </div>
                        <div>
                            주소:
                            <hr/>
                        </div>
                        <div className='text-center'>
                            <Button className='px-5'>정보수정</Button>
                        </div>
                    </Card.Body>
                </Card>
            </Col>
        </Row>
    )
}

export default Mypage