import axios from "axios";
import { getToken } from "./user";
const url = "http://192.168.1.129:8090/race";

const raceRequest = () => {
  return axios.get(`${url}`, {
    headers: { Authorization: `Bearer ${getToken()}` },
  });
};

const addRaceRequest = (name: String) => {
  return axios.post(
    `${url}/add`,
    { name },
    { headers: { Authorization: `Bearer ${getToken()}` } }
  );
};
export { raceRequest, addRaceRequest };
