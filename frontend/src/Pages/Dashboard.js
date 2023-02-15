import React from 'react'
import {
    BrowserRouter as Router,
    Switch,
    Route,
    Link
  } from "react-router-dom";

const Dashboard = () => {
  return (
    <Router>
        <nav>
          <ul>
            <li>
              <Link to="/">Home</Link>
            </li>
            <li>
              <Link to="/navbar">Navbar</Link>
            </li>
            <li>
              <Link to="/sidebar">Sidebar</Link>
            </li>
          </ul>
        </nav>
    </Router>

  )
}

export default Dashboard