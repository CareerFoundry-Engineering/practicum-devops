import * as React from 'react';
import UserTable from 'Components/Users/UserTable';

function Home() {
  return (
    <>
      <h1 className="text-4xl text-base-content font-bold">Users</h1>
      <p className="text-base-content">get to know your peers</p>
      <br />
      <div className="block sm:grid">
        <UserTable />
      </div>
    </>
  );
}

export default Home;
