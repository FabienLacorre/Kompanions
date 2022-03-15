import { useEffect } from "react";
import { useSelector } from "react-redux";

const DetailPet = () => {
  const { id } = useSelector((state: any) => state.selectedPetReducer);

  useEffect(() => {
    console.log("ID", id);
  }, []);

  return (
    <div className="detail-pet-body">
      <h1>Détail</h1>

      <div className="column-display">
        <span>Id: {id}</span>
        <span>Nom:</span>
        <span>Race:</span>
        <span>Lieux d'adoption:</span>
        <span>Numéro:</span>
        <span>Date de naissance:</span>
      </div>
    </div>
  );
};

export default DetailPet;
