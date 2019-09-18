import { 
  RECEIVE_SNEAKERS, 
  RECEIVE_SNEAKER,
  RECEIVE_SEARCH,
  RESET_SNEAKERS
} from '../actions/sneaker_actions';

const sneakerDefaultState = {}

const SneakersReducer = (state = sneakerDefaultState, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_SNEAKERS:
      return Object.assign({}, state, action.sneakers);
    case RECEIVE_SNEAKER:
      const sneaker = action.sneaker;
      return Object.assign({}, state, { [sneaker.id]: sneaker });
    case RECEIVE_SEARCH:
      return action.searchResults;
    case RESET_SNEAKERS:
      return sneakerDefaultState;
    default:
      return state;
  }
};

export default SneakersReducer;