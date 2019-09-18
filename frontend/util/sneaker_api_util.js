export const fetchSneakers = (page) => {
  return $.ajax({
    method: 'GET',
    url: '/api/sneakers/',
    remove: false,
    data: { page }
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