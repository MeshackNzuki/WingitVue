<script setup lang="ts">
import { computed, inject, onMounted, ref, watch } from "vue";
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

const motionPresets = inject("motionPresets");

const route = useRoute();
const mainStore = useMainStore();
const is_authenticated = computed(() => authStore().is_authenticated);
const isProtectedRoute = computed(() => !!route.meta.role && is_authenticated.value);

onMounted(() => {
    mainStore.startStoreServices();
});

watch([isProtectedRoute, () => mainStore.sidebarOpen], ([protectedRoute, sidebarOpen]) => {
    console.log("Sidebar Open:", sidebarOpen, "Protected Route:", protectedRoute);
});

watch(route, (newRoute) => {
    console.log("Route Meta:", newRoute.meta);
});
</script>

<template>
    <div id="loader"
        class="fixed hidden inset-0 flex justify-center items-center bg-sky-900 bg-opacity-10 z-50 select-none">
        <div class="axiosspinner"></div>
    </div>
    <Sidebar v-if="isProtectedRoute" />
    <div class="min-h-screen bg-slate-50 dark:bg-slate-300 overflow-x-hidden transition-all duration-300 text-gray-600 select-none"
        :class="mainStore.sidebarOpen && isProtectedRoute ? 'ms-64 p-4' : ''">
        <Toast />
        <GuestTopBar v-if="!isProtectedRoute" />
        <MainTopBar v-if="isProtectedRoute" />
        <router-view v-slot="{ Component }">
            <div class="min-h-screen ">
                <transition name="page">
                    <component :is="Component" />
                </transition>
            </div>
        </router-view>
        <Footer v-if="!isProtectedRoute" />
        <WhatsApp v-if="route.path == '/'" />
    </div>
</template>
<style>
.axiosspinner {
    transform: rotateZ(45deg);
    perspective: 1000px;
    border-radius: 50%;
    width: 48px;
    height: 48px;
    color: #0e5b5c;
}

.axiosspinner:before,
.axiosspinner:after {
    content: '';
    display: block;
    position: absolute;
    top: 0;
    left: 0;
    width: inherit;
    height: inherit;
    border-radius: 50%;
    transform: rotateX(70deg);
    animation: 1s spin linear infinite;
}

.axiosspinner:after {
    color: #FF3D00;
    transform: rotateY(70deg);
    animation-delay: .4s;
}

@keyframes rotate {
    0% {
        transform: translate(-50%, -50%) rotateZ(0deg);
    }

    100% {
        transform: translate(-50%, -50%) rotateZ(360deg);
    }
}

@keyframes rotateccw {
    0% {
        transform: translate(-50%, -50%) rotate(0deg);
    }

    100% {
        transform: translate(-50%, -50%) rotate(-360deg);
    }
}

@keyframes spin {

    0%,
    100% {
        box-shadow: .2em 0px 0 0px currentcolor;
    }

    12% {
        box-shadow: .2em .2em 0 0 currentcolor;
    }

    25% {
        box-shadow: 0 .2em 0 0px currentcolor;
    }

    37% {
        box-shadow: -.2em .2em 0 0 currentcolor;
    }

    50% {
        box-shadow: -.2em 0 0 0 currentcolor;
    }

    62% {
        box-shadow: -.2em -.2em 0 0 currentcolor;
    }

    75% {
        box-shadow: 0px -.2em 0 0 currentcolor;
    }

    87% {
        box-shadow: .2em -.2em 0 0 currentcolor;
    }
}
</style>
