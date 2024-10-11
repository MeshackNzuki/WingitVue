<template>
    <span
        class="errors w-full text-xs flex justify-start text-red-500 rounded border-0 p-1 transition-duration-230ms"
    >
        <FontAwesomeIcon
            icon="fa-solid fa-circle-exclamation"
            class="h-5 w-5 mr-2"
        />
        {{ message }}
    </span>
</template>

<script setup>
import { defineProps } from "vue";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";

// Define props
const props = defineProps({
    message: {
        type: String,
        required: true,
    },
});
</script>

<style scoped>
/* Add scoped styles here */
</style>
