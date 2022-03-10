import { createSlice, PayloadAction } from "@reduxjs/toolkit";

type TPayload = {
  page: string;
};

const initialState = {
  previousPage: [] as string[],
  page: "Login",
};

const pageSlice = createSlice({
  name: "page",
  initialState: initialState,
  reducers: {
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
    goBack: (state) => {
      state.page = state.previousPage.pop() || "Dashboard";
    },
    // changeEmail: (state, { payload }: PayloadAction<TPayload>) => {
    //   state.email = payload.email;
    // }
  },
});

export const pageReducer = pageSlice.reducer;
export const { goToLogin, goToRegister, goToDashboard, goToAddPet, goBack } =
  pageSlice.actions;
