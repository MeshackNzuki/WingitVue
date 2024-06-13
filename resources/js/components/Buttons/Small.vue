<template>
    <button
        :class="
            'bg-emerald-500 py-1 text-gray-100 rounded-full hover:translate-x-1 hover:scale-110 transition duration-200 ease-out' +
            classes
        "
        @click="handleClick"
    >
        {{ buttonText }}
    </button>
</template>

<script setup>
// Props
const props = defineProps({
    buttonText: { type: String, default: "Button Comp" },
    action: { type: Function, default: () => {} },
    classes: { type: String, default: "" },
});

const handleClick = () => {
    props.action();
};
</script>
