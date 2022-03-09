import Button from "../components/Button";
import Input from "../components/Input";
const Login = () => {
  return (
    <div className="login-body">
      <div className="login-input-container">
        <h1 className="ghost-white">Kompanions</h1>
        <Input rounded={true} />
        <div className="medium-separator"></div>
        <Input rounded={true} />
        <div className="medium-separator"></div>
        <Button color={"secondary"} rounded={true}>
          Se connecter
        </Button>
      </div>
    </div>
  );
};

export default Login;
