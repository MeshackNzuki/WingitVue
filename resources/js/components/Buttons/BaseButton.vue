<script setup>
const props = defineProps(["action", "label", "icon"]);
</script>

<template>
    <button
        class="flex-1 group rounded-full py-1 px-4 bg-gradient-to-tr from-teal-600 to-base font-normal shadow-sm shadow-black/20 relative overflow-hidden transition-transform duration-250 transform hover:scale-110"
        @click="props.action"
    >
        <span class="relative font-light leading-5 text-gray-50">
            {{ props.label }} {{ " " }} <slot name="icon"></slot>
        </span>
        <div
            class="absolute inset-0 w-full h-full transition-all duration-300 scale-0 group-hover:scale-100 group-hover:bg-white/30 rounded-md"
        ></div>
    </button>
</template>
