import { RECEIVE_SESSION_ERRORS, CLEAR_ERRORS } from '../actions/error_actions';
import { RECEIVE_CURRENT_USER } from '../actions/session_actions';

const errorObject = {
  "Full name can't be blank": "fullName",
  "Email can't be blank": "email",
  "Password is too short (minimum is 6 characters)": "password",
  "Email or password not correct.": "login"
};

const SessionErrorsReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState = {};
  switch (action.type) {
    case RECEIVE_SESSION_ERRORS:
      action.errors.forEach( errorMessage => {
        nextState[errorObject[errorMessage]] = errorMessage
      });
      return nextState;
    case RECEIVE_CURRENT_USER:
      return {};
    case CLEAR_ERRORS:
      return {};
    default:
      return state;
  }
};

export default SessionErrorsReducer;