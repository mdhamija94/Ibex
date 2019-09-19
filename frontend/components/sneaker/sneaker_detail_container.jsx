import { connect } from 'react-redux';
import SneakerDetail from './sneaker_detail';
import { fetchSneaker } from '../../actions/sneaker_actions';

const mapStateToProps = (state, ownProps) => {
  const sneaker = state.entities.sneakers[ownProps.match.params.sneakerId];
  const listings = state.entities.listings;
  // const showListings = ownProps.location.pathname.includes("listings")
  let showListings;
  if (ownProps.location.pathname.includes("listings")) {
    showListings = 1
  }

  return {
    sneaker,
    listings,
    showListings
  };
};

const mapDispatchToProps = (dispatch) => ({
  fetchSneaker: id => dispatch(fetchSneaker(id))
});

export default connect(mapStateToProps, mapDispatchToProps)(SneakerDetail);