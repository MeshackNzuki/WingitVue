<template>
    <div class="bg-white fixed top-0 right-0 z-40" :class="mainStore.sidebarOpen ? 'left-64' : 'left-0'">
        <div :class="[
            'flex  w-full flex-row justify-between me-4 items-center mb-1 mt-4  rounded-lg py-1 h-10 dark:text-slate-300 px-4 mx-4',
            theme?.themes[theme.currentTheme]?.text,
            isDark
                ? ' bg-gradient-to-r from-slate-800 via-sky-950 to-sky-950 '
                : theme?.themes[theme.currentTheme]?.bg,
        ]" style="right: 0">
            <button @click="mainStore.toggleSidebar()">
                <i class="pi pi-align-right"></i>
            </button>
            <div class="flex justify-center items-center px-4 space-x-2 h-full">
                <RouterLink to="/" class="">
                    <i class="pi pi-arrow-left text-sm"></i> <span>Home</span>
                </RouterLink>
                <RouterLink to="/chat/messages" class="p-1 flex items-center justify-center">
                    <div class="indicator">
                        <i class="pi pi-comments"></i>
                        <span class="badge badge-xs bg-red-500 indicator-item animate-pulse"></span>
                    </div>
                </RouterLink>
                <button class="p-1 flex items-center justify-center">
                    <div class="indicator">
                        <i class="pi pi-bell"></i>
                        <span class="badge badge-xs bg-red-500 indicator-item animate-pulse"></span>
                    </div>
                </button>
                <label class="cursor-pointer grid place-items-center">
                    <input type="checkbox" value="synthwave"
                        class="toggle theme-controller bg-base-content row-start-1 col-start-1 col-span-2"
                        @click="toggleDark()" />
                    <svg class="col-start-2 row-start-1 stroke-cyan-500 fill-sky-500" xmlns="http://www.w3.org/2000/svg"
                        width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                        stroke-linecap="round" stroke-linejoin="round">
                        <path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"></path>
                    </svg>
                    <svg class="col-start-1 row-start-1 stroke-cyan-500 fill-sky-500" xmlns="http://www.w3.org/2000/svg"
                        width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                        stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="5" />
                        <path
                            d="M12 1v2M12 21v2M4.2 4.2l1.4 1.4M18.4 18.4l1.4 1.4M1 12h2M21 12h2M4.2 19.8l1.4-1.4M18.4 5.6l1.4-1.4" />
                    </svg>
                </label>
                <div>
                    <div v-if="user?.avatar" class="avatar pointer" @click="goToUserArea()">
                        <div class="size-8 rounded-full ring ring-base mt-1">
                            <router-link :to="'/' + (user?.role).replace(/_/g, '-') + '/account'">
                                <img :src="`https://api.wingit.co.ke/core/storage/app/public/uploads/avatars/${user.avatar}`"
                                    alt="User Avatar" /></router-link>
                        </div>
                    </div>
                    <div v-else class="relative overflow-hidden bg-gold rounded-full gray-600 mt-1">
                        <div class="size-9 rounded-full ring ring-third">
                            <img :src="`${Logo2}`" alt="User Avatar" />
                        </div>
                    </div>
                </div>
                <div @click="logout()" class="flex items-center justify-center">
                    <div class="cursor-pointer text-sky-800 dark:text-amber-400">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                            stroke="currentColor" aria-hidden="true"
                            :class="`h-5 w-5  ${theme?.themes[theme.currentTheme]?.text}`">
                            <path fill-rule="evenodd"
                                d="M12 2.25a.75.75 0 01.75.75v9a.75.75 0 01-1.5 0V3a.75.75 0 01.75-.75zM6.166 5.106a.75.75 0 010 1.06 8.25 8.25 0 1011.668 0 .75.75 0 111.06-1.06c3.808 3.807 3.808 9.98 0 13.788-3.807 3.808-9.98 3.808-13.788 0-3.808-3.807-3.808-9.98 0-13.788a.75.75 0 011.06 0z"
                                clip-rule="evenodd"></path>
                        </svg>
                    </div>
                </div>
                <button class="p-1 flex items-center justify-center" @click="toggleRightPanel()">
                    <i class="pi pi-cog pi-spin"></i>
                </button>
            </div>
        </div>
    </div>
    <div :class="[
        'w-48 z-50 right-0 bg-slate-200 p-4 shadow-sm rounded-l-lg top-16 fixed transition-all ease-in-out duration-300',
        show ? 'block' : 'hidden',
    ]">
        <div class="flex flex-col gap-2 relative" ref="target">
            <button class="p-1 absolute top-1 right-1" @click="toggleRightPanel()">
                <i class="pi pi-times"></i>
            </button>
            <span class="text-sky-900 font-bold">App Configurator</span>
            <h1 class="font-bold">Select Theme Color</h1>
            <div v-for="i in theme.themes" class="flex flex-row gap-2 items-center cursor-pointer"
                @click="theme.setTheme(i.name)">
                <span :class="`size-7 rounded-full cursor-pointer hover:scale-105 ${i.bg} block`"></span>{{ i.name }}
            </div>
            <h1 class="font-bold">Select Theme Font</h1>

            <div v-for="i in theme.fonts" :class="[
                'flex flex-row gap-2 items-center cursor-pointer',
                i.font,
                i.name == theme.currentFont
                    ? ' bg-gray-200 shadow-md rounded-md'
                    : '',
            ]" @click="theme.setFont(i.name)">
                <i
                    :class="`pi pi-check-circle   ${i.name == theme.currentFont ? ' text-emerald-500' : 'text-sky-500'}`"></i>{{
                        i.name }}
            </div>
            <div class="flex flex-col justify-center items-center gap-2 mt-3">
                <commonButton buttonText="Use Default" icon="pi pi-refresh" :action="() => {
                    theme.setTheme('Wingit');
                    theme.setFont('Modern');
                }
                    " />
                <label class="cursor-pointer grid place-items-center">
                    <input type="checkbox" value="synthwave"
                        class="toggle theme-controller bg-base-content row-start-1 col-start-1 col-span-2"
                        @click="toggleDark()" />
                    <svg class="col-start-2 row-start-1 stroke-cyan-500 fill-sky-500" xmlns="http://www.w3.org/2000/svg"
                        width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                        stroke-linecap="round" stroke-linejoin="round">
                        <path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"></path>
                    </svg>
                    <svg class="col-start-1 row-start-1 stroke-cyan-500 fill-sky-500" xmlns="http://www.w3.org/2000/svg"
                        width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                        stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="5" />
                        <path
                            d="M12 1v2M12 21v2M4.2 4.2l1.4 1.4M18.4 18.4l1.4 1.4M1 12h2M21 12h2M4.2 19.8l1.4-1.4M18.4 5.6l1.4-1.4" />
                    </svg>
                </label>
            </div>
        </div>
    </div>
