import React from 'react';

const Styles = () => {
  return (
    <section className="styles-container">
      <div className="styles-header">
        OnFeet Styles
      </div>
      <div className="styles-subheader">
        Daily inspiration from the community.
        <br></br>
        Scroll to discover and shop trending styles.
      </div>
      <div className="styles-column-container">
        <div className="styles-column">
          <a href="#">
            <img src={window.air_mag} alt="" className="style-image" />
          </a>
          <a href="#">
            <img src={window.banned} alt="" className="style-image" />
          </a>
          <a href="#">
            <img src={window.creams} alt="" className="style-image" />
          </a>
          <a href="#">
            <img src={window.inertia} alt="" className="style-image" />
          </a>
          <a href="#">
            <img src={window.bc3} alt="" className="style-image" />
          </a>
          <a href="#">
            <img src={window.sacai} alt="" className="style-image" />
          </a>
        </div>
        <div className="styles-column">
          <a href="#">
            <img src={window.wave_runners} alt="" className="style-image" />
          </a>
          <a href="#">
            <img src={window.ts1_low} alt="" className="style-image" />
          </a>
          <a href="#">
            <img src={window.royal} alt="" className="style-image" />
          </a>
          <a href="#">
            <img src={window.ts1_high} alt="" className="style-image" />
          </a>
          <a href="#">
            <img src={window.red_octobers} alt="" className="style-image" />
          </a>
          <a href="#">
            <img src={window.statics} alt="" className="style-image" />
          </a>
        </div>
        <div className="styles-column">
          <a href="#">
            <img src={window.plats} alt="" className="style-image" />
          </a>
          <a href="#">
            <img src={window.atmos} alt="" className="style-image" />
          </a>
          <a href="#">
            <img src={window.chicago} alt="" className="style-image" />
          </a>
          <a href="#">
            <img src={window.unions} alt="" className="style-image" />
          </a>
          <a href="#">
            <img src={window.gg750} alt="" className="style-image" />
          </a>
          <a href="#">
            <img src={window.blazer} alt="" className="style-image" />
          </a>
        </div>
      </div>
    </section>
  )
};

export default Styles;