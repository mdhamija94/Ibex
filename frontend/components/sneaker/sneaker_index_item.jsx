import React from 'react';

// const SneakerIndexItem = ({ sneaker }) => {
//   return (
//     <div className="sneaker-item">
//       <li className="sneaker-item-name" styles={background-image: 'url(' + sneaker.photoUrl + ')'}>
//         <span>{sneaker.photoUrl}</span>
//       </li>
//     </div>
//   )
// }

class SneakerIndexItem extends React.Component {
  constructor( props ) {
    super( props );
  }

  // const styles = {
  //   backgroundImage: url({ sneaker.photoUrl })
  // }

  render() {
    // debugger
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

// style = {{ background - image: url(sneaker.photoUrl) }}