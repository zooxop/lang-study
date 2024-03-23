import React, { useRef, useState } from 'react'

const Register = ({onRegister}) => {
    const last = useRef(3);

    const [form, setForm] = useState({
        id: last.current,
        name: '',
        juso: '',
        phone: ''
    });

    const onKeyDown = (e) => {
        if (e.key === 'Enter') {
            onClickRegister();
        }
    }
    const {id, name, juso, phone} = form;
    const onChangeForm = (e) => {
        setForm({
            ...form,
            [e.target.name]: e.target.value
        })
    };
    const refId = useRef(null);
    const refName = useRef(null);
    const refJuso = useRef(null);
    const refPhone = useRef(null);

    const onClickRegister = () => {
        if(id==="") {
            alert("아이디를 입력해주세요");
            refId.current.focus();
            return;
        }

        if(name==="") {
            alert("이름을 입력해주세요");
            refName.current.focus();
            return;
        }

        if(juso==="") {
            alert("주소를 입력해주세요");
            refJuso.current.focus();
            return;
        }

        if(phone==="") {
            alert("전화번호를 입력해주세요");
            refPhone.current.focus();
            return;
        }

        if (window.confirm(`${id}번 주소를 등록하시겠습니까?`)) {
            onRegister(form);
            last.current++;
            setForm({
                ...form,
                id: last.current,
                name: '',
                juso: '',
                phone: ''
            })
        }
    }

    return (
        <div className='register'>
            <h1>주소 등록</h1>
            <input placeholder='아이디' value={id} name="id" ref={refId} onChange={onChangeForm} readOnly/>
            <input placeholder='이름' value={name} name="name" ref={refName} onChange={onChangeForm}/>
            <input placeholder='주소' value={juso} name="juso" ref={refJuso} onChange={onChangeForm}/>
            <input placeholder='전화번호' value={phone} name="phone" ref={refPhone} onChange={onChangeForm} onKeyDown={onKeyDown}/>
            <button onClick={onClickRegister}>등록</button>
        </div>
    )
}

export default Register
