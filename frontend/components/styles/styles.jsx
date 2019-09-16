import React from 'react';
import { Link } from 'react-router-dom';

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
          <Link to="sneakers/110">
            <img src={window.air_mag} alt="" className="style-image" />
          </Link>
          <Link to="sneakers/1">
            <img src={window.banned} alt="" className="style-image" />
          </Link>
          <Link to="sneakers/33">
            <img src={window.creams} alt="" className="style-image" />
          </Link>
          <Link to="sneakers/49">
            <img src={window.inertia} alt="" className="style-image" />
          </Link>
          <Link to="sneakers/87">
            <img src={window.bc3} alt="" className="style-image" />
          </Link>
          <Link to="sneakers/122">
            <img src={window.sacai} alt="" className="style-image" />
          </Link>
        </div>
        <div className="styles-column">
          <Link to="sneakers/46">
            <img src={window.wave_runners} alt="" className="style-image" />
          </Link>
          <Link to="sneakers/19">
            <img src={window.ts1_low} alt="" className="style-image" />
          </Link>
          <Link to="sneakers/2">
            <img src={window.royal} alt="" className="style-image" />
          </Link>
          <Link to="sneakers/18">
            <img src={window.ts1_high} alt="" className="style-image" />
          </Link>
          <Link to="sneakers/56">
            <img src={window.red_octobers} alt="" className="style-image" />
          </Link>
          <Link to="sneakers/48">
            <img src={window.statics} alt="" className="style-image" />
          </Link>
        </div>
        <div className="styles-column">
          <Link to="sneakers/55">
            <img src={window.plats} alt="" className="style-image" />
          </Link>
          <Link to="sneakers/101">
            <img src={window.atmos} alt="" className="style-image" />
          </Link>
          <Link to="sneakers/71">
            <img src={window.chicago} alt="" className="style-image" />
          </Link>
          <Link to="sneakers/15">
            <img src={window.unions} alt="" className="style-image" />
          </Link>
          <Link to="sneakers/45">
            <img src={window.gg750} alt="" className="style-image" />
          </Link>
          <Link to="sneakers/74">
            <img src={window.blazer} alt="" className="style-image" />
          </Link>
        </div>
      </div>
    </section>
  )
};

export default Styles;