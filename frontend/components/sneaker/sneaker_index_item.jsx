import React from 'react';

class SneakerIndexItem extends React.Component {
  constructor( props ) {
    super( props );
  }

  render() {
    return (
      <div className="sneaker-item">
        <li className="sneaker-item-name">
          <div className="sneaker-item-image-container">
            <img src={this.props.sneaker.photoUrl} className="sneaker-item-image" alt=""/>
          </div>
          <span>{this.props.sneaker.name}</span>
        </li>
      </div >
    );
  }
}

export default SneakerIndexItem;