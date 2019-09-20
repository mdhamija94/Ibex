import * as CartUtil from '../util/cart_api_util';

export const RECEIVE_CART = "RECEIVE_CART";

const receiveCart = ({cart_items, listings, sneakers}) => ({
  type: RECEIVE_CART,
  cartItems: cart_items,
  listings: listings,
  sneakers: sneakers
});

export const fetchCart = () => dispatch => CartUtil.fetchCart()
  .then( payload => dispatch(receiveCart(payload)));