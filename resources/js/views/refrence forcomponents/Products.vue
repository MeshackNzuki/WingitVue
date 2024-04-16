<template>
    <div class="bg-gradient-to-b from-purple-100 via-cyan-50">
        <div class="relative bg-cover bg-center bg-no-repeat h-96 herotransit">
            <div
                class="absolute top-0 left-0 w-full h-full bg-gray-900 bg-opacity-25 mix-blend-mode-multiply flex justify-center p-8 items-center"
            >
                <div class="">
                    <h5
                        class="relative bg-gradient-to-b from-yellow-50 to to-gold bg-clip-text text-transparent text-3xl uppercase font-serif font-bold flex-wrap italic"
                    >
                        Classic fashion collection
                        <p
                            class="star-animation mt-4 z-50 rounded-full w-1 h-1 bg-gold"
                        ></p>
                    </h5>
                </div>
            </div>
        </div>
        <div class="w-full flex justify-center">
            <div class="mx-2 max-w-screen-lg mt-2">
                <vue-marquee-slider
                    id="marquee-slider"
                    :speed="50000"
                    :width="500"
                >
                    <p class="font-semibold text-lg -white">
                        Free delivery for orders above ksh 1000 all around
                        Kenya.
                    </p>
                    <p class="font-semibold text-lg -white">
                        Striving for quality customer service...
                    </p>
                    <p class="font-semibold text-lg -white">
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
                            @click="search"
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
                    class="bg-gradient-to-l from-lime-50 to bg-purple-50 p-4 rounded-lg"
                >
                    <div class="flex justify-between w-full">
                        <h1 class="text-lg font-bold text-gray-800">
                            Top selling items
                        </h1>
                        <p>
                            <RouterLink
                                to="/shop/all"
                                class="text-gray-900 underline text-sm flex"
                            >
                                VIEW ALL
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    fill="none"
                                    viewBox="0 0 24 24"
                                    stroke-width="1.5"
                                    stroke="currentColor"
                                    class="w-4 h-4 mt-0.5"
                                >
                                    <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        d="m8.25 4.5 7.5 7.5-7.5 7.5"
                                    />
                                </svg>
                            </RouterLink>
                        </p>
                    </div>

                    <main
                        v-if="featuredProducts?.length > 0"
                        class="grid grid-cols-2 gap-x-6 gap-y-10 px-2 pb-20 sm:grid-cols-3 sm:px-8 lg:mt-8 lg:grid-cols-4 lg:gap-x-4 lg:px-0"
                    >
                        <ProductCard1
                            v-for="product in featuredProducts"
                            :key="product"
                            :item="product"
                            :image="product.image"
                            :altText="product.altText"
                            orderText="Pick"
                            :name="product.name"
                            :ratings="product.ratings"
                            :price="product.price"
                            viewItemText="View item..."
                        />
                    </main>
                    <div v-else class="flex justify-center items-center h-48">
                        <div class="loader"></div>
                    </div>
                </div>
                <div
                    class="bg-gradient-to-r from-blue-50 via via-rose-50 to to-purple-50 p-4 rounded-lg mt-4"
                >
                    <div class="flex justify-between w-full">
                        <h1 class="text-lg font-bold text-gray-800">
                            Today's Top Deals
                        </h1>
                        <p>
                            <RouterLink
                                to="/shop/all"
                                class="text-gray-900 underline flex text-sm"
                            >
                                VIEW ALL
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    fill="none"
                                    viewBox="0 0 24 24"
                                    stroke-width="1.5"
                                    stroke="currentColor"
                                    class="w-4 h-4 mt-0.5"
                                >
                                    <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        d="m8.25 4.5 7.5 7.5-7.5 7.5"
                                    />
                                </svg>
                            </RouterLink>
                        </p>
                    </div>
                    <main
                        v-if="featuredProducts?.length > 0"
                        class="grid grid-cols-2 gap-x-6 gap-y-10 px-2 pb-20 sm:grid-cols-3 sm:px-8 lg:mt-8 lg:grid-cols-4 lg:gap-x-4 lg:px-0"
                    >
                        <ProductCard1
                            v-for="product in featuredProducts"
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
                    <div v-else class="flex justify-center items-center h-48">
                        <div class="loader"></div>
                    </div>
                </div>

                <div class="px-4 pt-36 pb-10 relative mx-auto max-w-screen-lg">
                    <div
                        class="bg-gradient-to-l from-lime-50 to bg-purple-50 p-4 rounded-lg"
                    >
                        <Carousel
                            :itemsToShow="itemsToShowRef"
                            :autoplay="1900"
                            :transition="2200"
                            :wrap-around="true"
                        >
                            <Slide
                                v-for="product in productData.products"
                                :key="product"
                            >
                                <div class="w-full h-48">
                                    <SlideCard
                                        v-for="product in productData.products"
                                        :key="product.id"
                                        :item="product"
                                        :image="product.image"
                                        :altText="product.altText"
                                        orderText="Buy Now"
                                        :name="product.name"
                                        :ratings="product.ratings"
                                        :price="product.price"
                                        viewItemText="Description"
                                    />
                                </div>
                            </Slide>
                            <template #addons>
                                <Pagination />
                                <div
                                    class="absolute inset-x-0 bg-white -bottom-6 mx-auto w-16 h-16 rounded-full border-8 border-white shadow-lg"
                                >
                                    <img
                                        class="mx-auto w-full rounded-full"
                                        :src="logo"
                                        alt="logo"
                                    />
                                </div>
                            </template>
                        </Carousel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script setup>
