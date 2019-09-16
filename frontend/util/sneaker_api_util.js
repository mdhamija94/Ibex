export const fetchSneakers = () => {
  return $.ajax({
    method: 'GET',
    url: '/api/sneakers/',
  });
};

export const fetchSneaker = (id) => {
  return $.ajax({
    method: 'GET',
    url: `/api/sneakers/${id}`
  });
};

export const searchSneakers = (query) => {
  return $.ajax({
    method: 'GET',
    url: '/api/sneakers/search',
    data: { query }
  });
};