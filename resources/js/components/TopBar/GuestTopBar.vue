<template>
    <div class="flex w-full fixed justify-center bg-base h-14 transition-all z-40"
        :class="scrolling ? 'bg-base shadow-lg' : 'bg-transparent'">
        <div
            class="max-w-screen-xl p-2 w-full flex justify-between bg-transparent h-14 top-0 fixed bg-base text-gray-50 z-10 transition duration-400">
            <!-- Left Side: Logo -->
            <div class="flex items-center h-12">
                <router-link to="/">
                    <img :src="Logo" class="w-[60px] lg:w-[80px] mt-1.5 lg:mt-1" alt="Wigit" />
                </router-link>
            </div>

            <!-- Middle: Navigation Links -->
            <div class="flex items-center h-12 ml-5">
                <nav class="hidden lg:flex space-x-8">
                    <router-link v-for="link in navLinks" :key="link.name" :to="link.path"
                        class="group relative rounded-lg text-lg font-light" exact-active-class="underline-active">
                        {{ link.name }}
                        <div
                            class="inset-0 w-0 h-0.5 bg-third transition-all duration-[300ms] ease-out group-hover:w-full">
                        </div>
                    </router-link>
                </nav>
            </div>
            <!-- Right Side: User Avatar -->
            <div class="flex items-center h-12 ml-5 text-gray-600 
            ">
                <router-link to="/client-register" class="text-white font-semibold rounded-full px-3"
                    v-if="!is_authenticated">
                    Sign Up
                </router-link>
                <router-link to="/login" class="bg-gold  shadow-sm rounded-full py-1 px-4" v-if="!is_authenticated">
                    Login
                </router-link>
                <div v-if="is_authenticated" @click="goToUserArea()" class="flex flex-row gap-1">
                    <div class="bg-gold  shadow-sm rounded-full px-2 pt-1 text-center my-1 cursor-pointer">
                        Dashboard
                    </div>

                    <div v-if="user?.avatar" class="avatar pointer">
                        <div class="size-8 rounded-full ring ring-gold ms-1">
                            <img :src="`https://api.wingit.co.ke/core/storage/app/public/uploads/avatars/${user.avatar}`"
                                alt="User Avatar" />
                        </div>
                    </div>
                    <div v-else class="relative overflow-hidden bg-gold rounded-full gray-600">
                        <div class="size-10 rounded-full ring ring-third">
                            <img :src="`${Logo2}`" alt="User Avatar" />
                        </div>
                    </div>
                </div>

                <button v-if="!sidebarOpen" @click="toggleSidebar" class="lg:hidden ml-2">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                        stroke="currentColor" class="w-7 h-7">
                        <path stroke-linecap="round" stroke-linejoin="round"
                            d="M3.75 6.75h16.5M3.75 12h16.5M12 17.25h8.25" />
                    </svg>
                </button>
                <button v-else @click="toggleSidebar" class="lg:hidden ml-2">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                        stroke="currentColor" class="w-7 h-7">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
                    </svg>
                </button>
            </div>

            <!-- Sidebar Navigation -->
            <transition name="fade">
                <div @click="() => toggleSidebar()" ref="sidebar_id" v-if="sidebarOpen"
                    class="absolute bg-white bg-opacity-90 h-screen w-70 rounded-md p-4 mt-14 shadow-lg flex flex-col justify-start text-md z-20">
                    <div class="border-third ml-5 flex flex-col justify-start pl-1">
                        <router-link v-for="link in navLinks" :key="link.name" :to="link.path"
                            class="group relative rounded-lg  mt-4" exact-active-class="underline-active">
                            {{ link.name }}
                            <div
                                class="inset-0 w-0 h-0.5 bg-third transition-all duration-[300ms] ease-out group-hover:w-full">
                            </div>
                        </router-link>
                    </div>
                </div>
            </transition>
        </div>
    </div>
</template>

<script setup>
import { computed, ref, onMounted, watch } from "vue";
import { useRoute, useRouter } from "vue-router";
import Logo from "../../assets/logo.svg";
import Logo2 from "../../assets/logo.png";
import { authStore } from "../../stores/authStore"; // Adjust import according to your project structure
import { onClickOutside } from "@vueuse/core";

const route = useRoute();
const router = useRouter();
const { user, is_authenticated, goToUserArea } = authStore();
const sidebarOpen = ref(false);
const scrolling = ref(false);
const fullnavpage = ref(false);

const userInitial = computed(() => {
    return (
        user.name?.charAt(0).toUpperCase() ||
        user.company_name?.charAt(0).toUpperCase()
    );
});

// Navigation links
const navLinks = [
    { name: "Home", path: "/" },
    { name: "Flights", path: "/listed-flights" },
    { name: "Operator Account", path: "/operator" },
    { name: "About", path: "/about" },
    { name: "How It Works", path: "/principle" },
    { name: "Help?", path: "/help" },
    { name: "FAQs", path: "/faq" },
];

// Logout function
const logout = async () => {
    try {
        await authStore.logout();
        router.push("/");
    } catch (error) {
        console.error("Logout failed:", error);
    }
};

// Handle sidebar toggle
const toggleSidebar = () => {
    sidebarOpen.value = !sidebarOpen.value;
};

// Handle scroll event
const handleScroll = () => {
    if (window.scrollY >= window.innerHeight * 0.3 || fullnavpage.value) {
        scrolling.value = true;
    } else {
        scrolling.value = false;
    }
};

const checkRoute = async () => {
    if (route.path === "/operator") {
        console.log("route.path", route.path);
        console.log("full page topbar");
        fullnavpage.value = true;
        scrolling.value = true;
    } else {
        fullnavpage.value = false;
        scrolling.value = false;
    }
    { }
};

watch(
    () => route.path,
    async () => {
        checkRoute();
    },
);

// Event listeners for scroll
onMounted(async () => {
    window.addEventListener("scroll", handleScroll);
});
</script>

<style scoped>
.underline-active {
    position: relative;
}

.underline-active::after {
    content: '';
    position: absolute;
    left: 0;
    bottom: -2px;
    width: 0;
    height: 2px;
    background-color: #FBD0A0;
    transition: width 0.3s ease-in-out;
    animation: underline-grow 1s forwards;
}

@keyframes underline-grow {
    0% {
        width: 0;
    }

    100% {
        width: 100%;
    }
}
</style>
