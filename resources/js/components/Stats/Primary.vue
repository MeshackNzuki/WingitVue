<template>
    <div :class="'flex flex-row justify-between shadow-lg px-4 py-2 w-64 rounded-3xl ' +
        (isDark
            ? 'bg-gradient-to-r from-slate-800 via-sky-950 to-sky-900 shadow-sky-700'
            : 'bg-gradient-to-r from-white via-blue-50 to-sky-50')
        ">
        <div class="space-y-1">
            <div class="flex items-center space-x-1 text-smtext-left text-slate-500 dark:text-slate-300">
                <span>{{ label }}</span>
            </div>
            <div class="text-2xl dark:text-slate-100 text-right">
                {{ quantity }}
            </div>

            <div class="flex items-center space-x-1 text-smtext-left text-emerald-500 dark:text-emerald-300">
                <span class="text-md font-light">{{ description }}</span>
                <svg v-if="up == 'up'" class="w-4 h-4 text-yellow" xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
                        d="M12 7a1 1 0 110-2h5a1 1 0 011 1v5a1 1 0 11-2 0V8.414l-4.293 4.293a1 1 0 01-1.414 0L8 10.414l-4.293 4.293a1 1 0 01-1.414-1.414l5-5a1 1 0 011.414 0L11 10.586 14.586 7H12z"
                        clip-rule="evenodd"></path>
                </svg>
                <svg v-else-if="up == 'down'" class="w-4 h-4 text-yellow" xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
                        d="M8 13a1 1 0 100 2H3a1 1 0 01-1-1v-5a1 1 0 112 0v3.586l4.293-4.293a1 1 0 011.414 0L12 9.414l4.293-4.293a1 1 0 011.414 1.414l-5 5a1 1 0 01-1.414 0L9 11.414l-4.293 4.293V13z"
                        clip-rule="evenodd"></path>
                </svg>
                <span v-else
                    class="bg- text-yellow shadow-sm shadow-sky-400 rounded-full flex justify-center items-center"><i
                        class="pi pi-check-circle"></i></span>
            </div>
        </div>
        <div class="flex justify-end items-center flex-col">
            <i :class="'text-2xl dark:text-slate-100 ' + icon"></i> <router-link :to="link"><small :class="' mt-3 text-slate-50  shadow-lg cursor-pointer badge ' + (isDark
                ? 'bg-sky-500'
                : 'bg-gradient-to-r from-base via-teal-700 to-teal-800')">View All <i
                        class="pi pi-arrow-right text-xs ms-1"></i></small></router-link>
        </div>
    </div>
</template>
<script setup>
import { useDark } from "@vueuse/core";

const props = defineProps({
    label: {
        type: String,
        default: "Revenue",
    },
    description: {
        type: String,
        default: "32k increase",
    },
    quantity: {
        type: String,
        default: "...",
    },
    up: {
        type: String,
        default: "none",
    },
    icon: {
        type: String,
        default: "pi pi-dollar",
    },
    link: {
        type: String,
        default: "#",
    },
});

const isDark = useDark({ disableTransition: false });
</script>
