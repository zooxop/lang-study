import React from 'react'
import './App.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import Locals from './components/Locals';

const App = () => {
  return (
    <div className = "App">
      <h1 className = 'my-5 moirai-one-regular'>지역 검색</h1>
      <Locals/>
    </div>
  )
}

export default App