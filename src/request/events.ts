import axios from "axios";
import { getToken } from "./user";
const url = "http://192.168.1.129:8090/event";

const eventsRequest = () => {
  return axios.get(`${url}`, {
    headers: { Authorization: `Bearer ${getToken()}` },
  });
};

const deleteEventRequest = (id: string) => {
  return axios.delete(`${url}/delete/${id}`, {
    headers: { Authorization: `Bearer ${getToken()}` },
  });
};

const addEventRequest = (event: any) => {
  const { name, date } = event;
  return axios.post(
    `${url}/add`,
    {
      name,
      date,
    },
    { headers: { Authorization: `Bearer ${getToken()}` } }
  );
};
export { eventsRequest, addEventRequest, deleteEventRequest };
