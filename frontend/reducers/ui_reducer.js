import { RECEIVE_SNEAKERS } from '../actions/sneaker_actions';

const UIReducer = (state = {}, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_SNEAKERS:
      return { sneakerCount: action.sneakerCount };
    default:
      return state;
  }
};

export default UIReducer;