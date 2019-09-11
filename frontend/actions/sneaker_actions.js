import * as SneakerUtil from '../util/sneaker_api_util';

export const RECEIVE_SNEAKERS = "RECEIVE_SNEAKERS";

const receiveSneakers = (sneakers) => ({
  type: RECEIVE_SNEAKERS,
  sneakers: sneakers
});

export const fetchSneakers = () => dispatch => SneakerUtil.fetchSneakers()
  .then(sneakers => dispatch(receiveSneakers(sneakers)));