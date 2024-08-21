<template>
    <button
        type="submit"
        attrib
        :class="
            'bg-emerald-500 px-4 py-1 text-gray-100 rounded-full hover:translate-x-1 hover:scale-110 transition duration-200 ease-out ' +
            (attrib === '' ? '' : 'bg-gray-300')
        "
        @click="handleClick"
    >
        {{ buttonText }}
    </button>
</template>

<script setup>
// Props
const props = defineProps({
    attrib: { type: String, default: "" },
    buttonText: { type: String, default: "Button Comp" },
    action: { type: Function, default: () => {} },
});

const handleClick = () => {
    props.action();
};
</script>
