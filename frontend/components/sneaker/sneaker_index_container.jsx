import { connect } from 'react-redux';
import { fetchSneakers, resetSneakers } from '../../actions/sneaker_actions';
import SneakerIndex from './sneaker_index';

const mapStateToProps = (state) => ({
  sneakers: Object.values(state.entities.sneakers),
  sneakerCount: state.UI.sneakerCount
});

const mapDispatchToProps = (dispatch) => ({
  fetchSneakers: (page) => dispatch(fetchSneakers(page)),
  resetSneakers: () => dispatch(resetSneakers())
});

export default connect(mapStateToProps, mapDispatchToProps)(SneakerIndex);