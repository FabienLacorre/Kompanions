import { useEffect, useState } from "react";
import Card from "../components/Card";
import { petRequest } from "../request/pets";

const Dashboard = () => {
  const [pets, setPets] = useState([]);

  const getPets = async () => {
    const resp = await petRequest();
    setPets(resp.data);
  };

  useEffect(() => {
    getPets();
  }, []);

  return (
    <div className="dashboard-body">
      <h1>Dashboard</h1>
      {pets.map((e: any) => (
        <Card title={e.name}></Card>
      ))}
    </div>
  );
};

export default Dashboard;
