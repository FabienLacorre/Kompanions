import { createSlice, PayloadAction } from "@reduxjs/toolkit";

type TPayload = {
  page: string;
};

const initialState = {
  page: "Login",
};

const profileSlice = createSlice({
  name: "profile",
  initialState: initialState,
  reducers: {
    goToLogin: (state) => {
      state.page = "Login";
    },
    goToRegister: (state) => {
      state.page = "Register";
    },
    goToDashboard: (state) => {
      state.page = "Dashboard";
    },
    // changeEmail: (state, { payload }: PayloadAction<TPayload>) => {
    //   state.email = payload.email;
    // }
  },
});

export const profileReducer = profileSlice.reducer;
export const { goToLogin, goToRegister, goToDashboard } = profileSlice.actions;
