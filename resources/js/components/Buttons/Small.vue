<template>
    <button
        attrib
        :class="
            'bg-emerald-500 py-1 px-2 text-gray-100 rounded-full hover:translate-x-1 hover:scale-110 transition duration-200 ease-out' +
            classes
        "
        @click="handleClick"
    >
        <i :class="icon"></i>{{ buttonText }}
    </button>
</template>

<script setup>
// Props
const props = defineProps({
    attrib: { type: String },
    buttonText: { type: String, default: "" },
    action: { type: Function, default: () => {} },
    classes: { type: String, default: "" },
    icon: { type: String, default: "" },
});

const handleClick = () => {
    props.action();
};
</script>
