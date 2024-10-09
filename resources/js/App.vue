<script setup lang="ts">
import { RouterLink, RouterView, useRoute } from "vue-router";
import Vue3Toastify, { toast } from "vue3-toastify";
import Toast from "primevue/toast";
import "../../node_modules/vue3-marquee-slider/dist/style.css";
import "vue3-toastify/dist/index.css";
import Sidebar from "./components/Sidebar/CSidebar.vue";
import MainTopBar from "./components/TopBar/GuestTopBar.vue";
import GuestTopBar from "./components/TopBar/GuestTopBar.vue";
import MobileNav from "./components/MobileNav.vue";
import { ref, onMounted, watch } from "vue";

const route = useRoute();
const protected_area = ref(false);

// Set login to true if the current route is /login
if (route.path === "/login") {
    protected_area.value = true;
}

// Watch for route changes and update login accordingly
watch(
    () => route.path,
    (newPath) => {
        protected_area.value = newPath === "/login";
    },
);
</script>
<template>
    <div
        id="loader"
        class="fixed hidden inset-0 flex justify-center items-center bg-sky-900 bg-opacity-10 z-50"
    >
        <div class="axiosspinner"></div>
    </div>

    <div class="min-h-screen bg-slate-50 dark:bg-slate-300 overflow-x-hidden">
        <!-- <div :class="protected_area ? '' : 'ms-64 p-4'">
            <Toast />
            <Sidebar />
            <GuestTopBar />
            <MainTopBar />
            <router-view v-slot="{ Component }">
                <transition name="page">
                    <component :is="Component" />
                </transition>
            </router-view>
            <MobileNav />
        </div> -->
        <div>
            <Toast />
            <!-- <Sidebar /> -->
            <GuestTopBar />
            <router-view v-slot="{ Component }">
                <transition name="page">
                    <component :is="Component" />
                </transition>
            </router-view>
            <MobileNav />
        </div>
    </div>
</template>
<style>
.axiosspinner {
    width: 50px;
    aspect-ratio: 1;
    display: grid;
    border: 4px solid #0000;
    border-radius: 50%;
    border-color: #0c4a6e #0000;
    animation: l16 1s infinite linear;
}
.axiosspinner::before,
.axiosspinner::after {
    content: "";
    grid-area: 1/1;
    margin: 2px;
    border: inherit;
    border-radius: 50%;
}
.axiosspinner::before {
    border-color: #f03355 #0000;
    animation: inherit;
    animation-duration: 0.5s;
    animation-direction: reverse;
}
.axiosspinner::after {
    margin: 8px;
}
@keyframes l16 {
    100% {
        transform: rotate(1turn);
    }
}
</style>
