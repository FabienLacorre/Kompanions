import { useEffect, useState } from "react";
import Button from "../components/Button";
import { addRaceRequest } from "../request/races";
import Input from "../components/Input";

const Administration = () => {
  const [newRace, setNewRace] = useState("");

  const addRace = async (name: string) => {
    const resp = await addRaceRequest(name);
    console.log("ADD RACE REQUEST", resp);
  };

  return (
    <div className="administration-body">
      <h1>Administration</h1>

      <hr />
      {/* // RACE MANAGEMENT // */}
      <div className="column-display">
        <span className="bold">RACE</span>
        <div className="small-separator" />
        <Input placeholder="New race" value={newRace} change={setNewRace} />
        <div className="small-separator" />
        <Button click={() => addRace(newRace)}>Submit new race</Button>
      </div>
      <hr />
    </div>
  );
};

export default Administration;
