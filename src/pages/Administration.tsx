import { useEffect, useState } from "react";
import Button from "../components/Button";
import { addRaceRequest } from "../request/races";
import Input from "../components/Input";
import { raceRequest } from "../request/races";
import { getAllUsersRequest } from "../request/user";
import { Table } from "react-bootstrap";

const RaceManagement = () => {
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
    <div className="column-display">
      <span className="bold">RACE</span>
      <div className="small-separator" />
      <Input placeholder="New race" value={newRace} change={setNewRace} />
      <div className="small-separator" />
      <Button click={() => addRace(newRace)}>Submit new race</Button>
      <div className="small-separator" />
       <Table striped bordered hover>
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
      </Table>
    </div>
  );
};

const UserManagement = () => {
  const [allUsers, setAllUsers] = useState([]);

  const getAllUsers = async () => {
    const resp = await getAllUsersRequest();
    setAllUsers(resp.data);
  };

  useEffect(() => {
    getAllUsers();
  }, []);

  return (
    <div className="column-display">
      <span className="bold">USERS</span>
      <div className="small-separator" />{" "}
       <Table striped bordered hover>
        <thead>
          <tr style={{ textAlign: "left" }}>
            <th>email</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          {allUsers.map((e: any, index: number) => {
            return (
              <tr key={`TABLE_USER_${index}`}>
                <td>{e.email}</td>
                <td>
                  <Button>Remove</Button>
                </td>
              </tr>
            );
          })}
        </tbody>
      </Table>
    </div>
  );
};

const Administration = () => {
  return (
    <div className="administration-body animated-page">
      <h1 className="bold">Administration</h1>
      <hr />
      <UserManagement />
      <hr />
      <RaceManagement />
      <hr />
    </div>
  );
};

export default Administration;
