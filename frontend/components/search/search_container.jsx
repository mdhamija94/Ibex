import { connect } from 'react-redux';
import Search from './search';
import { searchSneakers, resetSneakers } from '../../actions/sneaker_actions';
import { debounce } from 'lodash';

const mapStateToProps = (state) => ({
  sneakers: Object.values(state.entities.sneakers)
});

const mapDispatchToProps = (dispatch) => ({
  searchSneakers: debounce((query) => dispatch(searchSneakers(query)), 500),
  resetSneakers: () => dispatch(resetSneakers())
});

export default connect(mapStateToProps, mapDispatchToProps)(Search);