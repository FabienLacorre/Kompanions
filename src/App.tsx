import "./styles/App.scss";
import "./styles/Login.scss";
import "./styles/Button.scss";
import "./styles/Utils.scss";
import "./styles/Input.scss";
import "./styles/Card.scss";
import "./styles/Colors.scss";
import "./styles/Dashboard.scss";
import "./styles/TopBar.scss";
import "./styles/AddPet.scss";
import "./styles/Administration.scss";
import "./styles/DetailPet.scss";

import Topbar from "./components/TopBar";
import Login from "./pages/Login";
import Register from "./pages/Register";
import Dashboard from "./pages/Dashboard";
import AddPet from "./pages/AddPet";
import Administration from "./pages/Administration";
import DetailPet from "./pages/DetailPet";

import { useSelector } from "react-redux";

const App = () => {
  const { page } = useSelector((state: any) => state.pageReducer);
  return (
    <div className="App">
      {page === "Login" && <Login />}
      {page === "Register" && <Register />}
      {page === "AddPet" && (
        <>
          <Topbar />
          <div style={{ height: 60 }} />
          <AddPet />
        </>
      )}
      {page === "Dashboard" && (
        <>
          <Topbar />
          <div style={{ height: 60 }} />
          <Dashboard />
        </>
      )}
      {page === "Administration" && (
        <>
          <Topbar />
          <div style={{ height: 60 }} />
          <Administration />
        </>
      )}
      {page === "DetailPet" && (
        <>
          <Topbar />
          <div style={{ height: 60 }} />
          <DetailPet />
        </>
      )}
    </div>
  );
};

export default App;
