import { RECEIVE_SNEAKER } from '../actions/sneaker_actions';
// import { RECEIVE_CART } from '../actions/cart_actions';

const ListingsReducer = (state = {}, action ) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_SNEAKER:
      return action.listings;
    // case RECEIVE_CART:
    //   return Object.assign({}, state, action.sneakers);
    default:
      return state;
  }
};

export default ListingsReducer;