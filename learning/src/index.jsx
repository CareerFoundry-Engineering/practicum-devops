import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import { HashRouter } from 'react-router-dom';
import { Provider } from 'react-redux';
import { createStore, applyMiddleware } from 'redux';
import ReduxPromise from 'redux-promise';

import App from 'Components/App';
import appReducer from './reducers';

const createStoreWithMiddleware = applyMiddleware(ReduxPromise)(createStore);

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <HashRouter>
      <Provider store={createStoreWithMiddleware(appReducer)}>
        <App />
      </Provider>
    </HashRouter>
  </React.StrictMode>,
);
