import { connect } from 'react-redux';
import CartItemsIndex from './cart_items_index';
import { fetchCart, removeFromCart, clearCartItems } from '../../actions/cart_actions';

const mapStateToProps = (state) => ({
  cartItems: Object.values(state.entities.cartItems)
});

const mapDispatchToProps = (dispatch) => ({
  fetchCart: () => dispatch(fetchCart()),
  removeFromCart: (id) => dispatch(removeFromCart(id)),
  clearCartItems: () => dispatch(clearCartItems())
});

export default connect(mapStateToProps, mapDispatchToProps)(CartItemsIndex);