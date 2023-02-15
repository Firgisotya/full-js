import './App.css';
import Sidebar from './components/Sidebar';
import Dashboard from './Pages/Dashboard';
import {
  Routes,
  Route,
} from "react-router-dom";
import Navbar from './components/Navbar';

function App() {
  return (
    <div className="App">

      <Routes>
          <Route path="/navbar">
            <Navbar />
          </Route>
          <Route path="/sidebar">
            <Sidebar />
          </Route>
          <Route path="/">
            <Dashboard />
          </Route>
        </Routes>
    </div>
  );
}

export default App;
