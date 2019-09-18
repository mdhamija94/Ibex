import React from 'react';
import { Link } from 'react-router-dom';
import SneakerIndexItem from '../sneaker/sneaker_index_item';

const SearchResults = ({ props, search }) => {
  if (props.sneakers.length) {
    return (
      <div>
        <p className="search-results-header">Showing Results 1-{`${Object.values(props.sneakers[0]).length}`} of {`${props.sneakers[1]}`}</p>
        <div className="sneaker-index-container">
          <ul className="sneaker-items-container">
            {
              Object.values(props.sneakers[0]).map((sneaker, idx) => {
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
  } else if (!props.sneakers.length && search.length) {
    return (
      <p className="search-results-header">Showing 0 Results</p>
    )
  } else {
    return (
      <div className="no-search-query"></div>
    )
  }
};

export default SearchResults;