import { combineReducers } from 'redux';
import SneakersReducer from './sneakers_reducer';
import ListingsReducer from './listings_reducer';
import CartItemsReducer from './cart_items_reducer';

const EntitiesReducer = combineReducers({
  sneakers: SneakersReducer,
  listings: ListingsReducer,
  cartItems: CartItemsReducer
});

export default EntitiesReducer;