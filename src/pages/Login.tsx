import Button from "../components/Button";
import Input from "../components/Input";
import { useDispatch } from "react-redux";
import { goToRegister } from "../redux/pageSelection";

const Login = () => {
  const dispatch = useDispatch();
  const registerRediction = () => {
    dispatch(goToRegister());
  };

  return (
    <div className="login-body">
      <div className="login-input-container">
        <h1 className="ghost-white">Kompanions</h1>
        <Input placeholder="Email" rounded={true} />
        <div className="medium-separator"></div>
        <Input placeholder="Mot de passe" rounded={true} />
        <div className="medium-separator"></div>
        <Button click={registerRediction} color={"secondary"} rounded={true}>
          Se connecter
        </Button>
      </div>
    </div>
  );
};

export default Login;
