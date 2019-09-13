import React from 'react';

const ListingIndex = ({ listings }) => {
  return (
    <ul className="listing-index">
      <div className="listing-heading-container">
        <h3 id="buy-new">Buy New</h3>
        <h1 id="us-sizes">US Sizes</h1>
      </div>
      {
        listings.map((listing, idx) => {
          return (
            <li className="listing-index-item">
              <span className="listing-size">{listing.size}</span>
              <span className="listing-price">{listing.price}</span>
            </li>
          )
        })
      }
    </ul>
  )
}

export default ListingIndex;