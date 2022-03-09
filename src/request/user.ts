import axios from "axios";

const url = "http://localhost:8090/user";

const saveToken = (token: string) => {
  localStorage.setItem("token", token);
};
const getToken = () => {
  return localStorage.getItem("token");
};

const loginRequest = (email: string, password: string) => {
  return axios.post(`${url}/connect`, { email, password });
};

export { saveToken, getToken, loginRequest };
