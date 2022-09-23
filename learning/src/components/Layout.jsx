import PropTypes from 'prop-types';
import * as React from 'react';
import { Outlet } from 'react-router-dom';
import Navigation from 'Components/Navigation';

function Layout({ children }) {
  return (
    <div className="w-full h-screen p-8 bg-base-100">
      <div className="w-full h-full my-4">
        <Navigation />
        <br />
        <div className="my-4">
          {children}
        </div>
      </div>
    </div>
  );
}

Layout.defaultProps = {
  children: <Outlet />,
};

Layout.propTypes = {
  children: PropTypes.oneOfType([
    PropTypes.arrayOf(PropTypes.node),
    PropTypes.node,
  ]),
};

export default Layout;
