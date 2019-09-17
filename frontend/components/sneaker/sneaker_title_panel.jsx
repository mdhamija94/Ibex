import React from 'react';
import { Link } from 'react-router-dom';

const SneakerTitlePanel = ({ props, lowestPrice }) => {
  return (
    <div className="sneaker-title-container">
      <div className="sneaker-title">
        { props.sneaker.name }
      </div>
      <div className="sneaker-sku">
        SKU: { props.sneaker.sku}
      </div>

      <button className="buy-new-button">
        <Link to={`/sneakers/${ props.sneaker.id}/listings`}>
          Buy New - ${lowestPrice}
        </Link>
      </button>

      <button className="buy-used-button">
        Buy Used - Sold Out
      </button>
    </div>
  )
};

export default SneakerTitlePanel;

// { this.state.showListings ? "listings" : sneaker.name }