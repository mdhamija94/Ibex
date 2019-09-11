import React from 'react';
import SneakerIndexItem from './sneaker_index_item';

class SneakerIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchSneakers();
  }

  render() {
    return (
      <div>
        <p className="index-header">Shop All</p>
        <div className="sneaker-index-container">
          <ul className="sneaker-items-container">
            {
              this.props.sneakers.map( (sneaker, idx) => {
                return (
                  <SneakerIndexItem sneaker={sneaker} key={idx} />
                )
              })
            }
          </ul>
        </div>
      </div>
    )
  }
}

export default SneakerIndex;