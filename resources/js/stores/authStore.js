import { defineStore } from "pinia";
import { toast } from "vue3-toastify";
import axios from "axios";
import router from "@/router";

export const authStore = defineStore("authStore", {
    persist: true,
    state: () => ({
        is_authenticated: false,
        user: null,
    }),
    actions: {
        login(userData) {
            if (userData.token) {
                this.user = userData;
                this.is_authenticated = true;
                this.goToUserArea();
            } else {
                toast.error("Login failed. Please check your credentials.");
            }
        },
        goToUserArea() {
            if (this.user) {
                const userData = this.user;
                // Handle role-based redirection
                if (userData.role === "aircraft_operator") {
                    router.push("/aircraft-operator");
                } else if (userData.role === "tourism_operator") {
                    router.push("/tourism-operator");
                } else if (userData.role === "client") {
                    router.push("/client");
                } else {
                    // Handle other user roles
                }
            }
        },
        logout() {
            // Perform logout operation here...
            // Reset the store's state
            axios
                .post("/logout")
                .then(() => {
                    router.push("/login");
                })
                .catch((error) => {
                    console.error("Logout failed:", error);
                })
                .finally(() => {
                    this.user = null;
                    this.is_authenticated = false;
                });
        },
    },
});
