import Button from "../components/Button";
import { useDispatch } from "react-redux";
import { goToLogin } from "../redux/pageSelection";

const Topbar = () => {
  const dispatch = useDispatch();
  const loginRedirection = () => {
    dispatch(goToLogin());
  };
  return (
    <div className="topBar">
      Kompanions
      <Button color="secondary" click={loginRedirection}>Déconnexion</Button>
    </div>
  );
};

export default Topbar;
