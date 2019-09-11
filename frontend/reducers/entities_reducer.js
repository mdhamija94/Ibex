import { combineReducers } from 'redux';
import SneakersReducer from './sneakers_reducer';

const EntitiesReducer = combineReducers({
  sneakers: SneakersReducer
});

export default EntitiesReducer;