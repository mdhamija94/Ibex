import React from 'react';
import { Link } from 'react-router-dom';

const Nav = () => {
  return (
    <nav className="header-nav">
      <h1 className="header-logo">
        <a href="#">IBEX</a>
      </h1>
      <ul className="header-list">
        <li>
          <span className="nav-links"><Link to="/index">Shop All</Link></span>
        </li>
        <li>
          <span className="nav-links"><a href="#">Styles</a></span>
        </li>
        <li>
          <a href="#">
            <span className="nav-links"><i className="fas fa-search"></i></span>
          </a>
        </li>
        <li>
          <a href="#">
            <span className="nav-links"><i className="fas fa-shopping-cart"></i></span>
          </a>
        </li>
        <li>
          <a href="#">
            <span><i className="fas fa-bars" id="menu-icon"></i></span>
          </a>
        </li>
      </ul>
    </nav>
  )
};

export default Nav;