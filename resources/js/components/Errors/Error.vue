<template>
    <span
        class="errors w-full text-xs flex justify-start text-red-500  bg-red-50 rounded-full my-1 border-0 p-1 transition-duration-230ms">
        <i class="pi pi-exclamation-circle animate animate-pulse me-2"></i>
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
