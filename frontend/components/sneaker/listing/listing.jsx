import React from 'react';
import { Link } from 'react-router-dom';
import { addToCart } from '../../../util/cart_api_util';

const Listing = ({ props, sneaker, listings, currentUser }) => {
  const listing = listings[props.match.params.listingId];

  const cartItem = {
    user_id: currentUser,
    listing_id: listing.id
  }

  const buttonDisplay = currentUser ? (
    <Link to="/cart">
      <button className="atc-button" onClick={addToCart(cartItem)}>
        Add to Cart
        </button>
    </Link>
  ) : (
    <Link to="/login">
      <button className="atc-button">
        Log In to Purchase
      </button>
    </Link>
  )

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
          <span className="listing-nutritional-fact-value">{sneaker.name}</span>
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

      {buttonDisplay}
    </div>
  )
};

export default Listing;