import { useEffect } from "react";
import { useSelector } from "react-redux";
import { petByIdRequest } from "../request/pets";
import { setPet } from "../redux/selectedPet";
import { useDispatch } from "react-redux";
import Button from "../components/Button";
import moment from "moment";

const DetailPet = () => {
  const dispatch = useDispatch();
  const { id, pet } = useSelector((state: any) => state.selectedPetReducer);

  const getPetBydId = async () => {
    const resp = await petByIdRequest(id);
    console.log("PET BY ID", resp.data);
    dispatch(setPet(resp.data));
  };

  useEffect(() => {
    if (id != null && id != "") {
      getPetBydId();
    }
  }, []);

  return (
    <div className="detail-pet-body">
      <h1>{pet.name}</h1>
      <div className="column-display">
        <Button>Modifier</Button>
        <div className="small-separator" />
        <Button>Evenements</Button>
        <div className="small-separator" />
        <div
          className="image"
          style={{ backgroundImage: `url(/image/placeholder.png)` }}
        ></div>
        <div className="small-separator" />
        <span>Id: {id}</span>
        <span>Race: {pet.race && pet.race.name}</span>
        <span>Lieux d'adoption: {pet.adoptionLocation}</span>
        <span>Numéro: {pet.identificationNumber}</span>
        <span>
          Date de naissance: {moment(pet.birthDate).format("DD/MM/YYYY")}
        </span>
      </div>
    </div>
  );
};

export default DetailPet;
