import React from 'react';
import { Link } from 'react-router-dom';

const ListingIndex = ({ listings }) => {
  return (
    <div className="listing-index-container" id="listing-scrollbar">
      <Link to={`/sneakers/${listings[0].sneaker_id}`}>
        <button className="close-panel-container">
          <span id="x">x</span>
        </button>
      </Link>
      <div className="listing-heading-container">
        <h3 id="buy-new">Buy New</h3>
        <h1 id="us-sizes">US Sizes</h1>
      </div>
      {
        listings.map((listing, idx) => {
          return (
            <Link  
              to={`/sneakers/${listing.sneaker_id}/listings/${listing.id}`}
              className="listing-index-item"
              key={idx}
            >
              <div className="listing-size">
                <span>{listing.size}M</span>
              </div>
              <div className="listing-price">
                <span>${listing.price}</span>
              </div>
            </Link>
          )
        })
      }
    </div>
  )
}

export default ListingIndex;