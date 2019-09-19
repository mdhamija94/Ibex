import React from 'react';
import { Switch, Route } from 'react-router-dom';
import SneakerTitlePanel from './sneaker_title_panel';
import ListingIndex from './listing/listing_index';
import Listing from './listing/listing';

class SneakerDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchSneaker(this.props.match.params.sneakerId);
    window.scrollTo(0, 0);
  }

  componentDidUpdate(prevProps) {
    if (prevProps.location.pathname !== this.props.location.pathname) {
      this.props.fetchSneaker(this.props.match.params.sneakerId);
    }
  }

  lowestPrice() {
    if (!Object.values(this.props.listings).length) return null;
    // debugger
    const sneakerListings = Object.values(this.props.listings);
    return sneakerListings.reduce((min, nextListing) => nextListing.price < min ? nextListing.price : min, sneakerListings[0].price);
  }

  render() {    
    let { sneaker } = this.props;

    if (!sneaker) return null;

    let listingsArray = Object.values(this.props.listings);

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
            <Switch>
              <Route 
                path="/sneakers/:sneakerId/listings/:listingId" 
                render={(props) => <Listing props={props} sneaker={this.props.sneaker} listings={this.props.listings} />} 
              />
              <Route 
                path="/sneakers/:sneakerId/listings" 
                render={() => <ListingIndex listings={listingsArray} />} 
              />
              <Route 
                path="/sneakers/:sneakerId" 
                render={() => <SneakerTitlePanel props={this.props} lowestPrice={this.lowestPrice()} />}  
              />
            </Switch>
          </div>
        </article>

        <article className="sneaker-description-container">
          <button className="details-link">
            <span>Details</span>
            <i className="fas fa-angle-down"></i>
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