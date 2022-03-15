import { useEffect, useState } from "react";
import Card from "../components/Card";
import Button from "../components/Button";
import { useDispatch } from "react-redux";
import { petRequest, deletePetRequest } from "../request/pets";
import {
  goToAddPet,
  goToAdministration,
  goToDetailPet,
} from "../redux/pageSelection";
import { setPetId } from "../redux/selectedPet";

const Dashboard = () => {
  const [pets, setPets] = useState([]);
  const dispatch = useDispatch();

  const getPets = async () => {
    const resp = await petRequest();
    console.log("PETS", resp.data);
    setPets(resp.data);
  };

  const deletePet = async (id: string) => {
    const resp = await deletePetRequest(id);
    console.log("DELETE PET", resp);
    await getPets();
  };

  useEffect(() => {
    getPets();
  }, []);

  const addPetRedirection = () => {
    dispatch(goToAddPet());
  };

  const administrationRedirection = () => {
    dispatch(goToAdministration());
  };

  const detailPetRedirection = (id: string) => {
    dispatch(setPetId({ id }));
    dispatch(goToDetailPet());
  };

  return (
    <div className="dashboard-body">
      <h1>Dashboard</h1>
      <Button click={administrationRedirection} color="secondary">
        ADMINISTRATION
      </Button>
      <div className="small-separator" />
      <Button click={addPetRedirection}>Ajouter un Kompanion</Button>
      <div className="small-separator" />
      <div className="card-container">
        {pets.map((e: any, index: number) => (
          <div
            style={{ marginRight: 10, marginBottom: 10 }}
            key={`CARD_PET_${index}`}
          >
            <Card
              title={e.name}
              subTitle={e.race.name}
              redirection={() => detailPetRedirection(e._id)}
              removeItem={() => deletePet(e._id)}
            />
          </div>
        ))}
      </div>
    </div>
  );
};

export default Dashboard;
