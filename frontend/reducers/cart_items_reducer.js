import { RECEIVE_CART, CREATE_CART_ITEM, DELETE_CART_ITEM, CLEAR_CART_ITEMS } from '../actions/cart_actions';

const cartItemsDefaultState = {};

const CartItemsReducer = (state = cartItemsDefaultState, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_CART:
      if (!action.cartItems) {
        return {};
      } else {
        return action.cartItems;
      };
    case CREATE_CART_ITEM:
      return Object.assign({}, state, action.cartItem);
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