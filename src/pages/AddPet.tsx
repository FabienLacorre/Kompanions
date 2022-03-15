import { useEffect, useState } from "react";
import Button from "../components/Button";
import Input from "../components/Input";
import { raceRequest } from "../request/races";
import { addPetRequest } from "../request/pets";

const AddPet = () => {
  const [races, setRaces] = useState([]);
  const [petName, setPetName] = useState("");
  const [petNumber, setPetNumber] = useState("");
  const [petLocation, setPetLocation] = useState("");
  const [petRace, setPetRace] = useState("");
  const [petBirthDate, setPetBirthDate] = useState("");

  const getRaces = async () => {
    const resp = await raceRequest();
    resp.data = [{ name: "", _id: null }].concat(resp.data);
    console.log("RACES", resp.data);
    setRaces(resp.data);
  };

  const addPet = async () => {
    const resp = await addPetRequest({
      name: petName,
      adoptionLocation: petLocation,
      identificationNumber: petNumber,
      birthDate: petBirthDate,
      race: petRace,
    });
    console.log(resp);
  };

  useEffect(() => {
    getRaces();
  }, []);

  const addPetValidation = () => {
    console.log("petName", petName);
    console.log("petNumber", petNumber);
    console.log("petLocation", petLocation);
    console.log("petBirthDate", petBirthDate);
    console.log("petRace", petRace);
    addPet();
  };

  return (
    <div className="addPet-body">
      <h1>AddPet</h1>

      <div className="column-display">
        <Input value={petName} change={setPetName} placeholder="Nom" />
        <div className="small-separator" />
        <Input value={petNumber} change={setPetNumber} placeholder="Numéro" />
        <div className="small-separator" />
        <Input
          value={petLocation}
          change={setPetLocation}
          placeholder="Lieux d'adoption"
        />
        <div className="small-separator" />
        <input
          type="date"
          value={petBirthDate}
          onChange={(e) => setPetBirthDate(e.target.value)}
        />
        <div className="small-separator" />
        <select value={petRace} onChange={(e) => setPetRace(e.target.value)}>
          {races.map((e: any, index: number) => {
            return (
              <option value={e._id} key={`OPTION_RACE_${index}`}>
                {e.name}
              </option>
            );
          })}
        </select>
        <div className="small-separator" />
      </div>

      <Button click={addPetValidation}>Sauvegarder</Button>
    </div>
  );
};

export default AddPet;
