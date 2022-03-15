import axios from "axios";
import { isAsExpression } from "typescript";

const url = "http://192.168.1.129:8090/user";

const saveToken = (token: string) => {
  localStorage.setItem("token", token);
};

const getToken = () => {
  return localStorage.getItem("token");
};

const loginRequest = (email: string, password: string) => {
  return axios.post(`${url}/connect`, { email, password });
};

const getAllUsersRequest = () => {
  return axios.get(`${url}`, {
    headers: { Authorization: `Bearer ${getToken()}` },
  });
};

export { saveToken, getToken, loginRequest, getAllUsersRequest };
