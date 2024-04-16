<template>
    <div class="bg-gradient-to-b from-purple-100 via-cyan-50">
        <div class="w-full flex justify-center">
            <div class="mx-2 max-w-screen-lg mt-16">
                <vue-marquee-slider
                    id="marquee-slider"
                    :speed="50000"
                    :width="500"
                >
                    <p class="font-light text-lg -white">
                        Free delivery for orders above ksh 1000 all around
                        Kenya.
                    </p>
                    <p class="font-light text-lg -white">
                        Striving for quality customer service...
                    </p>
                    <p class="font-light text-lg -white">
                        Great offers on weekends!
                    </p>
                </vue-marquee-slider>
                <div
                    class="mt-15 flex flex-col items-center justify-center py-8 lg:px-0"
                >
                    <div class="pt-2 relative mx-auto text-gold">
                        <input
                            class="border-b-1 border-gray-300 bg-gray-950 h-8 px-5 pr-16 rounded-full text-sm focus:outline-none"
                            type="search"
                            v-model="searchTerm"
                            @input="search"
                            name="search"
                            placeholder="Search items ..."
                        />
                        <button
                            type="submit"
                            class="absolute right-0 top-0 mt-5 mr-4"
                        >
                            <svg
                                class="text-bold h-4 w-4 fill-current"
                                xmlns="http://www.w3.org/2000/svg"
                                xmlns:xlink="http://www.w3.org/1999/xlink"
                                version="1.1"
                                id="Capa_1"
                                x="0px"
                                y="0px"
                                viewBox="0 0 56.966 56.966"
                                style="enable-background: new 0 0 56.966 56.966"
                                xml:space="preserve"
                                width="512px"
                                height="512px"
                            >
                                <path
                                    d="M55.146,51.887L41.588,37.786c3.486-4.144,5.396-9.358,5.396-14.786c0-12.682-10.318-23-23-23s-23,10.318-23,23  s10.318,23,23,23c4.761,0,9.298-1.436,13.177-4.162l13.661,14.208c0.571,0.593,1.339,0.92,2.162,0.92  c0.779,0,1.518-0.297,2.079-0.837C56.255,54.982,56.293,53.08,55.146,51.887z M23.984,6c9.374,0,17,7.626,17,17s-7.626,17-17,17  s-17-7.626-17-17S14.61,6,23.984,6z"
                                />
                            </svg>
                        </button>
                    </div>
                    <div
                        class="bg-slate-50 rounded-lg p-4 mt-2"
                        v-if="searchTerm?.length > 1"
                    >
                        <small class="text-xs">
                            Found {{ filteredArray?.length }} Results for "{{
                                searchTerm
                            }}"
                        </small>
                        <main
                            v-if="productData"
                            class="grid grid-cols-2 gap-x-6 gap-y-10 px-2 pb-20 sm:grid-cols-3 sm:px-8 lg:mt-8 lg:grid-cols-4 lg:gap-x-4 lg:px-0"
                        >
                            <ProductCard1
                                v-for="product in filteredArray"
                                :key="product"
                                :item="product"
                                :image="product.image"
                                :altText="product.altText"
                                orderText="Order"
                                :name="product.name"
                                :ratings="product.ratings"
                                :price="product.price"
                                viewItemText="View item..."
                            />
                        </main>
                    </div>
                </div>
                <div
                    class="bg-gradient-to-l from-blue-50 to bg-purple-50 p-4 rounded-lg"
                >
                    <main
                        v-if="productData"
                        class="grid grid-cols-2 gap-x-6 gap-y-10 px-2 pb-20 sm:grid-cols-3 sm:px-8 lg:mt-8 lg:grid-cols-4 lg:gap-x-4 lg:px-0"
                    >
                        <ProductCard1
                            v-for="product in paginatedProducts"
                            :key="product"
                            :item="product"
                            :image="product.image"
                            :altText="product.altText"
                            orderText="Order"
                            :name="product.name"
                            :ratings="product.ratings"
                            :price="product.price"
                            viewItemText="View item..."
                        />
                    </main>
                    <div class="flex justify-center w-full">
                        <p>
                            <button
                                v-if="currentPage > 1"
                                @click="previousPage"
                                class="text-gray-900 underline flex flex-row"
                            >
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    fill="none"
                                    viewBox="0 0 24 24"
                                    stroke-width="1.5"
                                    stroke="currentColor"
                                    class="w-4 h-4 mt-1"
                                >
                                    <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        d="M15.75 19.5 8.25 12l7.5-7.5"
                                    />
                                </svg>
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    fill="none"
                                    viewBox="0 0 24 24"
                                    stroke-width="1.5"
                                    stroke="currentColor"
                                    class="w-4 h-4 mt-1"
                                >
                                    <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        d="M15.75 19.5 8.25 12l7.5-7.5"
                                    />
                                </svg>

                                BACK
                            </button>
                        </p>
                        <span
                            class="bg-gray-950 rounded-full p-2 w-7 h-7 shadow-md mx-2 text-gold flex justify-center items-center"
                        >
                            {{ currentPage }}</span
                        >
                        <p>
                            <button
                                @click="nextPage"
                                class="text-gray-900 underline flex flex-row"
                            >
                                NEXT
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    fill="none"
                                    viewBox="0 0 24 24"
                                    stroke-width="1.5"
                                    stroke="currentColor"
                                    class="w-4 h-4 mt-1"
                                >
                                    <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        d="m8.25 4.5 7.5 7.5-7.5 7.5"
                                    />
                                </svg>
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    fill="none"
                                    viewBox="0 0 24 24"
                                    stroke-width="1.5"
                                    stroke="currentColor"
                                    class="w-4 h-4 mt-1"
                                >
                                    <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        d="m8.25 4.5 7.5 7.5-7.5 7.5"
                                    />
                                </svg>
                            </button>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script setup>
import { ref, onMounted, computed } from "vue";
import "vue3-carousel/dist/carousel.css";
import { Carousel, Slide, Pagination, Navigation } from "vue3-carousel";
import WhatsAapp from "../assets/images/whatsapp.svg";
import ProductCard1 from "../components/ProductCard1.vue";
import { VueMarqueeSlider } from "vue3-marquee-slider";

import Logo from "../assets/images/logo.png";
import Hero from "../assets/images/veehero.jpg";
import SlideCard from "../components/SlideCard.vue";

import { useShoppingStore } from "../stores";

//get products from store meaniwhile
const productData = useShoppingStore();

const products = productData.products;

const itemsPerPage = 10;
const currentPage = ref(1);
const filteredArray = ref(null);

const searchTerm = ref(null);

const totalPages = computed(() => Math.ceil(products.length / itemsPerPage));

const paginatedProducts = computed(() => {
    const startIndex = (currentPage.value - 1) * itemsPerPage;
    const endIndex = startIndex + itemsPerPage;
    return products.slice(startIndex, endIndex);
});

const search = () => {
    if (searchTerm.value.length < 1) {
        return (filteredArray.value = "");
    }
    const pdt = [...productData.products];
    const filteredArrayX = productData.products.filter((item) => {
        const regex = new RegExp(searchTerm.value, "i"); // 'i' flag for case-insensitive search
        return regex.test(item.name);
    });
    return (filteredArray.value = filteredArrayX);
};

const nextPage = () => {
    if (currentPage.value < totalPages.value) {
        currentPage.value++;
    }
};

const previousPage = () => {
    if (currentPage.value > 1) {
        currentPage.value--;
    }
};
</script>
