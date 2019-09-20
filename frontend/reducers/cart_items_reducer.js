import { RECEIVE_CART, DELETE_CART_ITEM, CLEAR_CART_ITEMS } from '../actions/cart_actions';

const cartItemsDefaultState = {};

const CartItemsReducer = (state = cartItemsDefaultState, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_CART:
      return Object.assign({}, state, action.cartItems);
    case DELETE_CART_ITEM: 
      let nextState = Object.assign({}, state);
      delete nextState[action.cartItemId];
      return nextState;
    case CLEAR_CART_ITEMS:
      return cartItemsDefaultState;
    default:
      return state;
  }
};

export default CartItemsReducer;