import { useEffect, useState } from "react";
import Button from "../components/Button";
import { addRaceRequest } from "../request/races";
import Input from "../components/Input";
import { raceRequest } from "../request/races";

const Administration = () => {
  const [newRace, setNewRace] = useState("");
  const [allRace, setAllRaces] = useState([]);

  const addRace = async (name: string) => {
    const resp = await addRaceRequest(name);
    console.log("ADD RACE REQUEST", resp);
  };

  const getRaces = async () => {
    const resp = await raceRequest();
    console.log("ALL RACES", resp.data);
    setAllRaces(resp.data);
  };

  useEffect(() => {
    getRaces();
  }, []);

  return (
    <div className="administration-body animated-page">
      <h1>Administration</h1>

      <hr />
      {/* // RACE MANAGEMENT // */}
      <div className="column-display">
        <span className="bold">RACE</span>
        <div className="small-separator" />
        <Input placeholder="New race" value={newRace} change={setNewRace} />
        <div className="small-separator" />
        <Button click={() => addRace(newRace)}>Submit new race</Button>
        <div className="small-separator" />
        <table>
          <thead>
            <tr style={{ textAlign: "left" }}>
              <th>Nom</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            {allRace.map((e: any, index: number) => {
              return (
                <tr key={`TABLE_RACE_${index}`}>
                  <td>{e.name}</td>
                  <td>
                    <Button>Remove</Button>
                  </td>
                </tr>
              );
            })}
          </tbody>
        </table>
      </div>
      <hr />
    </div>
  );
};

export default Administration;
