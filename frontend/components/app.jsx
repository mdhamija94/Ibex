import React from 'react';
import { Route } from 'react-router-dom';
import Nav from './header/nav';
import LoginFormContainer from './session_form/login_form_container';
import SignupFormContainer from './session_form/signup_form_container';
import AuthRoute from '../util/route_util';

const App = () => (
  <div>
    <header className="header-container">
      <Nav />
    </header>
    {/* <section>
      <a href="#">
        <img src="./assets/ts1_low.jpeg" alt="" />
      </a>
    </section> */}

    <main className="main-content-container">
      <AuthRoute path="/login" component={LoginFormContainer} />
      <AuthRoute path="/signup" component={SignupFormContainer} />
      <Route exact path="/" />
    </main>

    <footer>

    </footer>
  </div>
);

export default App;