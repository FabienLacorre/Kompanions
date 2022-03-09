import "./styles/App.scss";
import "./styles/Login.scss";
import "./styles/Button.scss";
import "./styles/Utils.scss";
import "./styles/Input.scss";
import "./styles/Card.scss";
import "./styles/Colors.scss";
import "./styles/Dashboard.scss";
import "./styles/TopBar.scss";

import Topbar from "./components/TopBar";

import Login from "./pages/Login";
import Register from "./pages/Register";
import Dashboard from "./pages/Dashboard";
import { useSelector } from "react-redux";

const App = () => {
  const { page } = useSelector((state: any) => state.profileReducer);
  return (
    <div className="App">
      {page === "Login" && <Login />}
      {page === "Register" && <Register />}
      {page === "Dashboard" && (
        <>
          <Topbar />
          <Dashboard />
        </>
      )}
    </div>
  );
};

export default App;
