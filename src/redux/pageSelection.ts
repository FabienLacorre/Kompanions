import { createSlice, PayloadAction } from "@reduxjs/toolkit";

const initialState = {
  previousPage: [] as string[],
  page: "Login",
};

const pageSlice = createSlice({
  name: "page",
  initialState: initialState,
  reducers: {
    goBack: (state) => {
      state.page = state.previousPage.pop() || "Dashboard";
    },
    goToLogin: (state) => {
      state.page = "Login";
    },
    goToRegister: (state) => {
      state.page = "Register";
    },
    goToDashboard: (state) => {
      state.previousPage = [];
      state.page = "Dashboard";
    },
    goToAddPet: (state) => {
      state.previousPage.push(state.page);
      state.page = "AddPet";
    },
    goToAdministration: (state) => {
      state.previousPage.push(state.page);
      state.page = "Administration";
    },
    goToDetailPet: (state) => {
      state.previousPage.push(state.page);
      state.page = "DetailPet";
    },
  },
});

export const pageReducer = pageSlice.reducer;
export const {
  goToLogin,
  goToRegister,
  goToDashboard,
  goToAddPet,
  goToAdministration,
  goToDetailPet,
  goBack,
} = pageSlice.actions;
