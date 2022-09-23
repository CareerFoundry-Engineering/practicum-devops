import * as React from 'react';
import { Table, Badge } from 'react-daisyui';
import PropTypes from 'prop-types';

function UserTableRow({ user }) {
  const {
    email, uuid, name,
    ocupation, bio,
  } = user;
  return (
    <Table.Row>
      <div className="items-center space-x-3 truncate">
        {name}
        <br />
        <Badge color="ghost" size="sm">{uuid}</Badge>
        <br />
        <Badge color="ghost" size="sm">{email}</Badge>
      </div>
      <div>
        <div className="font-bold">{ocupation}</div>
      </div>
      <div>{bio}</div>
    </Table.Row>
  );
}

UserTableRow.propTypes = {
  user: PropTypes.shape({
    email: PropTypes.string,
    uuid: PropTypes.string,
    name: PropTypes.string,
    ocupation: PropTypes.string,
    bio: PropTypes.string,
  }),
};

UserTableRow.defaultProps = {
  user: {
    uuid: '',
    name: '',
    ocupation: '',
    email: '',
    bio: '',
  },
};

export default UserTableRow;
