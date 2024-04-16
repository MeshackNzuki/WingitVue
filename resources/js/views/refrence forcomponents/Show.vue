<template>
    <div class="bg-gradient-to-b from-purple-100 via-cyan-50">
        <div class="w-full flex flex-col justify-center">
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
            </div>
            <div class="bg-slate-50 rounded-lg p-4 mt-2">
                <main
                    class="grid grid-cols-1 gap-x-6 gap-y-10 px-2 pb-20 sm:grid-cols-3 sm:px-8 lg:mt-8 lg:grid-cols-1 lg:gap-x-4 lg:px-0"
                >
                    <div></div>
                    <ProductCard1
                        :key="itm"
                        :item="itm"
                        :image="itm.image"
                        :altText="itm.altText"
                        orderText="Order"
                        :name="itm.name"
                        :ratings="itm.ratings"
                        :price="itm.price"
                        viewItemText="View item..."
                    />
                </main>
            </div>
        </div>
    </div>
</template>
<script setup>
import { ref, onMounted, computed } from "vue";
import "vue3-carousel/dist/carousel.css";
import ProductCard1 from "../components/ProductCard1.vue";
import { VueMarqueeSlider } from "vue3-marquee-slider";
import { useRoute } from "vue-router";
import { useShoppingStore } from "../stores";

//get products from store meaniwhile
const productData = useShoppingStore();

const products = productData.products;
const route = useRoute();

const itm = ref([]);

onMounted(() => {
    const pdt = [...products];
    console.log("first", route.params.id);

    const id = parseInt(route.params.id);

    const item = pdt.find((i) => i.id === id);

    itm.value = item;
});
</script>
