<template>
    <div
        class="flex flex-row justify-between bg-slate-100 dark:bg-slate-800 dark:text-slate-300 mb-2 rounded-lg p-1 mt-1 h-10"
    >
        <div class="flex">one</div>
        <div class="flex">
            <div class="form-control">
                <input
                    type="text"
                    placeholder="Search"
                    class="input input-bordered w-24 md:w-auto"
                />
            </div>
        </div>
        <div class="flex px-4 space-x-2">
            <button class="p-1">
                <i class="pi pi-search"></i>
            </button>
            <button class="p-1">
                <div class="indicator">
                    <i class="pi pi-bell"></i>
                    <span
                        class="badge badge-xs bg-emerald-500 indicator-item"
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
import NotificationDropdown from "@/components/Dropdowns/NotificationDropdown.vue";
import UserDropdown from "@/components/Dropdowns/UserDropdown.vue";
import { useRoute } from "vue-router";
import { useDark, useToggle } from "@vueuse/core";

const isDark = useDark({ disableTransition: false });
const toggleDark = useToggle(isDark);

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
