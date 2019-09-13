import { connect } from 'react-redux';
import ListingIndex from './listing_index';

mapStateToProps = (state, ownProps) => {
  const sneaker = state.entities.sneakers[ownProps.match.params.sneakerId];

  return (
    listings: sneaker.listings
  )
};

mapDispatchToProps = (dispatch) => ({
  fetchSneaker: id => dispatch(fetchSneaker(id)),
  fetchListings: sneakerId => dispatch(fetchListings(sneakerId))
});

export default connect(mapStateToProps, mapDispatchToProps)(ListingIndex);