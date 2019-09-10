import React from 'react';

class Home extends React.Component {
  render() {
    return (
      <a href="">
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
      </a>
    )
  }
}

export default Home;