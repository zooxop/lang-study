import React, { useState } from 'react'
import {Table, Button} from 'react-bootstrap';
import Register from './Register';

const Product = () => {
    const [products, setProducts] = useState([
        {code:101, name:'엘지전자 오브제 세탁기', price:250, qnt:5},
        {code:102, name:'엘지전자 오브제 건조기', price:230, qnt:4},
    ]);

    const onRegister = (product) => {
        const newData = products.concat(product);
        setProducts(newData);
    }

    const onDelete = (code) => {
        if (window.confirm(`${code}번 상품을 삭제하시겠습니까?`)) {
            const newData = products.filter(p => p.code !== code);
            setProducts(newData);
        }
    }

    const onQntUpdate = (event, product) => {
        const newData = products.map(p => p.code === product.code ? {...p, qnt:event.target.value} : {...p});
        setProducts(newData);
    }

    const onPriceUpdate = (event, product) => {
        const newData = products.map(p => p.code === product.code ? {...p, price: event.target.value} : {...p});
        setProducts(newData);
    }

    const onNameUpdate = (event, product) => {
        const newData = products.map(p => p.code === product.code ? {...p, name: event.target.value} : {...p});
        setProducts(newData);
    }

    return (
        <div>
            <h1>매출관리</h1>
            <Register onRegister={onRegister}/>
            <Table striped bordered hover>
                <thead>
                    <tr>
                        <td>상품코드</td>
                        <td>상품이름</td>
                        <td>상품가격</td>
                        <td>판매수량</td>
                        <td>판매금액</td>
                        <td>삭제</td>
                    </tr>
                </thead>
                <tbody>
                    {products.map(p => 
                        <tr key={p.code}>
                            <td>{p.code}</td>
                            <td>
                            <input value={p.name} size='20' className='text-end' onChange={(e) => onNameUpdate(e, p)}/>
                            </td>
                            <td>
                                <input value={p.price} size='10' className='text-end' onChange={(e) => onPriceUpdate(e, p)}/>
                            </td>
                            <td>
                                <input value={p.qnt} size='3' className='text-end' onChange={(e) => onQntUpdate(e, p)}/>
                            </td>
                            <td>{p.price * p.qnt}</td>
                            <td>
                                <Button variant='danger' size='small' onClick={() => onDelete(p.code)}>삭제</Button>
                            </td>
                        </tr>
                    )}
                </tbody>
            </Table>
        </div>
    )
}

export default Product
