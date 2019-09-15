import React from 'react';
import { Link } from 'react-router-dom';
import SneakerTitlePanel from './sneaker_title_panel';
import ListingIndex from './listing/listing_index';

class SneakerDetail extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      showListings: this.props.showListings
    };
  }

  componentDidMount() {
    this.props.fetchSneaker(this.props.match.params.sneakerId);
    window.scrollTo(0,0);
  }

  componentDidUpdate(prevProps) {

    if (prevProps.location.pathname !== this.props.location.pathname) {
      this.setState({
        showListings: true
      });
    }
  }

  render() {
    
    let { sneaker } = this.props;

    if (!sneaker) return null;
    return (
      <section>
        <article className="sneaker-display-container">

          <div className="sneaker-image-container">
            <img src={sneaker.photoUrl} alt="" className="sneaker-image"/>
            <div className="sneaker-path">
              {sneaker.brand} / {sneaker.silhouette} / {sneaker.name}
            </div>
          </div>

          <div className="sneaker-detail-container">
            { this.state.showListings ? <ListingIndex listings={this.props.listings}/> : < SneakerTitlePanel props={this.props} /> }
          </div>
        </article>

        <article className="sneaker-description-container">
          <button className="details-link">
            <span>Details</span>
            <i class="fas fa-angle-down"></i>
          </button>
          <div className="sneaker-description-title">
            {sneaker.name}
          </div>
          <div className="sneaker-description">
            {sneaker.description}
          </div>
        </article>

        <article className="sneaker-nutritional-facts-container">
          <div className="nutritional-fact">
            <span className="nutritional-fact-key">Release Date</span>
            <span className="nutritional-fact-value">{sneaker.release_date}</span>
          </div>
          <div className="nutritional-fact">
            <span className="nutritional-fact-key">Brand</span>
            <span className="nutritional-fact-value">{sneaker.brand}</span>
          </div>
          <div className="nutritional-fact">
            <span className="nutritional-fact-key">Silhouette</span>
            <span className="nutritional-fact-value">{sneaker.silhouette}</span>
          </div>
          <div className="nutritional-fact">
            <span className="nutritional-fact-key">Designer</span>
            <span className="nutritional-fact-value">{sneaker.designer}</span>
          </div>
          <div className="nutritional-fact">
            <span className="nutritional-fact-key">Technology</span>
            <span className="nutritional-fact-value">{sneaker.technology}</span>
          </div>
          <div className="nutritional-fact">
            <span className="nutritional-fact-key">Colorway</span>
            <span className="nutritional-fact-value">{sneaker.colorway}</span>
          </div>
        </article>
    </section>
    )
  }
}

export default SneakerDetail;