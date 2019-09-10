import * as SessionUtil from '../util/session_api_util.js';
import { receiveSessionErrors } from './error_actions';

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";

const receiveCurrentUser = (user) => ({
  type: RECEIVE_CURRENT_USER,
  user
});

const logoutCurrentUser = () => ({
  type: LOGOUT_CURRENT_USER
});

export const signup = user => dispatch => SessionUtil.signup(user)
  .then( user => dispatch(receiveCurrentUser(user)))
  .fail(errors => dispatch(receiveSessionErrors(errors.responseJSON)));

export const login = user => dispatch => SessionUtil.login(user)
  .then( user => dispatch(receiveCurrentUser(user)))
  .fail( errors => dispatch(receiveSessionErrors(errors.responseJSON)));

export const logout = () => dispatch => SessionUtil.logout()
  .then( () => dispatch(logoutCurrentUser()));
