// stores/flightStore.js
import { defineStore } from "pinia";
import { toast } from "vue3-toastify";
import axios from "axios";
import router from "@/router";

export const useFlightStore = defineStore("flightStore", {
  state: () => ({
    flights: [],
    loading: false,
    selectedFlight: null,
    searchData: [],
  }),
  actions: {
    async fetchFlights() {
      try {
        const res = await axios.get("/flights-all");
        // Add seats property to each flight
        this.flights = res.data.map((flight) => ({ ...flight, seats: 1 }));
        console.error("these are them:", this.flights);
      } catch (error) {
        console.error("Failed to fetch flights:", error);
      }
    },
    increaseSeats(id, availableSeats) {
      const flight = this.flights.find((f) => f.id === id);
      if (flight && flight.seats < availableSeats) {
        flight.seats++;
      } else {
        toast.info(`This flight has only ${availableSeats} available seat(s).`);
      }
    },
    decreaseSeats(id) {
      const flight = this.flights.find((f) => f.id === id);
      if (flight && flight.seats > 1) {
        flight.seats--;
      }
    },
    bookFlight(id) {
      const flight = this.flights.find((f) => f.id === id);
      if (!flight) return;

      this.selectedFlight = flight;
      this.searchData = [{ seats: flight.seats }];

      this.loading = true;
      setTimeout(() => {
        this.loading = false;
        router.push("/book-flight");
      }, 2000);
    },
  },
});
