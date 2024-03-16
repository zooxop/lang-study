import React from 'react'
import { useState } from 'react'

const Component05 = () => {
    const [form, setForm] = useState({
        id: 1,
        name: '냉장고',
        price: 100
    });

    const updateForm = (e) => {
        setForm({
            [e.target.name]: e.target.value
        });
    }

    const onClickOK = () => {
        alert(`아이디:${form.id}\n상품명:${form.name}\n상품가격:${form.price}`)
        setForm({
            id: form.id+1,
            name: '',
            price: 0
        })
    }

    const onKeyDown = (e) => {
        if (e.key === 'Enter') {
            onClickOK();
        }
    }

    return (
        <div>
            <h1>상품관리</h1>
            <div className='address'>
                <input name="id"
                    placeholder='아이디' 
                    value={form.id}
                    readOnly
                    />
                <input name="name"
                    placeholder='상품명' 
                    value={form.name}
                    onChange={updateForm}
                />
                <input name="price"
                    placeholder='상품가격' 
                    value={form.price}
                    onChange={updateForm}
                    onKeyDown={onKeyDown}
                />

                <button onClick={onClickOK}>확인</button>
            </div>
        </div>
    )
}

export default Component05
