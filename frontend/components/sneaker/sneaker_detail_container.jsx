import { connect } from 'react-redux';
import SneakerDetail from './sneaker_detail';
import { fetchSneaker } from '../../actions/sneaker_actions';
import { addToCart } from '../../actions/cart_actions';

const mapStateToProps = (state, ownProps) => {
  const sneaker = state.entities.sneakers[ownProps.match.params.sneakerId];
  const listings = state.entities.listings;
  
  return {
    sneaker,
    listings,
    currentUser: state.session.id
  };
};

const mapDispatchToProps = (dispatch) => ({
  fetchSneaker: id => dispatch(fetchSneaker(id)),
  addToCart: cartItem => dispatch(addToCart(cartItem))
});

export default connect(mapStateToProps, mapDispatchToProps)(SneakerDetail);