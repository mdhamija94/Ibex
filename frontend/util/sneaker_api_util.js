export const fetchSneakers = () => {
  return $.ajax({
    method: 'GET',
    url: '/api/sneakers/',
  });
};