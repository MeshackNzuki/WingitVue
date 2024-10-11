<template>
    <div
        class="w-full max-w-full flex bg-base justify-between h-14 top-0 fixed text-gray-50 z-10 transition duration-400"
        :class="scrolling ? 'bg-base shadow-lg' : 'bg-transparent'"
    >
        <!-- Left Side: Logo -->
        <div class="flex items-center h-12 bg-base gray-800">
            <router-link to="/">
                <img
                    :src="Logo"
                    class="w-[60px] lg:w-[80px] mt-1.5 lg:mt-1"
                    alt="Wigit"
                />
            </router-link>
        </div>

        <!-- Middle: Navigation Links -->
        <div class="flex items-center h-12 ml-5">
            <nav class="hidden lg:flex space-x-8">
                <router-link
                    v-for="link in navLinks"
                    :key="link.name"
                    :to="link.path"
                    class="group relative rounded-lg text-lg font-light"
                >
                    {{ link.name }}
                    <div
                        class="inset-0 w-0 h-0.5 bg-third transition-all duration-[300ms] ease-out group-hover:w-full"
                    ></div>
                </router-link>
            </nav>

            <button @click="toggleSidebar" class="lg:hidden">
                <svg
                    xmlns="http://www.w3.org/2000/svg"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke-width="1.5"
                    stroke="currentColor"
                    class="w-7 h-7"
                >
                    <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        d="M3.75 6.75h16.5M3.75 12h16.5M12 17.25h8.25"
                    />
                </svg>
            </button>
        </div>

        <!-- Right Side: User Avatar -->
        <div class="flex items-center h-12 bg-base gray-800 ml-5">
            <router-link to="/client-register" v-if="!is_authenticated">
                Sign Up
            </router-link>
            <div
                v-if="user?.avatar"
                class="avatar pointer"
                @click="goToProfile"
            >
                <div class="w-8 rounded-full ring ring-third">
                    <img
                        :src="`https://api.wingit.co.ke/core/storage/app/public/uploads/avatars/${user.avatar}`"
                        alt="User Avatar"
                    />
                </div>
            </div>
            <div
                v-else
                class="relative w-10 h-10 overflow-hidden bg-gray-100 rounded-full gray-600"
            >
                <div class="avatar online placeholder">
                    <div
                        class="bg-neutral-focus text-neutral-content rounded-full w-10"
                    >
                        <span class="text-xl font-bold uppercase">{{
                            userInitial
                        }}</span>
                    </div>
                </div>
            </div>

            <button @click="logout" class="ml-5 md:ml-6">Logout</button>
        </div>

        <!-- Sidebar Navigation -->
        <transition name="fade">
            <div
                v-if="sidebarOpen"
                class="absolute bg-white bg-opacity-80 h-screen w-full p-4 shadow-lg flex flex-col justify-start text-md z-20"
            >
                <div class="border-third ml-5 flex flex-col justify-start pl-1">
                    <router-link
                        v-for="link in navLinks"
                        :key="link.name"
                        :to="link.path"
                        class="group relative rounded-lg text-gray-700 mt-4"
                    >
                        {{ link.name }}
                        <div
                            class="inset-0 w-0 h-0.5 bg-third transition-all duration-[300ms] ease-out group-hover:w-full"
                        ></div>
                    </router-link>
                </div>
            </div>
        </transition>
    </div>
</template>

<script setup>
import { computed, ref, onMounted } from "vue";
import { useRouter } from "vue-router";
import Logo from "../../assets/logo.png";
import { authStore } from "../../stores/authStore"; // Adjust import according to your project structure

const router = useRouter();
const user = authStore();
const sidebarOpen = ref(false);
const scrolling = ref(true);

const userInitial = computed(() => {
    return user.value?.name?.charAt(0).toUpperCase() || "";
});

// Navigation links
const navLinks = [
    { name: "Home", path: "/" },
    { name: "Flights", path: "/listed-flights" },
    { name: "Operator", path: "/operator" },
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

// Navigate to user profile on avatar click
const goToProfile = () => {
    router.push("/profile");
};

// Handle sidebar toggle
const toggleSidebar = () => {
    sidebarOpen.value = !sidebarOpen.value;
};

// Handle scroll event
const handleScroll = () => {
    scrolling.value = window.scrollY >= window.innerHeight * 0.5;
};

// Event listeners for scroll
onMounted(() => {
    window.addEventListener("scroll", handleScroll);
    return () => {
        window.removeEventListener("scroll", handleScroll);
    };
});
</script>

<style scoped>
/* Add any scoped styles here if necessary */
</style>
