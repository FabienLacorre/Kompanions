import Button from "../components/Button";
import { useDispatch } from "react-redux";
import { goToLogin, goBack } from "../redux/pageSelection";
import { useSelector } from "react-redux";
import { BsFillCaretLeftFill } from "react-icons/bs";
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
    <div className="topBar ">
      <div className="topBar-container scroll-item">
        {page !== "Dashboard" && (
          <Button color="secondary" click={backRedirection}>
           <BsFillCaretLeftFill/>
          </Button>
        )}
        Kompanions
        <Button color="secondary" click={loginRedirection}>
          Déconnexion
        </Button>
      </div>
    </div>
  );
};

export default Topbar;
