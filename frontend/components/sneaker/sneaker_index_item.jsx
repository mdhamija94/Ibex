import React from 'react';

const SneakerIndexItem = ({ sneaker }) => {
  return (
    <div className="sneaker-item">
      <li className="sneaker-item-name">
        <span></span>{sneaker.name}
      </li>
    </div>
  )
}

export default SneakerIndexItem;