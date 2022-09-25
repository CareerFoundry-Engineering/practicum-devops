// const createStoreWithMiddleware = applyMiddleware(ReduxPromise)(createStore);
import { applyMiddleware, compose, createStore } from 'redux';
import ReduxPromise from 'redux-promise';
import appReducer from '../reducers';

const composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;

export default createStore(
  appReducer,
  composeEnhancers(applyMiddleware(ReduxPromise)),
);
