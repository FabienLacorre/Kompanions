import Button from "../components/Button";
import Input from "../components/Input";
import { useDispatch } from "react-redux";
import { goToRegister, goToDashboard } from "../redux/pageSelection";
import { useState } from "react";
import { saveToken, getToken, loginRequest } from "../request/user";
const Login = () => {
  const dispatch = useDispatch();
  const [email, setEmail] = useState("fab.lacorre@gmail.com");
  const [password, setPassword] = useState("test");

  const registerRediction = () => {
    dispatch(goToRegister());
  };

  const dashboardRediction = () => {
    dispatch(goToDashboard());
  };

  const loginValidation = async () => {
    try {
      const resp = await loginRequest(email, password);
      saveToken(resp.data.token);
      dashboardRediction();
    } catch (err: any) {
      alert(err.response.data);
    }
  };

  return (
    <div className="login-body">
      <div className="login-input-container">
        <h1 className="ghost-white">Kompanions</h1>
        <Input
          change={setEmail}
          value={email}
          placeholder="Email"
          rounded={true}
        />
        <div className="medium-separator"/>
        <Input
          change={setPassword}
          value={password}
          placeholder="Mot de passe"
          rounded={true}
        />
        <div className="medium-separator"/>
        <Button click={loginValidation} color={"secondary"} rounded={true}>
          Se connecter
        </Button>
        <div className="medium-separator"/>
        <Button click={registerRediction} rounded={true}>
          Vous n'avez pas de compte? cliquez ici
        </Button>
      </div>
    </div>
  );
};

export default Login;
