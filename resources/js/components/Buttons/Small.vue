<template>
    <button :class="[
        // Base styles (these should always apply first)
        'py-1 px-2 rounded-full shadow-lg dark:shadow-slate-300 dark:shadow-sm',
        'hover:translate-x-1 hover:scale-110 transition duration-200 ease-out',

        // Special condition for buttonText == 'Del' or 'Delete', this will override the theme's background color
        buttonText == 'Del' || buttonText == 'Delete'
            ? 'bg-red-500'
            : '',

        // If classes are provided, remove theme-related classes
        classes
            ? ''  // If `classes` prop is set, no need for the theme classes
            : theme?.currentTheme === 'Light'
                ? 'bg-sky-500 text-gray-50'  // Light theme background and text color
                : theme?.themes[theme.currentTheme]?.bg + ' ' + theme?.themes[theme.currentTheme]?.text, classes  // Dark theme or custom theme background and text color

    ]" @click="handleClick">
        <i :class="icon"></i>
        <i v-if="!icon && buttonText === 'Edit'" class="pi pi-pencil text-xs"></i>
        {{ buttonText }}
    </button>
</template>

<script setup>
import { useThemeStore } from "../../stores/theme";

const theme = useThemeStore();
// Props
const props = defineProps({
    buttonText: { type: String, default: "" },
    action: { type: Function, default: () => { } },
    classes: { type: String, default: "" },
    icon: { type: String, default: null },
});

const handleClick = () => {
    props.action();
};
</script>
