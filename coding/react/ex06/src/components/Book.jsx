import React, { useState } from 'react'
import { Button, Modal } from 'react-bootstrap';

const Book = ({ book }) => {
    const [show, setShow] = useState(false);

    const handleClose = () => setShow(false);
    const handleShow = () => setShow(true);

    return (
        <>
            <img src={book.thumbnail ? book.thumbnail : 'https://via.placeholder.com/120x170'} 
                style={{cursor:'pointer'}}
                alt="book thumbnail"
                width="90%"
                onClick={handleShow} />

            <Modal
                show={show}
                onHide={handleClose}
                backdrop="static"
                keyboard={false}
                size='lg'
            >
                <Modal.Header closeButton>
                    <Modal.Title>상세보기</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <div>제목 : {book.title}</div>
                    <div>가격 : {book.price} 원</div>
                    <div>저자 : {book.authors}</div>
                    <div>출판사 : {book.publisher}</div>
                    <hr />
                    <div>{book.contents}</div>
                </Modal.Body>
                <Modal.Footer>
                    <Button variant="secondary" onClick={handleClose}>
                        Close
                    </Button>
                </Modal.Footer>
            </Modal>
        </>
    )
}

export default Book
