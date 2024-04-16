<template>
    <button
        class="bg-gradient-to-r from-yellow-200 to font-semibold bg-gold px-4 py-1 text-black rounded-full hover:translate-x-1 hover:scale-110 transition duration-200 ease-out"
        @click="handleClick"
    >
        {{ buttonText }}
    </button>
</template>

<script setup>
// Props
const props = defineProps({
    buttonText: { type: String, default: "Button" },
    action: { type: Function, default: () => {} },
});

const handleClick = () => {
    props.action();
};
</script>
