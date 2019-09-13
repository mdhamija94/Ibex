import { combineReducers } from 'redux';
import SneakersReducer from './sneakers_reducer';
import ListingsReducer from './listings_reducer';

const EntitiesReducer = combineReducers({
  sneakers: SneakersReducer,
  listings: ListingsReducer
});

export default EntitiesReducer;