import React from 'react';
import { Redirect } from 'react-router-dom';

class SignupForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      fullName: "",
      email: "",
      password: ""
    };

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleInput(type) {
    return (e) => {
      this.setState({ [type]: e.target.value });
    };
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.signup(user);
  }

  // renderErrors() {
  //   debugger
  //   return (
  //     <ul>
  //       <li>{this.props.errors}</li>
  //     </ul>
  //   )
  // }

  render() {
    return (
      <section className="session-form-container">
        <div className="session-image-container">
          <img src="./assets/aj1-session.png" alt="" className="session-image" />
        </div>

        <div className="session-input-container">
          <h1 className="session-header">
            Create an Account
          </h1>
          <form onSubmit={this.handleSubmit}>
            {this.props.errors}
            <label className="session-field-label">
              Full Name
            </label>
            <input
              className="session-input"
              type="text"
              value={this.state.username}
              onChange={this.handleInput('full_name')}
            />
            <label className="session-field-label">
              Email Address
            </label>
            <input
              className="session-input"
              type="text"
              value={this.state.username}
              onChange={this.handleInput('email')}
            />
            <label className="session-field-label">
              Password
            </label>
            <input
              className="session-input"
              type="password"
              value={this.state.password}
              onChange={this.handleInput('password')}
            />
          </form>
          <button className="session-form-button" onClick={this.handleSubmit}>
            <a href="">Create Account</a>
          </button>
        </div>
      </section>
    )
  }
}

export default SignupForm;