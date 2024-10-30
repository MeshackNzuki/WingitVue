// stores/mainStore.js
import { defineStore } from "pinia";
import { toast } from "vue3-toastify";
import axios from "axios";
import router from "@/router";

export const useMainStore = defineStore("mainStore", {
    persist: true,

    state: () => ({
        flights: [],
        loading: false,
        selectedFlight: null,
        totalSeats: [],
        sidebarOpen: true,
        airOpData: [],
        greetings: "Hi",
    }),

    actions: {
        async fetchFlights() {
            try {
                const res = await axios.get("/flights-all");
                // Add seats property to each flight
                this.flights = res.data.map((flight) => ({
                    ...flight,
                    seats: 1,
                }));
            } catch (error) {
                console.error("Failed to fetch flights:", error);
            }
        },
        increaseSeats(id, availableSeats) {
            const flight = this.flights.find((f) => f.id === id);
            if (flight && flight.seats < availableSeats) {
                flight.seats++;
            } else {
                toast.info(
                    `This flight has only ${availableSeats} available seat(s).`,
                );
            }
            this.totalSeats = flight.seats;
        },
        decreaseSeats(id) {
            const flight = this.flights.find((f) => f.id === id);
            if (flight && flight.seats > 1) {
                flight.seats--;
            }
            this.totalSeats = flight.seats;
        },
        bookFlight(id) {
            const flight = this.flights.find((f) => f.id === id);
            if (!flight) return;

            this.selectedFlight = flight;
            this.totalSeats = flight.seats;

            this.loading = true;
            setTimeout(() => {
                this.loading = false;
                router.push("/flight-booking");
            }, 500);
        },

        setDashDataAirOp(data) {
            this.airOpData = data;
        },

        // other utilities
        toggleSidebar() {
            this.sidebarOpen = !this.sidebarOpen;
        },
        //primariry for click outside
        closeSidebar() {
            this.sidebarOpen = false;
        },
        updateGreeting() {
            const currentHour = new Date().getHours();

            if (currentHour < 12) {
                this.greetings = "Good Morning";
            } else if (currentHour < 18) {
                this.greetings = "Good Afternoon";
            } else {
                this.greetings = "Good Evening";
            }
        },
        greeting() {
            return this.updateGreeting();
        },
        startInterval() {
            setInterval(this.greeting(), 60000);
        },
    },
});
