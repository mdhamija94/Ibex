export const fetchCart = () => {
  return $.ajax({
    method: 'GET',
    url: '/api/cart_items'
  });
};

export const addToCart = (cart_item) => {
  $.ajax({
    method: 'POST',
    url: '/api/cart_items',
    data: { cart_item }
  });
};

export const removeFromCart = (id) => {
  $.ajax({
    method: 'DELETE',
    url: `/api/cart_items/${id}`
  })
}