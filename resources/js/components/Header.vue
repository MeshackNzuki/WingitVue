import { RouterLink } from 'vue-router';
<template>
    <header
        :class="[
            navColor,
            'fixed top-0 z-40 w-full flex items-center justify-between transition-all duration-700',
        ]"
    >
        <nav class="container mx-auto px-6 py-3">
            <div class="flex items-center justify-between">
                <div
                    class="text-white font-bold text-xl hover:translate-x-0.5 hover:scale-105 transition duration-200 ease-out"
                >
                    <RouterLink to="/shop" class="text-white">
                        <img
                            class="h-10 w-10 mr-2"
                            src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/logo.svg"
                            alt="Logo"
                        />
                    </RouterLink>
                    <!--  <img class="h-10 w-10 mr-2" :src="logo" alt="Logo"  />  -->
                </div>

                <div class="md:hidden">
                    <button
                        v-if="!data.sidebarState"
                        class="outline-none mobile-menu-button"
                        @click="data.toggleSidebar"
                    >
                        <svg
                            xmlns="http://www.w3.org/2000/svg"
                            fill="none"
                            viewBox="0 0 24 24"
                            stroke-width="1.5"
                            stroke="currentColor"
                            class="w-7 h-7 text-white"
                        >
                            <path
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                d="M3.75 6.75h16.5M3.75 12h16.5M12 17.25h8.25"
                            />
                        </svg>
                    </button>
                    <button
                        v-else
                        class="outline-none mobile-menu-button"
                        @click="data.toggleSidebar"
                    >
                        <svg
                            xmlns="http://www.w3.org/2000/svg"
                            fill="none"
                            viewBox="0 0 24 24"
                            stroke-width="1.5"
                            stroke="currentColor"
                            class="w-7 h-7 text-white"
                        >
                            <path
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                d="M6 18 18 6M6 6l12 12"
                            />
                        </svg>
                    </button>
                </div>
            </div>
            <Transition name="slide-fade">
                <div
                    ref="target"
                    v-if="data.sidebarState"
                    class="absolute bg-gray-950 z-40 left-0 rounded-r-3xl p-4 h-96 shadow-sm"
                >
                    <ul
                        class="flex flex-col items-left px-4 space-y-6 mt-3 font-light"
                    >
                        <li>
                            <RouterLink
                                to="/shop/cart"
                                class="text-white relative"
                                ><span
                                    class="absolute text-gray-950 -right-2 text-xs -top-2 bg-gold rounded-full w-4 h-4 flex justify-center items-center animate-ping"
                                    >{{ data.countCartItems }}</span
                                ><span
                                    class="absolute text-gray-950 -right-2 text-xs -top-2 bg-gold rounded-full w-4 h-4 flex justify-center items-center"
                                    >{{ data.countCartItems }}</span
                                >
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    fill="none"
                                    viewBox="0 0 24 24"
                                    stroke-width="1.5"
                                    stroke="currentColor"
                                    class="w-6 h-6 text-white"
                                >
                                    <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        d="M3 4.5h14.25M3 9h9.75M3 13.5h9.75m4.5-4.5v12m0 0-3.75-3.75M17.25 21 21 17.25"
                                    />
                                </svg>
                            </RouterLink>
                        </li>
                        <li>
                            <RouterLink to="/shop/all" class="text-white">
                                Shop All</RouterLink
                            >
                        </li>

                        <li>
                            <RouterLink
                                to="/shop/order-tracker"
                                class="text-white"
                                >Order Tracker</RouterLink
                            >
                        </li>

                        <li>
                            <RouterLink to="/shop/about" class="text-white"
                                >About Us</RouterLink
                            >
                        </li>
                        <li><a href="#" class="text-white">Help</a></li>

                        <li><a href="#" class="text-white">Contact</a></li>
                    </ul>
                </div>
            </Transition>
        </nav>

        <Transition name="slide-fade">
            <div
                ref="target"
                v-if="data.catOpenState"
                class="bg-gray-950 absolute hidden lg:block left-0 top-40 h-96 px-8 py-8 rounded-r-lg shadow-md"
            >
                <ul
                    class="flex flex-col space-y-4 text-white text-sm font-thin p-2"
                >
                    <li>Window shop</li>
                    <li>Women Cloths</li>
                    <li>Women Shoes</li>
                    <li>Men Shoes</li>
                    <li>Men Suits</li>
                    <li>Women Suits</li>
                    <li>Baby SHop</li>
                    <li>Accessories</li>
                </ul>
            </div>
        </Transition>
    </header>
</template>

<script setup>
import { useShoppingStore } from "../stores";
import { ref, onMounted, watchEffect } from "vue";
import { onClickOutside } from "@vueuse/core";
import Logo from "../assets/images/logo.png";
import { useRouter } from "vue-router";

const logo = Logo;
const router = useRouter();

const data = useShoppingStore();

const target = ref(null);

const { toggleSidebar, toggleCatOpen } = useShoppingStore(); // Destructure

const scrollPosition = ref(0);

const updateScroll = () => {
    scrollPosition.value = window.scrollY;
};

onMounted(() => {
    window.addEventListener("scroll", updateScroll);
});

const navColor = ref("");

watchEffect(() => {
    const currentRoute = router.currentRoute.value.path;
    if (currentRoute === "/shop") {
        navColor.value =
            scrollPosition.value > 100
                ? "bg-gray-950 text-white p-0"
                : "bg-transparent text-gray-950 pt-5 ";
    } else {
        navColor.value = "bg-gray-950 text-white p-0";
    }
});

onClickOutside(target, (event) => {
    if (data.sidebarState == true) {
        toggleSidebar();
    }
});
</script>
