import { connect } from 'react-redux';
import Nav from './nav';

const mapStateToProps = (state) => ({
  currentUser: state.session.id
});

export default connect(mapStateToProps, null)(Nav);