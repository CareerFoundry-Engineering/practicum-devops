import { FETCH_ALL_USERS } from 'Actions/Users';

const initialState = {
  users: [],
  usersFetched: false,
};

// eslint-disable-next-line default-param-last
const appReducer = (state = initialState, action) => {
  switch (action.type) {
    case FETCH_ALL_USERS:
      return {
        usersFetched: true,
        users: action.payload.data.data,
      };
    default:
      return state;
  }
};

export default appReducer;
