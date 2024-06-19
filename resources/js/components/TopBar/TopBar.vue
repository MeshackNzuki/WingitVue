<template>
    <div
        :class="[
            'flex flex-row justify-between items-center mb-2 rounded-lg p-1 mt-1 h-10 dark:text-slate-300 px-4',
            isDark
                ? ' bg-gradient-to-r from-slate-800 via-sky-950 to-blue-950'
                : 'bg-slate-100',
        ]"
    >
        <div class="flex">
            <span class="font-semibold" v-if="user?.name"
                >Hello ,{{ user?.name }}!</span
            >
        </div>
        <div class="flex">
            <span
                class="font-semibold uppercase text-sm"
                v-if="location != '404' && location != 'unauthorized'"
                >{{ location }} Module</span
            >
            <span
                class="cursor-pointer font-semibold animate animate-pulse text-red-500"
                v-else
            >
                Sorry!
            </span>
        </div>

        <div class="flex px-4 space-x-2">
            <button class="p-1">
                <i class="pi pi-search"></i>
            </button>
            <button class="p-1">
                <div class="indicator">
                    <i class="pi pi-bell"></i>
                    <span
                        class="badge badge-xs bg-red-500 indicator-item animate-pulse"
                    ></span>
                </div>
            </button>
            <label class="cursor-pointer grid place-items-center">
                <input
                    type="checkbox"
                    value="synthwave"
                    class="toggle theme-controller bg-base-content row-start-1 col-start-1 col-span-2"
                    @click="toggleDark()"
                />
                <svg
                    class="col-start-2 row-start-1 stroke-cyan-500 fill-cyan-500"
                    xmlns="http://www.w3.org/2000/svg"
                    width="14"
                    height="14"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                >
                    <path
                        d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"
                    ></path>
                </svg>
                <svg
                    class="col-start-1 row-start-1 stroke-cyan-500 fill-cyan-500"
                    xmlns="http://www.w3.org/2000/svg"
                    width="14"
                    height="14"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                >
                    <circle cx="12" cy="12" r="5" />
                    <path
                        d="M12 1v2M12 21v2M4.2 4.2l1.4 1.4M18.4 18.4l1.4 1.4M1 12h2M21 12h2M4.2 19.8l1.4-1.4M18.4 5.6l1.4-1.4"
                    />
                </svg>
            </label>
        </div>
    </div>
</template>
<script setup>
import { ref, onMounted, watch } from "vue";
import { useRoute } from "vue-router";
import { useDark, useToggle } from "@vueuse/core";
import { authStore } from "../../stores/authStore";
import commonButton from "../CommonButton.vue";

const isDark = useDark({ disableTransition: false });
const toggleDark = useToggle(isDark);

const collapseShow = ref("hidden");
const toggleCollapseShow = (classes) => {
    collapseShow.value = classes;
};

const { user } = authStore();

const route = useRoute();
const login = ref(false);
const location = ref(null);

onMounted(() => {
    // Access current route properties directly on route object
    if (route.path === "/login") {
        login.value = true;
    }
    location.value = route.path;
});

// Watch for changes in the current route path
watch(
    () => route.path,
    (newPath) => {
        login.value = newPath === "/login";
        location.value = route.path.split("/")[1];
    },
);
</script>
