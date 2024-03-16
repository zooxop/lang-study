import React from 'react'
import { useState } from 'react'

const Component03 = () => {
    const [name, setName] = useState('');
    const [nickname, setNickname] = useState('');
    
    const onClickOK = () => {
        alert(`이름 : ${name} \n별명 : ${nickname}`)
    }

    const onEnterKeyDown = (e) => { 
        if (e.key === 'Enter') {
            onClickOK();
        }
    }

    return (
        <div>
            <h1>컴포넌트03</h1>
            <div>
                <input placeholder='이름' 
                    value={name}
                    onChange={(e) => setName(e.target.value)}
                    />
                <input placeholder='별명' 
                    value={nickname}
                    onChange={(e) => setNickname(e.target.value)}
                    onKeyDown={onEnterKeyDown}
                />
                <button onClick={onClickOK}>확인</button>
            </div>
            <div>
                <h1>이름 : {name}</h1>
                <h1>별명 : {nickname}</h1>
            </div>
            <hr />
        </div>
    )
}

export default Component03
