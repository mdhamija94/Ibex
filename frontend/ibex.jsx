import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import configureStore from './store/store';

// Testing Imports
import * as SessionUtil from './util/session_api_util';
import * as Thunks from './actions/session_actions';

document.addEventListener("DOMContentLoaded", () => {
  let store;
  if (window.currentUser) {
    const preloadedState = {
      // entities: {
      //   users: { [window.currentUser.id]: window.currentUser }
      // },
      session: { id: window.currentUser.id }
    };
    store = configureStore(preloadedState);
    delete window.currentUser;
  } else {
    store = configureStore();
  }

  // Start Testing
  window.getState = store.getState;
  window.dispatch = store.dispatch;

  window.signup = SessionUtil.signup;
  window.login = SessionUtil.login;
  window.logout = Thunks.logout;
  // End Testing

  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, root);
});