import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import configureStore from './store/store';

// Testing Imports
import * as SessionUtil from './util/session_api_util';
import * as SneakerUtil from './util/sneaker_api_util';
import * as CartUtil from './util/cart_api_util';
import * as SessionAction from './actions/session_actions';
import * as SneakerAction from './actions/sneaker_actions';

document.addEventListener("DOMContentLoaded", () => {
  let store;
  if (window.currentUser) {
    const preloadedState = {
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

  window.logout = SessionAction.logout;
  window.fetchSneaker = SneakerUtil.fetchSneaker;

  // window.fetchSneakers = SneakerUtil.fetchSneakers;
  window.fetchSneakers = SneakerAction.fetchSneakers;
  window.searchSneakers = SneakerAction.searchSneakers;

  window.fetchCart = CartUtil.fetchCart;
  // End Testing

  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, root);
});