<template>
    <div class="flex rounded-full flex-row overflow-hidden shadow-sm">
        <router-link
            :to="link1"
            class="flex flex-row py-2 px-4 bg-gold text-gray-900 text-center font-thin transition hover:bg-white"
        >
            {{ label1 }}
        </router-link>
        <router-link
            :to="link2"
            class="flex flex-row py-2 px-4 bg-gradient-to-r from-base to bg-teal-700 text-gray-50 text-center font-thin transition hover:bg-base"
        >
            {{ label2 }}
        </router-link>
    </div>
</template>

<script setup>
import { defineProps } from "vue";

const props = defineProps({
    link1: { type: String, required: true },
    link2: { type: String, required: true },
    label1: { type: String, required: true },
    label2: { type: String, required: true },
});
</script>

<style scoped>
/* Add any additional styling here */
</style>
