import { connect } from 'react-redux';
import Search from './search';
import fetchSearchResults from '../../actions/sneaker_actions';

const mapDispatchToProps = (dispatch) => ({
  fetchSearchResults: (query) => dispatch(fetchSearchResults(query))
});

export default connect(null, mapDispatchToProps)(Search);