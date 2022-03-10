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
      <div className="card-container">
        {pets.map((e: any) => (
          <>
          <div style={{marginRight: 10, marginBottom: 10}}>
          <Card title={e.name}></Card>
          </div>
            
          </>
        ))}
      </div>
    </div>
  );
};

export default Dashboard;
