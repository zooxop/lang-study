import React from 'react'
import { useState } from 'react'

const Component04 = () => {
    const [form, setForm] = useState({
        id: 1,
        name: '홍길동',
        address: '인천 남구 학익동 인하대학교',
        phone: '032-547-6067'
    });

    // 비구조화 할당
    const {id, name, address, phone} = form;

    const updateForm = (e) => {
        setForm({
            ...form,
            [e.target.name]: e.target.value
        })
    }

    const onClickOK = () => {
        alert(`아이디:${id}\n이름:${name}\n주소:${address}\n전화번호:${phone}`)
        setForm({
            id: id+1,
            name: '',
            address: '',
            phone: ''
        });
    }

    const onKeyDown = (e) => {
        if (e.key === 'Enter') {
            onClickOK();
        }
    }

    return (
        <div>
            <h1>주소록</h1>
            <div className='address'>
                <input name="id" 
                    placeholder='아이디' value={id} readOnly
                    />
                <input name="name"
                    placeholder='이름' value={name} onChange={updateForm}
                    />
                <input name="address"
                    placeholder='주소' value={address} onChange={updateForm}
                    />
                <input name="phone"
                    placeholder='전화번호' value={phone} onChange={updateForm}
                    onKeyDown={onKeyDown}
                    />

                <button onClick={onClickOK}>확 인</button>
            </div>
        </div>
    )
}

export default Component04
