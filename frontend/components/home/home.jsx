import React from 'react';
import { Link } from 'react-router-dom';

class Home extends React.Component {
  componentDidMount() {
    window.scrollTo(0, 0);
    if (this.props.currentUser) {
      this.props.fetchCart()
    };
  }

  render() {
    const sessionDisplay = this.props.currentUser ? (
      <button className="home-logout-button" onClick={this.props.logout}>
        <Link to="/">Log Out</Link>
      </button>
    ) : (
      <div>
        <button className="home-login-button">
          <Link to="/login">Log In</Link>
        </button>

        <button className="home-signup-button">
          <Link to="/signup">Sign Up</Link>
        </button>
      </div>
    )

    return (
      <div>
        <Link to="/sneakers/19">
          <section className="hero-image-container">
              <h3 className="hero-subheader">
                Featured Release
              </h3>
              <h1 className="hero-header">
                Travis Scott x Air Jordan 1 Low 'Mocha'
              </h1>
              <button className="hero-cta">
                Shop Now
              </button>
          </section>
        </Link>
        <div className="home-session-container">
          { sessionDisplay }
        </div>
      </div>
    )
  }
}

export default Home;