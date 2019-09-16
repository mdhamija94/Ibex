import { connect } from 'react-redux';
import Search from './search';
import { searchSneakers, resetSneakers } from '../../actions/sneaker_actions';

const mapStateToProps = (state) => ({
  sneakers: Object.values(state.entities.sneakers)
});

const mapDispatchToProps = (dispatch) => ({
  searchSneakers: (query) => dispatch(searchSneakers(query)),
  resetSneakers: () => dispatch(resetSneakers())
});

export default connect(mapStateToProps, mapDispatchToProps)(Search);