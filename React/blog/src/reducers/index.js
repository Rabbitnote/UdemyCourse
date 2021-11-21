import { combineReducers } from 'redux';
import postReducers from './postReducers';
import userReducer from './userReducer';
export default combineReducers({
    posts:postReducers,
    users:userReducer
 });
