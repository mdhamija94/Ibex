import { connect } from 'react-redux';
import SneakerDetail from './sneaker_detail';
import { fetchSneaker } from '../../actions/sneaker_actions';

const mapStateToProps = (state, ownProps) => {
  const sneaker = state.entities.sneakers[ownProps.match.params.sneakerId];
  const listings = state.entities.listings;
  
  return {
    sneaker,
    listings
  };
};

const mapDispatchToProps = (dispatch) => ({
  fetchSneaker: id => dispatch(fetchSneaker(id))
});

export default connect(mapStateToProps, mapDispatchToProps)(SneakerDetail);