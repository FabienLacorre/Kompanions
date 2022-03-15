import { createSlice, PayloadAction } from "@reduxjs/toolkit";

type IdPayload = {
  id: string;
};

const initialState = {
  id: "",
  pet: {},
};

const selectedPetSlice = createSlice({
  name: "selectedPet",
  initialState: initialState,
  reducers: {
    setPetId: (state, { payload }: PayloadAction<IdPayload>) => {
      state.id = payload.id;
    },
  },
});

export const selectedPetReducer = selectedPetSlice.reducer;
export const { setPetId } = selectedPetSlice.actions;
