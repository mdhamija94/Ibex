import { connect } from 'react-redux';
import Nav from './nav';

const mapStateToProps = (state) => ({
  currentUser: state.session.id
});

const mapDispatchToProps = (dispatch) => ({
  logout: () => dispatch(logout())
});

export default connect(mapStateToProps, mapDispatchToProps)(Nav);