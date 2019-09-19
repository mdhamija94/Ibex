import React from 'react';
import SneakerIndexItem from './sneaker_index_item';
import { Link } from 'react-router-dom';

class SneakerIndex extends React.Component {
  constructor(props) {
    super(props);

    this.page = 1;
    this.loadMore = this.loadMore.bind(this);
  }

  componentDidMount() {
    window.scrollTo(0, 0)
    dispatch(this.props.resetSneakers());
    this.props.fetchSneakers(1);
    this.page++;
  }

  componentWillUnmount() {
    dispatch(this.props.resetSneakers());
  }

  loadMore() {
    this.props.fetchSneakers(this.page);
    this.page++;
  }

  render() {
    const loadDisplay = this.props.sneakers.length < this.props.sneakerCount ? (
      <button className="load-more" onClick={this.loadMore}>
        See More
      </button>
    ) : (
      <div>
      </div>
    )
    
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
        <div className="load-more-container">
            {loadDisplay}
        </div>
      </div>
    )
  }
}

export default SneakerIndex;