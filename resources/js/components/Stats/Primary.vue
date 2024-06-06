<template>
    <div
        :class="
            'flex flex-row justify-between shadow-lg px-4 py-2 w-64 rounded-3xl ' +
            (isDark
                ? 'bg-gradient-to-r from-slate-800 via-sky-950 to-purple-950'
                : 'bg-gradient-to-r from-white via-blue-50 to-sky-50')
        "
    >
        <div class="space-y-1">
            <div
                class="flex items-center space-x- text-sm font-medium text-slate-500 dark:text-slate-400"
            >
                <span>Revenue</span>
            </div>
            <div class="text-2xl dark:text-slate-100 text-right">$192.1k</div>

            <div
                class="flex items-center space-x-1 text-sm font-medium text-emerald-500 dark:text-emerald-300"
            >
                <span class="text-sm font-light">32k increase</span>

                <svg
                    class="w-4 h-4"
                    xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 20 20"
                    fill="currentColor"
                    aria-hidden="true"
                >
                    <path
                        fill-rule="evenodd"
                        d="M12 7a1 1 0 110-2h5a1 1 0 011 1v5a1 1 0 11-2 0V8.414l-4.293 4.293a1 1 0 01-1.414 0L8 10.414l-4.293 4.293a1 1 0 01-1.414-1.414l5-5a1 1 0 011.414 0L11 10.586 14.586 7H12z"
                        clip-rule="evenodd"
                    ></path>
                </svg>
            </div>
        </div>
        <div class="flex justify-end items-center">
            <i class="pi pi-wallet text-2xl dark:text-slate-100"></i>
        </div>
    </div>
</template>
<script setup>
import { useDark, useToggle } from "@vueuse/core";
const isDark = useDark({ disableTransition: false });
</script>
