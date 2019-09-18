import * as SneakerUtil from '../util/sneaker_api_util';

export const RECEIVE_SNEAKERS = "RECEIVE_SNEAKERS";
export const RECEIVE_SNEAKER = "RECEIVE_SNEAKER";
export const RECEIVE_SEARCH = "RECEIVE_SEARCH";
// export const RECEIVE_SNEAKER_COUNT = "RECEIVE_SNEAKER_COUNT";
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

const receiveSearch = (searchResults) => ({
  type: RECEIVE_SEARCH,
  searchResults
});

export const resetSneakers = () => ({
  type: RESET_SNEAKERS
})

export const fetchSneakers = (page) => dispatch => SneakerUtil.fetchSneakers(page)
  .then( payload => dispatch(receiveSneakers(payload)));

export const fetchSneaker = (id) => dispatch => SneakerUtil.fetchSneaker(id)
  .then( payload => dispatch(receiveSneaker(payload)));

export const searchSneakers = (query) => dispatch => SneakerUtil.searchSneakers(query)
  .then( searchResults => dispatch(receiveSearch(searchResults)));