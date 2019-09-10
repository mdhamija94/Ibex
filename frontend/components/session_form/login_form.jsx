import React from 'react';

class LoginForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      email: "",
      password: ""
    };
    this.demoUser = {
      email: "demo@ibex.io",
      password: "DemoUserLogin23!"
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleDemo = this.handleDemo.bind(this);
  }

  handleInput(type) {
    return (e) => {
      this.setState({ [type]: e.target.value });
    };
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.login(user);
  }

  handleDemo(e) {
    e.preventDefault();
    const demoUser = Object.assign({}, this.demoUser);
    this.props.login(demoUser);
  }

  render() {
    return (
      <section className="session-form-container">

        <div className="session-image-container">
          <img src="./assets/aj1-session.png" alt="" className="session-image"/>
        </div>

        <div className="session-input-container">
          <h1 className="session-header">
            Log In
          </h1>
          <form onSubmit={this.handleSubmit}>
            <label className="session-field-label">
              Email Address
            </label>
            <input
              className="session-input"
              type="text"
              value={this.state.username}
              onChange={this.handleInput('email')}
            />
            <div className="session-errors">
              {this.props.errors.login}
            </div>
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
          <button className="demo-button" onClick={this.handleDemo}>
            <a href="">Demo User</a>
          </button>
          <button className="session-form-button" onClick={this.handleSubmit}>
            <a href="">Log In</a>
          </button>
        </div>
      </section>
    )
  }
}

export default LoginForm;