import { defineStore } from "pinia";
import { toast } from "vue3-toastify";

export const authStore = defineStore("authStore", {
    persist: true,
    state: () => ({
        is_authenticated: false,
        user: null,
    }),
    actions: {
        login(userData) {
            // Perform login operation here...
            // After successful login, update the store's state with user data
            this.user = userData;

            if (userData.token) {
                this.is_authenticated = true;
            }
            toast.success("Login success", {
                transition: toast.TRANSITIONS.ZOOM,
                position: toast.POSITION.TOP_CENTER,
            });
        },
        logout() {
            // Perform logout operation here...
            // Reset the store's state
            this.user = null;
            this.is_authenticated = false;
            // toast.success(item.name + " " + "added to cart", {
            //     transition: toast.TRANSITIONS.ZOOM,
            //     position: toast.POSITION.TOP_CENTER,
            // });
        },
    },
});
