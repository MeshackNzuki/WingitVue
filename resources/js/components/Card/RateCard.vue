<template>
    <div
        class="max-w-sm mx-auto from-sky-50 via-purple-50 to-blue-50 bg-gradient-to-tl  shadow-md rounded-2xl overflow-hidden">
        <div class="p-6">
            <div class="flex flex-col items-center">
                <h2 class="text-gray-700 mr-2 font-bold">{{ name }}</h2>
                <p>{{ text }}</p>
                <div class="flex flex-row p-2">
                    <i v-for="(rate, index) in rating" :key="index" class="pi pi-star-fill text-yellow"></i>
                    <i v-for="(remainder, index) in (5 - rating)" :key="index" class="pi pi-star text-gray-700"></i>
                </div>
                <span class="ml-2 text-gray-600">({{ rating }})</span>
            </div>
        </div>
    </div>
</template>

<script setup>
defineProps({
    name: {
        type: String,
        default: "Ian Ogeto"
    },
    rating: {
        type: Number,
        default: 0
    },
    text: {
        type: String,
        default: ""
    }
});
</script>

<style scoped></style>
