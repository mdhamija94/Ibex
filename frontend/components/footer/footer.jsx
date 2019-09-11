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
      <div className="app-link-container">
        <p id="app-link-cta">
          {/* Send a link to your phone to download the app that inspired Ibex */}
          Follow the link to download the app that inspired Ibex.
          <button className="footer-link-button">
            <a href="https://apps.apple.com/us/app/goat-buy-sell-sneakers/id966758561">
              Get the App
              </a>
          </button>
        </p>
      </div>
    </section>
  )
};

export default Footer;