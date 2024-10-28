<template>
    <div
        class="w-full bg-gray-50 rounded-2xl p-2 md-p-12 flex flex-col justify-center items-center"
    >
        <div class="mb-4 relative">
            <img
                width="100"
                height="100"
                class="object-center object-cover rounded-full h-36 w-36"
                :src="imageSrc"
                :alt="name"
            />
        </div>
        <div class="text-center">
            <p class="text-xl text-gray-800 mb-1">{{ name }}</p>
            <p class="text-base text-gray-400 font-normal">{{ title }}</p>
        </div>
        <div>
            {{ description }}
        </div>
    </div>
</template>

<script setup>
import { defineProps } from "vue";

const props = defineProps({
    name: String,
    title: String,
    imageSrc: String,
    description: String,
});
</script>

<style scoped>
/* Add any specific styles for the TeamMember component here */
</style>
