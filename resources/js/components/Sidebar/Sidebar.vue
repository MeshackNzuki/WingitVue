<template>
    <nav
        v-if="!login"
        class="rounded-xl absolute md:left-1 md:block md:fixed md:top-1 md:bottom-1 md:overflow-y-auto md:flex-row md:flex-nowrap md:overflow-hidden shadow-lg bg-slate-100 dark:bg-slate-800 dark:text-slate-400 flex flex-wrap items-center justify-between md:w-64 z-10 py-4 px-6"
    >
        <div
            class="md:flex-col md:items-stretch md:min-h-full md:flex-nowrap px-0 flex flex-wrap items-center space-y-4 w-full mx-auto"
        >
            <!-- Toggler -->
            <button
                class="cursor-pointer text-black opacity-50 md:hidden px-3 py-1 text-xl leading-none bg-transparent rounded border border-solid border-transparent"
                type="button"
                v-on:click="toggleCollapseShow('bg-white m-2 py-3 px-6')"
            ></button>
            <!-- Brand -->
            <div class="flex flex-col justify-center items-center w-full">
                <router-link
                    class="md:block text-left md:pb-2 text-blueGray-600 text-sm uppercase font-bold p-4 px-0"
                    to="/"
                >
                    Ultra S. Manager
                </router-link>

                <!-- User -->
                <ul class="items-center flex flex-wrap list-none">
                    <li class="inline-block relative">
                        <user-dropdown />
                    </li>
                </ul>
            </div>
            <!-- Admin -->
            <div v-if="route.path.includes('/admin')" class="min-h-96 mt-0">
                <span
                    class="w-full flex justify-center text-center text-xs font-bold"
                >
                    Admin Module</span
                >
            </div>

            <!-- Library -->
            <div v-if="route.path.includes('/library')" class="min-h-96 mt-0">
                <span
                    class="w-full flex justify-center text-center text-xs font-bold"
                >
                    Library Module</span
                >
            </div>

            <!-- Finance -->
            <div v-if="route.path.includes('/finance')" class="min-h-96 mt-0">
                <span
                    class="w-full flex justify-center text-center text-xs font-bold"
                >
                    Finance Module</span
                >
            </div>

            <!-- Guardian -->
            <div v-if="route.path.includes('/guardian')" class="min-h-96 mt-0">
                <span
                    class="w-full flex justify-center text-center text-xs font-bold"
                >
                    Guardian Module</span
                >
            </div>

            <div
                v-if="route.path.includes('/admissions')"
                class="min-h-96 mt-0"
            >
                <span
                    class="w-full flex justify-center text-center text-xs font-bold"
                >
                    Admissions Module</span
                >
            </div>

            <!-- Student -->
            <div v-if="route.path.includes('/student')" class="min-h-96 mt-0">
                <span
                    class="w-full flex justify-center text-center text-xs font-bold"
                >
                    Student Module</span
                >
            </div>

            <!-- Instructor -->
            <div
                v-if="route.path.includes('/instructor')"
                class="min-h-96 mt-0"
            >
                <span
                    class="w-full flex justify-center text-center text-xs font-bold"
                >
                    Instructor Module</span
                >
            </div>
        </div>
    </nav>
</template>
<script setup>
import { ref, onMounted, watch } from "vue";
import NotificationDropdown from "@/components/Dropdowns/NotificationDropdown.vue";
import UserDropdown from "@/components/Dropdowns/UserDropdown.vue";
import { useRoute } from "vue-router";
import { useDark, useToggle } from "@vueuse/core";

const collapseShow = ref("hidden");
const toggleCollapseShow = (classes) => {
    collapseShow.value = classes;
};

const route = useRoute();
const login = ref(false);

onMounted(() => {
    // Access current route properties directly on route object
    if (route.path === "/login") {
        login.value = true;
    }
});

// Watch for changes in the current route path
watch(
    () => route.path,
    (newPath) => {
        login.value = newPath === "/login";
    },
);
</script>
