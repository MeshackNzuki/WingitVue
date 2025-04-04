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
        updateUserData(newUserdata) {
            Object.assign(this.user, {
                name: newUserdata.name || newUserdata.company_name,
                email: newUserdata.email,
                avatar: newUserdata.avatar,
                phone: newUserdata.phone,
                nationality: newUserdata.nationality,
            });
        },
         logout() {
            // Perform logout operation here...
            this.user = null;
            this.is_authenticated = false;
            // Reset the store's state
            axios
                .post("/logout")
                .then(() => {
                    this.user = null;
                    this.is_authenticated = false;
                    router.push("/login");
                })
                .catch((error) => {
                    console.error("Logout failed:", error);
                    //still remove user data
                    this.user = null;
                    this.is_authenticated = false;
                    router.push("/login");
                });
            router.push("/login");
        },
        goToUserArea() {
            if (this.user) {
                const userData = this.user;
                // Handle role-based redirection
                if (userData.role === "aircraft_operator") {
                    router.push("/aircraft-operator");
                } else if (userData.role === "tourism_operator") {
                    router.push("/tourism-operator");
                } else if (userData.role === "customer") {
                    router.push("/customer");
                } else {
                    this.logout()
                }
            }
        },
        logout() {
            // Perform logout operation here...
            this.user = null;
            this.is_authenticated = false;
            // Reset the store's state
            axios
                .post("/logout")
                .then(() => {
                    this.user = null;
                    this.is_authenticated = false;
                    router.push("/login");
                })
                .catch((error) => {
                    console.error("Logout failed:", error);
                    //still remove user data
                    this.user = null;
                    this.is_authenticated = false;
                    router.push("/login");
                });
            router.push("/login");
        },
    },
});
