import React from 'react';
import { Link } from 'react-router-dom';
import CartItem from './cart_item';

class CartItemsIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    window.scrollTo(0, 0);
    this.props.fetchCart();
  }

  cartTotal(cartItems) {
    this.orderSubtotal = 0

    cartItems.forEach(cartItem => {
      this.orderSubtotal += cartItem.price;
    });
  }

  render() {
    let { cartItems } = this.props;
    if (!cartItems) return null;

    this.cartTotal(cartItems);

    return (
      <article className="cart-container">
        <div className="cart-items-index-container">
          <div className="cart-subheader">
            {cartItems.length} Items
          </div>
          <div className="cart-header">
            Shopping Cart
          </div>
          <ul className="cart-items-container">
            {
              cartItems.map((cartItem, idx) => {
                return (
                  <CartItem cartItem={cartItem} key={idx} />
                )
              })
            }
          </ul>
        </div>

        <div className="payment-container">
          <div className="payment-header">
            Order Summary
          </div>
          <div className="order-details-container">
            <ul className="order-total-container">
              <li className="order-total-fact">
                <span className="order-total-key">Ship To</span>
                <span className="order-total-value">825 Battery Street</span>
              </li>
              <li className="order-total-fact">
                <span className="order-total-key">Payment</span>
                <span className="order-total-value"><i className="far fa-credit-card" id="cc"></i> 1234</span>
              </li>
              <li className="order-total-fact">
                <span className="order-total-key">Subtotal</span>
                <span className="order-total-value">${this.orderSubtotal}</span>
              </li>
              <li className="order-total-fact">
                <span className="order-total-key">Shipping</span>
                <span className="order-total-value">$10</span>
              </li>
              <li className="order-total-fact">
                <span className="order-total-key">Total</span>
                <span className="order-total-value">${this.orderSubtotal + 10}</span>
              </li>
            </ul>
          </div>

          <Link to="/sneakers">
            <button className="cancel-button">
              Shop More
          </button>
          </Link>

          <Link to="/cart">
            <button className="atc-button">
              Checkout
          </button>
          </Link>
        </div>
      </article>
    )
  }
}

export default CartItemsIndex;