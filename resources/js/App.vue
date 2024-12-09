<script setup lang="ts">
import { computed, onMounted, ref } from "vue";
import { RouterView, useRoute } from "vue-router";
import Toast from "primevue/toast";
import "../../node_modules/vue3-marquee-slider/dist/style.css";
import "vue3-toastify/dist/index.css";
import Sidebar from "./components/Sidebar/CSidebar.vue";
import MainTopBar from "./components/TopBar/MainTopBar.vue";
import GuestTopBar from "./components/TopBar/GuestTopBar.vue";
import Footer from "./components/Footer.vue";
import { authStore } from "./stores/authStore";
import { useMainStore } from "./stores";
import WhatsApp from "./components/WhatsApp.vue";

const route = useRoute();

const mainStore = useMainStore();

const { is_authenticated } = authStore();
// Compute if the current route is protected
const isProtectedRoute = computed(() => route.meta.role && is_authenticated);

onMounted(() => {
    mainStore.startStoreServices();
});
</script>
<template>
    <div
        id="loader"
        class="fixed hidden inset-0 flex justify-center items-center bg-sky-900 bg-opacity-10 z-50"
    >
        <div class="axiosspinner"></div>
    </div>

    <div
        class="min-h-screen bg-slate-50 dark:bg-slate-300 overflow-x-hidden font-"
        :class="mainStore.sidebarOpen && isProtectedRoute ? 'ms-64 p-4' : ''"
    >
        <div>
            <Toast />
            <Sidebar v-if="isProtectedRoute" />
            <GuestTopBar v-if="!isProtectedRoute" />
            <MainTopBar v-if="isProtectedRoute" />
            <router-view v-slot="{ Component }">
                <div class="min-h-screen">
                    <transition name="page">
                        <component :is="Component" />
                    </transition>
                </div>
            </router-view>
            <Footer v-if="!isProtectedRoute" />
            <WhatsApp v-if="route.path == '/'" />
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
    border-color: #0e5b5c #0000;
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
