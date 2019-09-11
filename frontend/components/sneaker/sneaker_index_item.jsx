import React from 'react';

const SneakerIndexItem = ({ sneaker }) => {
  return (
    <li className="sneaker-item-container">
      <span className="sneaker-item">{sneaker.name}</span>
    </li>
  )
}

export default SneakerIndexItem;