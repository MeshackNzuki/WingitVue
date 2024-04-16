import "./assets/main.css";

import { createApp } from "vue";
import { createPinia } from "pinia";
import Vue3Toastify, { toast } from "vue3-toastify";
import piniaPluginPersistedstate from "pinia-plugin-persistedstate";
import "vue-final-modal/style.css";
import "./AxiosConfig.js";

import App from "./App.vue";
import router from "./router";

const app = createApp(App);

app.use(Vue3Toastify, {
    autoClose: 2000,
    multiple: true,
});
app.use(createPinia().use(piniaPluginPersistedstate));
app.use(router);
app.mount("#app");
