import React from 'react';

const Footer = () => {
  return (
    <section className="footer-container">
      <ul className="footer-list">
        <li className="footer-icon-container">
          <a href="https://www.linkedin.com/in/mdhamija/">
            <i className="fab fa-linkedin-in"></i>
          </a>
        </li>
        <li className="footer-icon-container">
          <a href="https://github.com/mdhamija94/IBEX">
            <i className="fab fa-github"></i>
          </a>
        </li>
        <li className="footer-icon-container">
          <a href="#">
            <i className="fas fa-user"></i>
          </a>
        </li>
      </ul>
      <div className="goat-link-container">
        <p id="goat-link-cta">
          IBEX is a clone of GOAT.com, the global destination for buying and selling sneakers. Follow the link below to visit the original site.
          <a href="https://www.goat.com/">
            <button className="footer-link-button">
              Visit GOAT
            </button>
          </a>
        </p>
      </div>
    </section>
  )
};

export default Footer;