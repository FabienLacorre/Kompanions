import axios from "axios";
import { getToken } from "./user";
const url = "http://localhost:8090/race";

const raceRequest = () => {
  return axios.get(`${url}`, {
    headers: { Authorization: `Bearer ${getToken()}` },
  });
};

export { raceRequest };
