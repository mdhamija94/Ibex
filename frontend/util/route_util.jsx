import React from 'react';
import { connect } from 'react-redux';
import { Route, Redirect, withRouter } from 'react-router-dom';

const mapStateToProps = state => {
  return { loggedIn: Boolean(state.session.id) };
};

const Auth = ({ component: Component, path, loggedIn, exact }) => {
  if (loggedIn) {
    return (<Redirect to="/" />)
  } else {
    return (
      <Route
        path={path}
        exact={exact}
        render={props => <Component {...props} />}
      />
    )
  }
};

const AuthRoute = withRouter(
  connect(mapStateToProps, null)(Auth)
);

export default AuthRoute;