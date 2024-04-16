<template>
    <article
        class="relative w-full hover:shadow-xl transform transition-transform duration-300 hover:scale-105"
    >
        <div class="overflow-hidden">
            <img
                class="mx-auto h-auto w-full rounded-lg"
                :src="image"
                :alt="altText"
            />
        </div>
        <div class="absolute bottom-20 me-1 rounded-full bg-white">
            <p
                class="rounded-full shadow-lg bg-gradient-to-r from-emerald-500 to-emerald-600 p-1 ml-2 text-[10px] font-bold uppercase tracking-wide text-white sm:py-1 px-3 hover:translate-x-0.5 hover:scale-110 transition duration-200 ease-out"
            >
                <button @click="data.addToCart(item)" class="btn btn-primary">
                    {{ orderText }}
                </button>
            </p>
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
                    <!-- <svg
                        v-for="rating in ratings"
                        :key="rating"
                        class="block h-3 w-3 align-middle text-pink-600 sm:h-4 sm:w-4"
                        xmlns="http://www.w3.org/2000/svg"
                        viewBox="0 0 20 20"
                        fill="currentColor"
                    
                    </svg> -->
                </div>
            </div>
            <div class="text-right">
                <p class="text-xs font-normal sm:text-sm md:text-base">
                    Ksh. {{ price }}
                </p>
            </div>
        </div>
        <!-- <div>
            <p class="text-sm font-thin -mt-3">
                {{ viewItemText }}
            </p>
        </div> -->
    </article>
</template>

<script setup>
import { defineProps } from "vue";
import { useShoppingStore } from "../stores";

const data = useShoppingStore();

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
</script>
