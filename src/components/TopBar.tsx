import Button from "../components/Button";
import { useDispatch } from "react-redux";
import { goToLogin, goBack } from "../redux/pageSelection";
import { useSelector } from "react-redux";

const Topbar = () => {
  const { page } = useSelector((state: any) => state.pageReducer);
  const dispatch = useDispatch();
  const loginRedirection = () => {
    dispatch(goToLogin());
  };

  const backRedirection = () => {
    dispatch(goBack());
  };
  return (
    <div className="topBar">
      {page !== "Dashboard" && (
        <Button color="secondary" click={backRedirection}>
          GO BACK
        </Button>
      )}
      Kompanions
      <Button color="secondary" click={loginRedirection}>
        Déconnexion
      </Button>
    </div>
  );
};

export default Topbar;
