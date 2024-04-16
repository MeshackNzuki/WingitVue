<template>
    <article
        class="relative hover:shadow-xl transform transition-transform duration-700 hover:bg-slate-50 hover:scale-105 p-1 rounded-lg ">
        <div class="aspect-square overflow-hidden">
            <img class="mx-auto h-auto w-full rounded-lg" :src="image" :alt="altText" />
        </div>
        <div class="absolute bottom-20 me-1 rounded-full w-full flex justify-between">
            <p
                class="rounded-full  bg-gray-950 p-1 text-[10px] font-bold uppercase tracking-wide text-white sm:py-1 px-3 hover:translate-x-0.5 hover:scale-110 transition duration-200 ease-out">
                <button @click="data.addToCart(item)" class="btn btn-primary">
                    {{ orderText }}
                </button>
            </p>
            <span class="flex justify-around me-2">
                <a :href="`https://wa.me/${phoneNumber}?text=Hi veeclads,i need help purchasing the item in link: https://veeclads.com/shop/find/${item.id}`"
                
                    class="relative flex whitespace-nowrap rounded-lg px-2  font-bold text-white transition hover:scale-110">
                    <img class="h-5 w-5" :src="WhatsAapp" alt="Whatapp" />
                </a>
                <a :href="`tel:${phoneNumber}`"
                    class="text-gray-950 transform transition-transform duration-700  hover:scale-110"><svg
                        xmlns="http://www.w3.org/2000/svg" fill="black" viewBox="0 0 24 24" stroke-width="1"
                        stroke="currentColor" class="w-5 h-5">
                        <path stroke-linecap="round" stroke-linejoin="round"
                            d="M20.25 3.75v4.5m0-4.5h-4.5m4.5 0-6 6m3 12c-8.284 0-15-6.716-15-15V4.5A2.25 2.25 0 0 1 4.5 2.25h1.372c.516 0 .966.351 1.091.852l1.106 4.423c.11.44-.054.902-.417 1.173l-1.293.97a1.062 1.062 0 0 0-.38 1.21 12.035 12.035 0 0 0 7.143 7.143c.441.162.928-.004 1.21-.38l.97-1.293a1.125 1.125 0 0 1 1.173-.417l4.423 1.106c.5.125.852.575.852 1.091V19.5a2.25 2.25 0 0 1-2.25 2.25h-2.25Z" />
                    </svg>

                </a>
                <span
                    class="relative transform transition-transform duration-700 f hover:scale-110 flex justify-center items-center px-1 cursor-pointer">
                    <small class="absolute text-white rounded-full w-3 h-3 flex justify-center items-center mb-1"
                        style="font-size: 10px;">{{ Math.floor(Math.random() * 14) }}</small>
                    <svg xmlns="http://www.w3.org/2000/svg" fill="red" viewBox="0 0 24 24" stroke-width="1.5"
                        stroke="currentColor" class="w-6 h-6 text-rose-500">
                        <path stroke-linecap="round" stroke-linejoin="round"
                            d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12Z" />
                    </svg>
                </span>
            </span>
        </div>
        <div class="flex items-start justify-between">
            <div>
                <h3 class="text-xs font-semibold sm:text-sm md:text-base">
                    <a href="#" title="" class="">
                        {{ name }}
                        <span class="absolute" aria-hidden="true"></span>
                    </a>
                </h3>
                <div class="mt-2 flex items-center">
                    <svg v-for="rating in ratings" :key="rating"
                        class="block h-3 w-3 align-middle text-pink-600 sm:h-4 sm:w-4"
                        xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                        <!-- Star SVG -->
                    </svg>
                </div>
            </div>
            <div class="text-right">
                <p
                    class="text-xs font-normal sm:text-sm md:text-base bg-gradient-to-r from-emerald-50 to-purple-50 px-1.5 rounded-full shadow-sm">
                    Ksh. {{ price }}
                </p>
            </div>
        </div>
        <div>
            <button class="text-sm font-light test-sm -mt-3" @click="() => openModal()">
                {{ viewItemText }}
            </button>
        </div>
    </article>
    <ModalComponent :isOpen="isModalOpened" @modal-close="closeModal" @submit="submitHandler" name="first-modal">
        <div class="w-full flex justify-content-end">
            <button
                class="mb-1 pointer ml-1 transform hover:translate-x-1 transition-transform duration-700 hover:scale-105 mt-2"
                @click="closeModal">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="0.8"
                    stroke="currentColor" class="w-6 h-6">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
                </svg>
            </button>
        </div>
        <div class="flex flex-col lg:flex-row">
            <article class="hover:shadow-sm transform transition-transform duration-700 hover:scale p-2">
                <div class="overflow-hidden w-full flex content-center items-">
                    <img class="mx-auto h-auto rounded-lg min-h-[250px]" :src="image" :alt="altText" />
                </div>

            </article>

            <div class="flex flex-col items-start justify-between min-w-96 p-2">
                <div class="w-full flex flex-row  justify-between">
                    <h3 class="text-xs font-semibold sm:text-sm md:text-base">
                        <a href="#" title="" class="">
                            {{ name }}
                            <span class="absolute" aria-hidden="true"></span>
                        </a>
                    </h3>
                    <div class="mt-2 flex items-center">
                        <svg v-for="rating in randomizedRatings" :key="rating"
                            class="block h-3 w-3 align-middle text-pink-600 sm:h-4 sm:w-4"
                            xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                            <!-- Star SVG -->
                            <path
                                d="M10 2l2.28 5.702L17 9l-4.25 3.298L13 18l-5-3.5L3 18l1.25-5.702L3 9l4.72-1.298L10 2z" />
                        </svg>

                    </div>
                </div>
                <div>
                    <p class="font-semibold sm:text-sm md:text-base">
                        Description
                    </p>
                    <small>
                        Lorem ipsum dolor sit amet consectetur adipisicing elit.
                        Rerum exercitationem est nam. Officiis provident numquam
                        hic alias, vel voluptate quis nihil reprehenderit ipsam
                        fugit. Illum harum facilis sit quas perspiciatis.
                    </small>
                </div>
                <div class="w-full flex justify-center">
                    <p class="text-2xl font-light sm:text-md bg-rose-100 px-2 py-1 rounded-full pointer">
                        KES. {{ price }} /=
                    </p>
                </div>
                <div class="w-full flex flex-row mt-4 justify-between px-8 mb-4">
                    <RouterLink to="/shop/cart">
                        <p class="font-semibold sm:text-sm md:text-base cursor-pointer">
                        <p
                            class="rounded-full shadow-lg max-w-36 bg-gray-950 p-1 text-[10px] font-bold uppercase tracking-wide text-white sm:py-1 px-3 hover:translate-x-0.5 hover:scale-110 transition duration-200 ease-out">
                        <p @click="data.addToCart(item)"
                            class="btn btn-primary text-lg lowercase font-light flex justify-center">
                            <span>Check out now</span>
                        </p>
                        </p>
                        </p>
                    </RouterLink>

                    <span>Or</span>


                    <p class="font-semibold sm:text-sm md:text-base cursor-pointer">
                    <p
                        class="rounded-full shadow-lg max-w-36 bg-gray-950 p-1 text-[10px] font-bold uppercase tracking-wide text-white sm:py-1 px-3 hover:translate-x-0.5 hover:scale-110 transition duration-200 ease-out">
                    <p @click="data.addToCart(item)"
                        class="btn btn-primary text-lg lowercase font-light flex justify-center">
                        <span>Add to Cart</span>
                    </p>
                    </p>
                    </p>
                </div>
            </div>
        </div>
    </ModalComponent>
</template>

<script setup>
import { defineProps, ref, onMounted } from "vue";
import { useShoppingStore } from "../stores";
import ModalComponent from "./Modal.vue";
import WhatsAapp from "../assets/images/whatsapp.svg";


const isModalOpened = ref(false);

const data = useShoppingStore();

const whatsAapp = WhatsAapp;

const phoneNumber = data.phoneNumber;
const message = "Hello Veeclads,";
let whatsappLink = `https://wa.me/${phoneNumber}?text=${encodeURIComponent(message)}`;

const props = defineProps({
    image: String,
    altText: String,
    orderText: String,
    name: String,
    ratings: Array,
    price: String,
    viewItemText: String,
    item: String,
});

const randomizedRatings = ref([]);

const generateRandomizedRatings = () => {
    const ratings = [];
    for (let i = 0; i < 5; i++) {
        // Generate a random rating between 3 and 5
        const rating = Math.floor(Math.random() * 3) + 3;
        ratings.push(rating);
    }
    randomizedRatings.value = ratings;
};

onMounted(() => {
    generateRandomizedRatings();
});

const openModal = () => {
    isModalOpened.value = true;
};
const closeModal = () => {
    isModalOpened.value = false;
};
</script>