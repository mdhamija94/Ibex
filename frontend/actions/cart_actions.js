import * as CartUtil from '../util/cart_api_util';

export const RECEIVE_CART = "RECEIVE_CART";
export const DELETE_CART_ITEM = "DELETE_CART_ITEM";
export const CREATE_CART_ITEM = "CREATE_CART_ITEM";
export const CLEAR_CART_ITEMS = "CLEAR_CART_ITEMS";

const receiveCart = ({ cart_items }) => ({
  type: RECEIVE_CART,
  cartItems: cart_items
});

const createCartItem = (cart_item) => ({
  type: CREATE_CART_ITEM,
  cartItem: cart_item
});

const deleteCartItem = (id) => ({
  type: DELETE_CART_ITEM,
  cartItemId: id
});

export const clearCartItems = () => ({
  type: CLEAR_CART_ITEMS
});

export const fetchCart = () => dispatch => CartUtil.fetchCart()
  .then((payload) => dispatch(receiveCart(payload)));

export const addToCart = (cartItem) => dispatch => CartUtil.addToCart(cartItem)
  .then((cartItem) => dispatch(createCartItem(cartItem)));

export const removeFromCart = (id) => dispatch => CartUtil.removeFromCart(id)
  .then(dispatch(deleteCartItem(id)));