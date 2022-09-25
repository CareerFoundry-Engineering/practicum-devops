import axios from 'axios';

export const ROOT_URL = process.env.API_URL;
export const FETCH_ALL_USERS = 'FETCH_ALL_USERS';

export function fetchAllUsers() {
  const url = `${ROOT_URL}/api/v1/users`;
  const request = axios.get(url);

  return {
    type: FETCH_ALL_USERS,
    payload: request,
  };
}
