import { useEffect, useState } from "react";
import Card from "../components/Card";
import Button from "../components/Button";
import { useDispatch } from "react-redux";
import { petRequest } from "../request/pets";
import { goToAddPet } from "../redux/pageSelection";

const Dashboard = () => {
  const [pets, setPets] = useState([]);
  const dispatch = useDispatch();
  const getPets = async () => {
    const resp = await petRequest();
    setPets(resp.data);
  };

  const addPetRedirection = () => {
    dispatch(goToAddPet());
  };

  useEffect(() => {
    getPets();
  }, []);

  return (
    <div className="dashboard-body">
      <h1>Dashboard</h1>
      <Button click={addPetRedirection}>Ajouter un Kompanion</Button>
      <div className="small-separator"></div>
      <div className="card-container">
        {pets.map((e: any, index: number) => (
          <div
            style={{ marginRight: 10, marginBottom: 10 }}
            key={`CARD_PET_${index}`}
          >
            <Card title={e.name}></Card>
          </div>
        ))}
      </div>
    </div>
  );
};

export default Dashboard;
