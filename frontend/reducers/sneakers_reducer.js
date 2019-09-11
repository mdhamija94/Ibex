import { RECEIVE_SNEAKERS } from '../actions/sneaker_actions';

const SneakersReducer = (state = {}, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_SNEAKERS:
      return action.sneakers;
    default:
      return state;
  }
};

export default SneakersReducer;