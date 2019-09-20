import * as SneakerUtil from '../util/sneaker_api_util';

export const RECEIVE_SNEAKERS = "RECEIVE_SNEAKERS";
export const RECEIVE_SNEAKER = "RECEIVE_SNEAKER";
export const RECEIVE_SEARCH = "RECEIVE_SEARCH";
export const RESET_SNEAKERS = "RESET_SNEAKERS";

const receiveSneakers = ({ sneakers, sneaker_count }) => ({
  type: RECEIVE_SNEAKERS,
  sneakers: sneakers,
  sneakerCount: sneaker_count
});

const receiveSneaker = ({ sneaker, listings }) => ({
  type: RECEIVE_SNEAKER,
  sneaker,
  listings
});

const receiveSearch = ({ sneakers, sneaker_count }) => ({
  type: RECEIVE_SEARCH,
  sneakers: sneakers,
  sneakerCount: sneaker_count
});

export const resetSneakers = () => ({
  type: RESET_SNEAKERS
});

export const fetchSneakers = (page) => dispatch => SneakerUtil.fetchSneakers(page)
  .then( payload => dispatch(receiveSneakers(payload)));

export const fetchSneaker = (id) => dispatch => SneakerUtil.fetchSneaker(id)
  .then( payload => dispatch(receiveSneaker(payload)));

export const searchSneakers = (query, page) => dispatch => SneakerUtil.searchSneakers(query, page)
  .then( payload => dispatch(receiveSearch(payload)));