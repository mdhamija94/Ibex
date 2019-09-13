import React from 'react';
import { Switch, Route } from 'react-router-dom';
import Nav from './header/nav';
import Footer from './footer/footer';
import HomeContainer from './home/home_container';
import LoginFormContainer from './session_form/login_form_container';
import SignupFormContainer from './session_form/signup_form_container';
import SneakerIndexContainer from './sneaker/sneaker_index_container';
import SneakerDetailContainer from './sneaker/sneaker_detail_container';
import AuthRoute from '../util/route_util';

const App = () => (
  <div>
    <header className="header-container">
      <Nav />
    </header>

    <main className="main-content-container">
      <Switch>
        <Route path="/sneakers/:sneakerId" component={ SneakerDetailContainer } />
        <Route path="/index" component={ SneakerIndexContainer } />
        <AuthRoute path="/login" component={ LoginFormContainer } />
        <AuthRoute path="/signup" component={ SignupFormContainer } />
        <Route exact path="/" component={ HomeContainer } />
      </Switch>
    </main>

    <footer>
      <Footer />
    </footer>
  </div>
);

export default App;