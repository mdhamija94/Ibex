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

    let cartEmptyDisplay = !cartItems.length ? (
      <div className="cart-empty-notice">
        You have no items in your shopping cart.
      </div>
    ) : (
      <div></div>
    )

    let shipping = cartItems.length ? 10 : 0;

    let orderDetailDisplay = cartItems.length ? (
      <div>
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
          <span className="order-total-value">${shipping}</span>
        </li>
      </div>
    ) : (
      <li></li>
    )

    let disclaimerDisplay = cartItems.length ? (
      <div className="checkout-disclaimer">
        IBEX is an exercise in developing a Full Stack web application using
        React, Redux, and Ruby on Rails, so while you can’t checkout the Cart
        you’ve assembled, you can “check out” the code behind the site.
      </div>
    ) : (
      <div></div>
    )

    let checkoutDisplay = cartItems.length ? (
      <a href="https://github.com/mdhamija94/IBEX">
        <button className="atc-button">
          Checkout
        </button>
      </a>
    ) : (
      <Link to="/cart">
        <button className="atc-button">
          Checkout
        </button>
      </Link>
    )

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
                  <CartItem cartItem={cartItem} key={idx} removeFromCart={this.props.removeFromCart} />
                )
              })
            }
          </ul>
          {cartEmptyDisplay}
        </div>

        <div className="payment-container">
          <div className="payment-header">
            Order Summary
          </div>
          <div className="order-details-container">
            <ul className="order-total-container">
              {orderDetailDisplay}
              <li className="order-total-fact">
                <span className="order-total-key">Total</span>
                <span className="order-total-value">${this.orderSubtotal + shipping}</span>
              </li>
            </ul>
            {disclaimerDisplay}
          </div>

          <Link to="/sneakers">
            <button className="cancel-button">
              Shop More
            </button>
          </Link>

          {checkoutDisplay}
        </div>
      </article>
    )
  }
}

export default CartItemsIndex;