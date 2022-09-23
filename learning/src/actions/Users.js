import axios from 'axios';

export const ROOT_URL = 'http://localhost:3000';
export const FETCH_ALL_USERS = 'FETCH_ALL_USERS';

export function fetchAllUsers() {
  const url = `${ROOT_URL}/api/v1/users`;
  const request = axios.get(url);

  return {
    type: FETCH_ALL_USERS,
    payload: request,
  };
}
