import PropTypes from 'prop-types';
import * as React from 'react';
import { Outlet } from 'react-router-dom';

function Layout({ children }) {
  return (
    <div className="grid grid-cols-1 gap-6 lg:p-10 xl:grid-cols-4 lg:bg-base-200 rounded-box">
      {children}
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
