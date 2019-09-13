import * as SneakerUtil from '../util/sneaker_api_util';

export const RECEIVE_SNEAKERS = "RECEIVE_SNEAKERS";
export const RECEIVE_SNEAKER = "RECEIVE_SNEAKER";

const receiveSneakers = (sneakers) => ({
  type: RECEIVE_SNEAKERS,
  sneakers: sneakers
});

const receiveSneaker = ({ sneaker, listings }) => ({
  type: RECEIVE_SNEAKER,
  sneaker,
  listings
});

export const fetchSneakers = () => dispatch => SneakerUtil.fetchSneakers()
  .then( sneakers => dispatch(receiveSneakers(sneakers)));

export const fetchSneaker = (id) => dispatch => SneakerUtil.fetchSneaker(id)
  .then( payload => dispatch(receiveSneaker(payload)));