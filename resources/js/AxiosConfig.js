import axios from "axios";
import { authStore } from "./stores/authStore";
axios.defaults.baseURL = "http://127.0.0.1:8000/api";
axios.defaults.headers.common["Access-Control-Allow-Credentials"] = "true";
axios.defaults.headers.common["Accept"] = "application/json";
axios.defaults.headers.common["X-Requested-With"] = "XMLHttpRequest";
axios.defaults.headers.common["Content-Type"] = "application/json";
axios.defaults.headers.common["withCredentials"] = true;

axios.interceptors.request.use(
    async function (config) {
        const { user } = authStore(); // Get user info from authStore
        const token = user?.token;

        var loader = document.getElementById("loader");
        loader.classList.remove("hidden");

        if (token) {
            config.headers["Authorization"] = `Bearer ${token}`;
        }

        return config;
    },
    function (error) {
        // Do something with request error
        loader.classList.add("hidden");
        return Promise.reject(error);
    },
);

// Add a response interceptor
axios.interceptors.response.use(
    function (response) {
        // Any status code that lie within the range of 2xx cause this function to trigger
        // Do something with response data
        loader.classList.add("hidden");
        return response;
    },
    function (error) {
        // Any status codes that falls outside the range of 2xx cause this function to trigger
        // Do something with response error
        loader.classList.add("hidden");
        return Promise.reject(error);
    },
);

export default axios;
