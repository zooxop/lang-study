import Container from 'react-bootstrap/Container';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
import {Routes, Route} from 'react-router-dom'
import About from './About';
import Books from './book/Books';
import Cart from './book/Cart';

const Menu = () => {
    return (
        <>
        <Navbar expand="lg" bg='primary' data-bs-theme='dark'>
          <Container fluid>
            <Navbar.Brand href="/">HOME</Navbar.Brand>
            <Navbar.Toggle aria-controls="navbarScroll" />
            <Navbar.Collapse id="navbarScroll">
              <Nav
                className="me-auto my-2 my-lg-0"
                style={{ maxHeight: '100px' }}
                navbarScroll
              >
                <Nav.Link href="/books">도서 검색</Nav.Link>
                <Nav.Link href="/cart">장바구니</Nav.Link>
              </Nav>
              <Nav>
              <Nav.Link href="/login">로그인</Nav.Link>
              </Nav>
            </Navbar.Collapse>
          </Container>
        </Navbar>
        <Routes>
            
            <Route path='/books' element={<Books/>}/>
            <Route path='/cart' element={<Cart/>}/>
        </Routes>
        
        </>
      );
}

export default Menu
