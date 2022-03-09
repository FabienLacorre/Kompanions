import { useDispatch } from "react-redux";
import { goToLogin } from "../redux/pageSelection";
import Button from "../components/Button";

const Login = () => {
  const dispatch = useDispatch();
  const loginRedirection = () => {
    dispatch(goToLogin());
  };
  return (
    <div className="dashboard-body">
      <Button click={loginRedirection}>Déconnexion</Button>
      <h1>Dashboard</h1>
    </div>
  );
};

export default Login;
