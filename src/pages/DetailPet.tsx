import { useEffect } from "react";
import { useSelector } from "react-redux";
import { petByIdRequest } from "../request/pets";
import { setPet } from "../redux/selectedPet";
import { useDispatch } from "react-redux";
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
        <span>Id: {id}</span>
        <span>Race: {pet.race && pet.race.name}</span>
        <span>Lieux d'adoption: {pet.adoptionLocation}</span>
        <span>Numéro: {pet.identificationNumber}</span>
        <span>Date de naissance: {pet.birthDate}</span>
      </div>
    </div>
  );
};

export default DetailPet;
