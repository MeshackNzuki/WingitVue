<script setup lang="ts">
import { RouterLink, RouterView, useRoute } from "vue-router";
import Vue3Toastify, { toast } from "vue3-toastify";
import "../../node_modules/vue3-marquee-slider/dist/style.css";
import "vue3-toastify/dist/index.css";
import Sidebar from "./components/Sidebar/Sidebar.vue";
import TopBar from "./components/TopBar/TopBar.vue";
import MobileNav from "./components/MobileNav.vue";
import { ref, onMounted, watch } from "vue";

const route = useRoute();
const login = ref(false);

// Set login to true if the current route is /login
if (route.path === "/login") {
    login.value = true;
}

// Watch for route changes and update login accordingly
watch(
    () => route.path,
    (newPath) => {
        login.value = newPath === "/login";
    },
);
</script>
<template>
    <div>
        <div
            id="loader"
            class="hidden bg-black bg-opacity-25 absolute z-50 top-0 bottom-0 right-0 left-0"
        ></div>
    </div>

    <div class="min-h-screen bg-slate-50 dark:bg-slate-300 overflow-x-hidden">
        <div :class="login ? '' : 'ms-64 p-4'">
            <Sidebar />
            <TopBar />
            <router-view v-slot="{ Component }">
                <transition name="page">
                    <component :is="Component" />
                </transition>
            </router-view>
            <MobileNav />
        </div>
    </div>
</template>
