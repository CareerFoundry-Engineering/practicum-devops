import * as React from 'react';
import { Navbar } from 'react-daisyui';

function Navigation() {
  return (
    <Navbar className="p-0 border-b border-neutral text-base-content">
      <div className="flex-1 navbar-start">
        <span className="text-xl font-bold">
          devops-practicum/...
        </span>
      </div>
    </Navbar>
  );
}
export default Navigation;
