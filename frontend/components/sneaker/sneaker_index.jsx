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
      <div className="sneaker-index-container">
        <h1 className="index-header">Shop All</h1>
        <ul>
          {
            this.props.sneakers.map( (sneaker, idx) => {
              return (
                <SneakerIndexItem sneaker={sneaker} key={idx} />
              )
            })
          }
        </ul>
      </div>
    )
  }
}

export default SneakerIndex;