import { ref, onMounted } from "vue";
import "vue3-carousel/dist/carousel.css";
import { Carousel, Slide, Pagination } from "vue3-carousel";
import ProductCard1 from "../components/ProductCard1.vue";
import { VueMarqueeSlider } from "vue3-marquee-slider";
import Logo from "../assets/images/logo.png";
import Hero from "../assets/images/veehero.jpg";
import SlideCard from "../components/SlideCard.vue";

import { useShoppingStore } from "../stores";

//get products from store meaniwhile
const productData = useShoppingStore();

const featuredProducts = ref(null);
const filteredArray = ref(null);

const searchTerm = ref(null);

const logo = Logo;
var hero = Hero;

const itemsToShowRef = ref(3.5);

const checkIfMobile = () => {
    if (window.innerWidth < 768) {
        itemsToShowRef.value = 2;
    }
};

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

onMounted(() => {
    checkIfMobile();

    window.addEventListener("resize", checkIfMobile);
    // console.log('first', productData.products)
    const getRandomProducts = (limit) => {
        console.log("running...");

        const pdt = [...productData.products];
        const BshuffledProducts = pdt.sort(() => Math.random() - 0.5);

        const shuffledProducts = BshuffledProducts.slice(0, 8);
        return (featuredProducts.value = shuffledProducts);
    };

    getRandomProducts();

    setInterval(getRandomProducts, 6000);
});
</script>
<style scoped>
.carousel__slide {
    padding: 5px;
}

.carousel__viewport {
    perspective: 2000px;
}

.carousel__track {
    transform-style: preserve-3d;
}

.carousel__slide--sliding {
    transition: 0.5s;
}

.carousel__slide {
    opacity: 0.9;
    transform: rotateY(-20deg) scale(0.9);
}

.carousel__slide--active ~ .carousel__slide {
    transform: rotateY(20deg) scale(0.9);
}

.carousel__slide--prev {
    opacity: 1;
    transform: rotateY(-10deg) scale(0.95);
}

.carousel__slide--next {
    opacity: 1;
    transform: rotateY(10deg) scale(0.95);
}

.carousel__slide--active {
    opacity: 1;
    transform: rotateY(0) scale(1.1);
}

.star-animation {
    position: absolute;
    z-index: 999;
    top: 0;
    left: -10px; /* Adjust the initial position of the star */
    animation: starPass 10s ease-in-out infinite; /* Add animation timing function */
}

@keyframes starPass {
    0% {
        left: -10px; /* Start position */
        opacity: 0; /* Initially hidden */
        box-shadow: 0 0 30px 15px #ffdd57;
    }
    50% {
        left: 75px; /* Middle position, off screen */
        opacity: 0.8; /* Fully visible */
        box-shadow: 0 0 60px 30px #efe4b9;
    }
    50% {
        left: 150px; /* Middle position, off screen */
        opacity: 1; /* Fully visible */
        box-shadow: 0 0 40px 25px #fffffc;
    }
    50% {
        left: 220px; /* Middle position, off screen */
        opacity: 0.8; /* Fully visible */
        box-shadow: 0 0 30px 15px #ffffff;
    }
    100% {
        left: 300px; /* End position, off screen */
        opacity: 0; /* Hidden again */
        box-shadow: 0 0 10px 5px #ffcc00;
    }
}
</style>