</template>
<script setup>
import { ref, onMounted, watch } from "vue";
import { useRoute } from "vue-router";
import { onClickOutside, useDark, useToggle } from "@vueuse/core";
import { useMainStore } from "../../stores";
import { authStore } from "../../stores/authStore";
import commonButton from "../../components/Buttons/CommonButton.vue";
import { useThemeStore } from "../../stores/theme";

const isDark = useDark({ disableTransition: false });
const toggleDark = useToggle(isDark);

const collapseShow = ref("hidden");
const toggleCollapseShow = (classes) => {
    collapseShow.value = classes;
};

const { user, logout } = authStore();
const mainStore = useMainStore();
const target = ref(null);
const route = useRoute();
const login = ref(false);
const show = ref(false);
const location = ref(null);
const theme = useThemeStore();

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
const toggleRightPanel = () => {
    show.value = !show.value;
};
onClickOutside(target, () => {
    if (show.value) {
        toggleRightPanel();
    }
});

const updateGreeting = () => {
    const currentHour = new Date().getHours();

    if (currentHour < 12) {
        return "Good Morning";
    } else if (currentHour < 18) {
        return "Good Afternoon";
    } else {
        return "Good Evening";
    }
};

const greeting = () => {
    return updateGreeting();
};
setInterval(greeting, 60000);
</script>
