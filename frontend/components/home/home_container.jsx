import { connect } from 'react-redux';
import Home from './home';
import { logout } from '../../actions/session_actions';
import { fetchCart } from '../../actions/cart_actions';

const mapStateToProps = (state) => ({
  currentUser: state.session.id
});

const mapDispatchToProps = (dispatch) => ({
  logout: () => dispatch(logout()),
  fetchCart: () => dispatch(fetchCart())
});

export default connect(mapStateToProps, mapDispatchToProps)(Home);