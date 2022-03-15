import axios from "axios";
import { getToken } from "./user";
const url = "http://localhost:8090/pet";

const petRequest = () => {
  return axios.get(`${url}`, {
    headers: { Authorization: `Bearer ${getToken()}` },
  });
};

const petByIdRequest = (id: string) => {
  return axios.get(`${url}/${id}`, {
    headers: { Authorization: `Bearer ${getToken()}` },
  });
};

const addPetRequest = (pet: any) => {
  const { name, adoptionLocation, identificationNumber, birthDate, race } = pet;
  return axios.post(
    `${url}/add`,
    {
      name,
      adoptionLocation,
      identificationNumber,
      birthDate,
      race,
    },
    { headers: { Authorization: `Bearer ${getToken()}` } }
  );
};

const deletePetRequest = (id: string) => {
  return axios.delete(`${url}/remove/${id}`, {
    headers: { Authorization: `Bearer ${getToken()}` },
  });
};

export { petRequest, addPetRequest, deletePetRequest, petByIdRequest };
