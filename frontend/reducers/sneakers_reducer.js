import { 
  RECEIVE_SNEAKERS, 
  RECEIVE_SNEAKER, 
  RECEIVE_SEARCH 
} from '../actions/sneaker_actions';

const SneakersReducer = (state = {}, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_SNEAKERS:
      return action.sneakers;
    case RECEIVE_SNEAKER:
      const sneaker = action.sneaker;
      return Object.assign({}, state, { [sneaker.id]: sneaker });
    case RECEIVE_SEARCH:
      return action.searchResults;
    default:
      return state;
  }
};

export default SneakersReducer;