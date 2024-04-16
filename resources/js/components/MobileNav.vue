<template>
    <div
        class="fixed flex justify-around rounded-full bottom-0 left-0 w-full sm:hidden bg-transparent"
    >
        <Transition name="slide-fade">
            <div
                ref="target"
                v-if="data.catOpenState"
                class="bg-gray-950 absolute left-0 bottom-12 w-1/3 ms-2 rounded-lg shadow-md"
            >
                <ul
                    class="flex flex-col space-y-4 text-white text-xs font-thin p-2"
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
        <nav
            class="flex justify-between px-8 mx-2 mb-1 h-10 rounded-full shadow-md bg-gray-950 w-full items-center"
        >
            <span
                v-if="!data.catOpenState"
                @click="toggleCatOpen()"
                class="hover:translate-x-0.5 hover:scale-105 transition duration-200 ease-out"
            >
                <a href="#" class="text-white flex flex-row"
                    ><svg
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
                            d="M3.75 6.75h16.5M3.75 12H12m-8.25 5.25h16.5"
                        />
                    </svg>
                </a>
            </span>
            <span v-else @click="toggleCatOpen()">
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
            </span>

            <RouterLink to="/shop/cart" class="text-white relative"
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
                    class="w-7 h-7"
                >
                    <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 0 0-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 0 0-16.536-1.84M7.5 14.25 5.106 5.272M6 20.25a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Zm12.75 0a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Z"
                    />
                </svg>
            </RouterLink>

            <div
                class="absolute inset-x-0 bg-gray-950 -top-5 mx-auto w-12 h-12 rounded-full border-2 border-white shadow-lg"
            >
                <RouterLink to="/shop">
                    <img
                        class="mx-auto w-full rounded-full"
                        :src="logo"
                        alt="logo"
                    />
                </RouterLink>
            </div>
        </nav>
    </div>
</template>
<script setup>
import Logo from "../assets/images/logo.png";
import { ref } from "vue";
import { onClickOutside } from "@vueuse/core";

import { useShoppingStore } from "../stores";

const target = ref(null);
const { toggleCatOpen } = useShoppingStore(); // Destructure
const data = useShoppingStore();

const logo = Logo;

onClickOutside(target, (event) => {
    toggleCatOpen();
});
</script>
