import { RECEIVE_CART } from '../actions/cart_actions';

const CartItemsReducer = (state = {}, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_CART:
      return Object.assign({}, state, action.cartItems);
      // receive cart item merges newly created cart item into state
    default:
      // remove cart item will receive ID on successful backend deletion and
      // go into new state object (let state = Object.assign({}, state, ))
      return state;
  }
};

export default CartItemsReducer;