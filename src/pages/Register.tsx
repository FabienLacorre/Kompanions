import Button from "../components/Button";
import Input from "../components/Input";
import { useDispatch } from "react-redux";
import { goToLogin } from "../redux/pageSelection";
const Login = () => {
  const dispatch = useDispatch();
  const loginRedirection = () => {
    dispatch(goToLogin());
  };

  return (
    <div className="login-body">
      <div className="login-input-container">
        <h1 className="ghost-white">Kompanions</h1>
        <Input placeholder="Email" rounded={true} />
        <div className="medium-separator"></div>
        <Input placeholder="Mot de passe" rounded={true} />
        <div className="medium-separator"></div>
        <Input placeholder="Validation du mot de passe" rounded={true} />
        <div className="medium-separator"></div>
        <Button color={"secondary"} rounded={true}>
          Créer votre compte
        </Button>
        <div className="medium-separator"></div>
        <Button click={loginRedirection} color={"secondary"} rounded={true}>
          Vous avez deja un compte?
        </Button>
      </div>
    </div>
  );
};

export default Login;
