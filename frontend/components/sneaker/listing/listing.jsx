import React from 'react';
import { Link } from 'react-router-dom';

const Listing = ({ props, sneakerName, listings }) => {
  const listing = listings[props.match.params.listingId];
  debugger
  return (
    <div className="listing-container">
      <div className="listing-header-container">
        <div id="listing-header">
          Lowest Price
        </div>
        <div id="listing-price">
          ${listing.price}
        </div>
      </div>
      <div className="listing-nutritional-facts-container">
        <div className="listing-nutritional-fact">
          <span className="listing-nutritional-fact-key">Sneaker</span>
          <span className="listing-nutritional-fact-value">{sneakerName}</span>
        </div>
        <div className="listing-nutritional-fact">
          <span className="listing-nutritional-fact-key">Size</span>
          <span className="listing-nutritional-fact-value">{listing.size}M</span>
        </div>
        <div className="listing-nutritional-fact">
          <span className="listing-nutritional-fact-key">Condition</span>
          <span className="listing-nutritional-fact-value">New</span>
        </div>
        <div className="listing-nutritional-fact">
          <span className="listing-nutritional-fact-key">Box</span>
          <span className="listing-nutritional-fact-value">Good Condition</span>
        </div>
      </div>

      <Link to={`/sneakers/${listing.sneaker_id}`} >
        <button className="cancel-button">
          Cancel
        </button>
      </Link>

      <button className="atc-button">
        Add to Cart
      </button>

    </div>
  )
};

export default Listing;