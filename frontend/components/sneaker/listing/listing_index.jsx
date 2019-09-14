import React from 'react';
import { Link } from 'react-router-dom';

const ListingIndex = ({ listings }) => {
  debugger
  return (
    <div className="listing-index-container" id="listing-scrollbar">
      <div className="listing-heading-container">
        <h3 id="buy-new">Buy New</h3>
        <h1 id="us-sizes">US Sizes</h1>
      </div>
      {
        listings.map((listing, idx) => {
          return (
              <Link to={`/sneakers/${listing.sneaker_id}/listings/add?size=${listing.size}`} className="listing-index-item">
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