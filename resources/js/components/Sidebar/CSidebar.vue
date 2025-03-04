<template>
    <nav v-if="!login" ref="sidebar_id" :class="'rounded-xl fixed left-1 top-1 overflow-scroll bottom-1 dark:text-slate-300 md:overflow-y-auto md:flex-row md:flex-nowrap md:overflow-hidden shadow-lg  flex-wrap items-center justify-between z-10 py-4 w-64 px-6 transition-all ease-in-out duration-300 ' +
        (isDark
            ? ' bg-gradient-to-r from-slate-800 via-sky-950 to-sky-950 '
            : ' bg-gradient-to-r from-white via-slate-50 to-sky-50 ') +
        (mainStore.sidebarOpen ? ' flex ' : '   hidden ')
        ">
        <div
            class="md:flex-col md:items-stretch md:min-h-full md:flex-nowrap px-0 flex flex-wrap items-center space-y-4 w-full mx-auto">
            <!-- Toggler -->
            <button
                class="cursor-pointer text-black opacity-50 md:hidden px-3 py-1 text-xl leading-none bg-transparent rounded border border-solid border-transparent"
                type="button" v-on:click="toggleCollapseShow('bg-white m-2 py-3 px-6')"></button>
            <!-- Brand -->
            <div class="flex flex-col justify-center items-center w-full">
                <router-link class="md:block text-left md:pb-2 text-blueGray-600 text-sm uppercase font-bold p-4 px-0"
                    to="/">
                    WINGIT
                </router-link>

                <!-- User -->
                <ul class="items-center flex flex-wrap list-none">
                    <li class="inline-block relative">
                        <router-link :to="'/' + (user?.role).replace(/_/g, '-') + '/account'">
                            <div class=" avatar">
                                <div class="ring-base ring-offset-base w-14 rounded-full ring ring-offset-2">
                                    <img class="flex-1" :src="user?.avatar != null
                                        ? `https://api.wingit.co.ke/core/storage/app/public/uploads/avatars/${user?.avatar}`
                                        : Logo
                                        " />
                                </div>
                            </div>
                        </router-link>
                    </li>
                </ul>
            </div>
            <!-- Admin -->
            <div v-if="route.path.startsWith('/tourism-operator')" class="mt-0">
                <div class="relative flex flex-col rounded-x w-full p-2">
                    <nav class="flex flex-col gap-1 p-2 font-sans text-base font-normal  dark:text-slate-300">
                        <router-link to="/transport/">
                            <div role="button" tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-compass"></i>
                                </div>
                                Dashboard
                            </div>
                        </router-link>
                        <router-link to="/tourism-operator/all-flights">
                            <div role="button" tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-users"></i>
                                </div>
                                All flights
                            </div>
                        </router-link>

                        <router-link to="/tourism-operator/listed-flights">
                            <div role="button" tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-list"></i>
                                </div>
                                Listed Flights
                            </div>
                        </router-link>

                        <router-link to="/tourism-operator/trips">
                            <div role="button" tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-reload"></i>
                                </div>
                                Trips
                            </div>
                        </router-link>
                        <router-link to="/tourism-operator/trips">
                            <div role="button" tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-file"></i>
                                </div>
                                Statements
                            </div>
                        </router-link>
                        <router-link to="/tourism-operator/pilots">
                            <div role="button" tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-user"></i>
                                </div>
                                pilots
                            </div>
                        </router-link>
                        <router-link to="/tourism-operator/aircrafts">
                            <div role="button" tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-send"></i>
                                </div>
                                Aircrafts
                            </div>
                        </router-link>
                        <router-link to="/tourism-operator/messages">
                            <div role="button" tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-inbox"></i>
                                </div>
                                Messages
                            </div>
                        </router-link>
                        <router-link to="/tourism-operator/notifications">
                            <div role="button" tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-bell"></i>
                                </div>
                                Notifications
                            </div>
                        </router-link>
                        <router-link to="/tourism-operator/account">
                            <div role="button" tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-user"></i>
                                </div>
                                Account
                            </div>
                        </router-link>
                        <router-link to="/tourism-operator/settings">
                            <div role="button" tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-cog"></i>
                                </div>
                                Settings
                            </div>
                        </router-link>
                        <hr />
                    </nav>
                </div>
            </div>
            <div v-if="route.path.startsWith('/customer')" class="mt-0">
                <div class="relative flex flex-col rounded-x w-full p-2">
                    <nav class="flex flex-col gap-1 p-2 font-sans text-base font-normal  dark:text-slate-300">
                        <router-link to="/customer/">
                            <div role="button" tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-compass"></i>
                                </div>
                                Dashboard
                            </div>
                        </router-link>
                        <router-link to="/customer/bookings">
                            <div role="button" tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-calendar-clock"></i>
                                </div>
                                My Bookings
                            </div>
                        </router-link>
                        <router-link to="/customer/previous-bookings">
                            <div role="button" tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-history"></i>
                                </div>
                                My Trips
                            </div>
                        </router-link>

                        <router-link to="/customer/packing">
                            <div role="button" tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-briefcase"></i>
                                </div>
                                Packing Lists
                            </div>
                        </router-link>

                        <router-link to="/customer/account">
                            <div role="button" tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-user"></i>
                                </div>
                                Account
                            </div>
                        </router-link>

                        <router-link to="/customer/settings">
                            <div role="button" tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-cog"></i>
                                </div>
                                Settings
                            </div>
                        </router-link>
                        <hr />
                    </nav>
                </div>
            </div>
            <div v-if="route.path.startsWith('/aircraft-operator')" class="mt-0">
                <div class="relative flex flex-col rounded-x w-full p-2">
                    <nav class="flex flex-col gap-1 p-2 font-sans text-base font-normal  dark:text-slate-300">
                        <router-link to="/aircraft-operator">
                            <div role="button" tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-compass"></i>
                                </div>
                                Dashboard
                            </div>
                        </router-link>
                        <router-link to="/aircraft-operator/all-flights">
                            <div role="button" tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-users"></i>
                                </div>
                                All flights
                                <span
                                    class="size-5 p-1 rounded-full text-white bg-emerald-500 flex items-center justify-center shadow-md mb-4 text-xs">{{
                                        mainStore.airOpData.all_flights_count
                                    }}</span>
                            </div>
                        </router-link>

                        <router-link to="/aircraft-operator/listed-flights">
                            <div role="button" tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-user"></i>
                                </div>
                                Listed Flights
                                <span
                                    class="size-5 p-1 rounded-full text-white bg-emerald-500 flex items-center justify-center shadow-md mb-4 text-xs">{{
                                        mainStore.airOpData.listed_flights_count
                                    }}</span>
                            </div>
                        </router-link>

                        <router-link to="/aircraft-operator/trips">
                            <div role="button" tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-refresh"></i>
                                </div>
                                Trips
                                <span
                                    class="size-5 p-1 rounded-full text-white bg-emerald-500 flex items-center justify-center shadow-md mb-4 text-xs">{{
                                        mainStore.airOpData.trips_count }}</span>
                            </div>
                        </router-link>
                        <router-link to="/aircraft-operator/statements">
                            <div role="button" tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-file"></i>
                                </div>
                                Statements
                            </div>
                        </router-link>
                        <router-link to="/aircraft-operator/pilots">
                            <div role="button" tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-user"></i>
                                </div>
                                pilots
                            </div>
                        </router-link>
                        <router-link to="/aircraft-operator/aircrafts">
                            <div role="button" tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-send"></i>
                                </div>
                                Aircrafts
                            </div>
                        </router-link>
                        <router-link to="/aircraft-operator/messages">
                            <div role="button" tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-inbox"></i>
                                </div>
                                Messages
                                <span
                                    class="size-5 p-1 rounded-full text-white bg-rose-500 flex items-center justify-center shadow-md mb-4">{{
                                        mainStore.airOpData.messages_count
                                    }}</span>
                            </div>
                        </router-link>
                        <router-link to="/aircraft-operator/notifications">
                            <div role="button" tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-bell"></i>
                                </div>
                                Notifications
                                <span
                                    class="size-5 p-1 rounded-full text-white bg-rose-500 flex items-center justify-center shadow-md mb-4">{{
                                        mainStore.airOpData.notification_count
                                    }}</span>
                            </div>
                        </router-link>
                        <router-link to="/aircraft-operator/account">
                            <div role="button" tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-user"></i>
                                </div>
                                Account
                            </div>
                        </router-link>
                        <router-link to="/aircraft-operator/settings">
                            <div role="button" tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-cog"></i>
                                </div>
                                Settings
                            </div>
                        </router-link>
                        <hr />
                    </nav>
                </div>
            </div>
            <div v-if="route.path.startsWith('/user/profile')">
                <router-link to="/">
                    <div role="button" tabindex="0"
                        class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                        <div class="grid place-items-center mr-4">
                            <i class="pi pi-arrow-circle-left"></i>
                        </div>
                        Exit
                    </div>
                </router-link>
            </div>

            <span @click="logout()">
                <div role="button" tabindex="0"
                    class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                    <div class="grid place-items-center mr-4">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                            aria-hidden="true" class="h-5 w-5">
                            <path fill-rule="evenodd"
                                d="M12 2.25a.75.75 0 01.75.75v9a.75.75 0 01-1.5 0V3a.75.75 0 01.75-.75zM6.166 5.106a.75.75 0 010 1.06 8.25 8.25 0 1011.668 0 .75.75 0 111.06-1.06c3.808 3.807 3.808 9.98 0 13.788-3.807 3.808-9.98 3.808-13.788 0-3.808-3.807-3.808-9.98 0-13.788a.75.75 0 011.06 0z"
                                clip-rule="evenodd"></path>
                        </svg>
                    </div>
                    Log Out
                </div>
            </span>
        </div>
    </nav>
</template>
<script setup>
import { ref, onMounted, watch } from "vue";
import UserDropdown from "@/components/Dropdowns/UserDropdown.vue";
import Logo from "../../assets/logo.png";
import { useRoute } from "vue-router";
import { useDark } from "@vueuse/core";
import CommonButton from "../../components/Buttons/CommonButton.vue";
import { onClickOutside, useMediaQuery } from "@vueuse/core";
import { authStore } from "../../stores/authStore";
import { useMainStore } from "../../stores";
const collapseShow = ref("hidden");
const toggleCollapseShow = (classes) => {
    collapseShow.value = classes;
};

const { user, logout } = authStore();
const mainStore = useMainStore();
const isDark = useDark({ disableTransition: false });
const route = useRoute();
const sidebar_id = ref(false);
const login = ref(false);

onMounted(() => {
    // Access current route properties directly on route object
    if (route.path === "/login") {
        login.value = true;
    }

    //handle clink out
    const isMobile = useMediaQuery(
        "(min-width: 100px) and (max-width: 1024px)",
    );

    if (isMobile.value) {
        onClickOutside("sidebar_id", (event) => {
            mainStore.closeSidebar();
        });
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
