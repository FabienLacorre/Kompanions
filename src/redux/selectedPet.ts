import { createSlice, PayloadAction } from "@reduxjs/toolkit";

type PetPayload = {
  name: any;
};

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
    setPet: (state, { payload }: PayloadAction<PetPayload>) => {
      state.pet = payload;
    },
  },
});

export const selectedPetReducer = selectedPetSlice.reducer;
export const { setPetId, setPet } = selectedPetSlice.actions;
