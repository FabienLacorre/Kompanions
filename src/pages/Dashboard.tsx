import { useEffect, useState } from "react";
import Card from "../components/Card";
import Button from "../components/Button";
import { useDispatch } from "react-redux";
import { petRequest, deletePetRequest } from "../request/pets";
import { goToAddPet } from "../redux/pageSelection";

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

  console.log(pets);
  return (
    <div className="dashboard-body">
      <h1>Dashboard</h1>
      <Button click={addPetRedirection}>Ajouter un Kompanion</Button>
      <div className="small-separator" />
      <div className="card-container">
        {pets.map((e: any, index: number) => (
          <div
            style={{ marginRight: 10, marginBottom: 10 }}
            key={`CARD_PET_${index}`}
          >
            <Card title={e.name} removeItem={() => deletePet(e._id)} />
          </div>
        ))}
      </div>
    </div>
  );
};

export default Dashboard;
