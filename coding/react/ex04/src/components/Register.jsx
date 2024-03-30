import React, { useRef, useState } from 'react'
import {Button, Form} from 'react-bootstrap';

const Register = ({onRegister}) => {
    const newCode = useRef(103);

    const [product, setProduct] = useState({
        code:newCode.current,
        name:'',
        price:'',
        qnt:''
    });

    const {code, name, price, qnt} = product;
    const onChange = (event) => {
        setProduct({
            ...product,
            [event.target.name]:event.target.value
        })
    }

    const onClick = () => {
        if (name==='' || price==='' || qnt==='') { 
            alert("상품 정보를 빠짐없이 입력해주세요.");
            return;
        }

        if (window.confirm('상품을 등록하실래요?')) {
            onRegister(product);
            setProduct({
                code: ++newCode.current,
                name: '',
                price: '',
                qnt: ''
            })
        }
    }

    return (
        <div className='mb-5'>
            <Form.Control value={code} name="code" onChange={onChange} placeholder='상품코드' className='mb-2'/>
            <Form.Control value={name} name="name" onChange={onChange} placeholder='상품이름' className='mb-2'/>
            <Form.Control value={price} name="price" onChange={onChange} placeholder='상품가격' className='mb-2'/>
            <Form.Control value={qnt} name="qnt" onChange={onChange} placeholder='판매수량' className='mb-2'/>
            <Button onClick={onClick}>상품등록</Button>
        </div>
    )
}

export default Register
