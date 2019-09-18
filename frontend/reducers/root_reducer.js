import { combineReducers } from 'redux';
import EntitiesReducer from './entities_reducer';
import SessionReducer from './session_reducer';
import ErrorsReducer from './errors_reducer';
import UIReducer from './ui_reducer';

const RootReducer = combineReducers({
  entities: EntitiesReducer,
  session: SessionReducer,
  errors: ErrorsReducer,
  UI: UIReducer
});

export default RootReducer;