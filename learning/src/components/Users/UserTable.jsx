import * as React from 'react';
import { Table } from 'react-daisyui';
import PropTypes from 'prop-types';
import { fetchAllUsers } from 'Actions/Users';
import UserTableBody from 'Components/Users/UserTableBody';
import { connect } from 'react-redux';

function UserTable({ users, usersFetched, allUsers }) {
  if (usersFetched === false) { allUsers(); }

  return (
    <div className="overflow-x-auto">
      <Table width="100%" zebra>
        <Table.Head>
          <span>Name/Job</span>
          <span>Email</span>
          <span>Quote</span>
        </Table.Head>
        <UserTableBody users={users} />
      </Table>
    </div>
  );
}

UserTable.propTypes = {
  allUsers: PropTypes.func,
  usersFetched: PropTypes.bool,
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

UserTable.defaultProps = {
  allUsers: () => {},
  users: [],
  usersFetched: false,
};

function mapDispatchToProps(dispatch) {
  return ({
    allUsers: () => { dispatch(fetchAllUsers()); },
  });
}

function mapStateToProps({ users, usersFetched }) {
  return { users, usersFetched };
}

export default connect(mapStateToProps, mapDispatchToProps)(UserTable);
