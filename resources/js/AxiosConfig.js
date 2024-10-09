import axios from "axios";
import { authStore } from "./stores/authStore";
axios.defaults.baseURL = "http://localhost:8000/api";
axios.defaults.headers.common["Access-Control-Allow-Credentials"] = "true";
axios.defaults.headers.common["Accept"] = "application/json";
axios.defaults.headers.common["X-Requested-With"] = "XMLHttpRequest";
axios.defaults.headers.common["Content-Type"] = "application/json";
axios.defaults.headers.common["withCredentials"] = true;

axios.interceptors.request.use(
    async function (config) {
        const { user } = authStore(); // Get user info from authStore
        const token = user?.token;

        // Show loader only if config.showLoader is not explicitly set to false
        if (config.showLoader !== false) {
            var loader = document.getElementById("loader");
            if (loader) loader.classList.remove("hidden");
        }

        if (token) {
            config.headers["Authorization"] = `Bearer ${token}`;
        }

        return config;
    },
    function (error) {
        // Hide loader in case of request error
        var loader = document.getElementById("loader");
        if (loader) loader.classList.add("hidden");
        return Promise.reject(error);
    },
);

// Add a response interceptor
axios.interceptors.response.use(
    function (response) {
        // Hide loader only if config.showLoader is not explicitly set to false
        if (response.config.showLoader !== false) {
            var loader = document.getElementById("loader");
            if (loader) loader.classList.add("hidden");
        }
        return response;
    },
    function (error) {
        // Hide loader in case of response error
        if (error.config.showLoader !== false) {
            var loader = document.getElementById("loader");
            if (loader) loader.classList.add("hidden");
        }
        return Promise.reject(error);
    },
);

export default axios;
