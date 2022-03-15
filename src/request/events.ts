import axios from "axios";
import { getToken } from "./user";
const url = "http://192.168.1.129:8090/event";

const eventsRequest = () => {
  return axios.get(`${url}`, {
    headers: { Authorization: `Bearer ${getToken()}` },
  });
};

export { eventsRequest };
