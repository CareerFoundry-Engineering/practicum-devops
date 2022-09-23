import * as React from 'react';
import { Table, Alert } from 'react-daisyui';
import PropTypes from 'prop-types';
import UserTableRow from 'Components/Users/UserTableRow';

function UserTableBody({ users }) {
  if (users.length <= 0) {
    return (
      <Table.Body>
        <tr>
          <td colSpan={3}>
            <Alert status="error">
              <span>users cannot be find</span>
            </Alert>
          </td>
        </tr>
      </Table.Body>
    );
  }

  return (
    <Table.Body>
      { users.map((user) => <UserTableRow user={user} key={user.uuid} />) }
    </Table.Body>
  );
}

UserTableBody.propTypes = {
  users: PropTypes.arrayOf(
    PropTypes.shape({
      email: PropTypes.string,
      uuid: PropTypes.string,
      name: PropTypes.string,
      ocupation: PropTypes.string,
      bio: PropTypes.string,
    }),
  ),
};

UserTableBody.defaultProps = {
  users: [],
};

export default UserTableBody;
