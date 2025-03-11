<template>
    <button type="submit" attrib :class="[
        // Apply bg-sky-500 and text-gray-100 when the theme is Light, otherwise use the current theme's bg and text
        theme?.currentTheme === 'Light'
            ? 'bg-sky-500 text-gray-100'
            : theme?.themes[theme.currentTheme]?.bg +
            ' ' +
            theme?.themes[theme.currentTheme]?.text,
        'px-4 py-1 rounded-full hover:translate-x-1 hover:scale-110 transition duration-200 ease-out shadow-lg',
        'dark:shadow-slate-300 dark:shadow-sm', // Apply dark shadow classes
        attrib === '' ? '' : 'bg-gray-300', // Additional class when `attrib` is not empty
    ]" @click="handleClick">
        <i :class="icon"></i>
        {{ buttonText }}
    </button>
</template>

<script setup>
import { useThemeStore } from "../../stores/theme";

const theme = useThemeStore();
// Props
const props = defineProps({
    attrib: { type: String, default: "" },
    buttonText: { type: String, default: "Button Comp" },
    action: { type: Function, default: () => { } },
    icon: { type: String, default: null },
});

const handleClick = () => {
    props.action();
};
</script>