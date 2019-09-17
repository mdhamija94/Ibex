import React from 'react';
import SneakerIndexItem from './sneaker_index_item';
import { Link } from 'react-router-dom';

class SneakerIndex extends React.Component {
  constructor(props) {
    super(props);

    this.counter = 1;
  }

  componentDidMount() {
    this.props.fetchSneakers(1);
    this.counter++
  }

  loadMore() {
    this.props.fetchSneakers(this.counter);
    this.counter++;
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
                  <Link to={`/sneakers/${sneaker.id}`} key={idx} >
                    <SneakerIndexItem sneaker={sneaker} key={idx} />
                  </Link>
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