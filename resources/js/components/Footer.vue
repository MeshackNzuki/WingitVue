<template>
    <div class="bg-base">
        <footer class="max-w-screen-xl mx-auto py-4 bg-base px-2 lg:px-12">
            <div class="md:flex md:justify-between">
                <div class="mb-6 md:mb-0">
                    <router-link to="#" class="flex items-center">
                        <img
                            src="@/assets/logo.svg"
                            width="100"
                            height="100"
                            class="mr-4 h-6 md:h-6"
                            alt="Wingit Logo"
                        />
                    </router-link>
                </div>
                <div class="grid grid-cols-2 gap-8 sm:gap-6 sm:grid-cols-3">
                    <div>
                        <h3
                            class="mb-6 text-sm font-semibold text-gold uppercase"
                        >
                            Company
                        </h3>
                        <ul>
                            <li class="mb-2">
                                <router-link
                                    to="/about"
                                    class="text-slate-50 hover:underline font-light"
                                >
                                    About us
                                </router-link>
                            </li>
                            <li class="mb-2">
                                <router-link
                                    to="/principle"
                                    rel="nofollow"
                                    class="text-slate-50 hover:underline font-light"
                                >
                                    How it works
                                </router-link>
                            </li>
                            <li class="mb-2">
                                <router-link
                                    to="/help"
                                    rel="nofollow"
                                    class="text-slate-50 hover:underline font-light"
                                >
                                    Contact us
                                </router-link>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <h3
                            class="mb-6 text-sm font-semibold text-gold uppercase"
                        >
                            Travel
                        </h3>
                        <ul>
                            <li class="mb-2">
                                <router-link
                                    to="/search-flight"
                                    class="text-slate-50 hover:underline font-light"
                                >
                                    Airports
                                </router-link>
                            </li>
                            <li class="mb-2">
                                <router-link
                                    to="/search-flight"
                                    class="text-slate-50 hover:underline font-light"
                                >
                                    Cities
                                </router-link>
                            </li>
                            <li class="mb-2">
                                <router-link
                                    to="/search-flight"
                                    class="text-slate-50 hover:underline font-light"
                                >
                                    Parks
                                </router-link>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <h3
                            class="mb-6 text-sm font-semibold text-gold uppercase"
                        >
                            Legal
                        </h3>
                        <ul>
                            <li class="mb-4">
                                <router-link
                                    to="/privacy"
                                    class="text-slate-50 hover:underline font-light"
                                >
                                    Privacy Policy
                                </router-link>
                            </li>
                            <li>
                                <router-link
                                    to="/terms"
                                    class="text-slate-50 hover:underline font-light"
                                >
                                    Terms &amp; Conditions
                                </router-link>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div
                class="flex justify-center space-x-4 text-gray-50 mt-8 font-light"
            >
                Download our App
                <div>
                    <a href="#">
                        <img
                            src="@/assets/playstore.svg"
                            width="100"
                            height="100"
                            class="mr-4 h-28 md:h-36"
                            alt="Play Store"
                        />
                    </a>
                </div>
                <div>
                    <a href="#">
                        <img
                            src="@/assets/appstore.svg"
                            width="100"
                            height="100"
                            class="mr-4 h-28 md:h-36"
                            alt="App Store"
                        />
                    </a>
                </div>
            </div>
            <hr class="my-6 border-gray-200 sm:mx-auto lg:my-8" />
            <div class="sm:flex sm:items-center sm:justify-between">
                <span class="text-sm text-slate-50 sm:text-center">
                    © {{ format(new Date(), "y") }}
                    <a href="#" class="hover:underline">Wingit™</a>
                </span>
                <div class="flex mt-4 space-x-6 sm:justify-center sm:mt-0">
                    <a href="#" class="text-slate-50 hover:text-slate-50">
                        <svg
                            class="w-5 h-5"
                            fill="currentColor"
                            viewBox="0 0 24 24"
                            aria-hidden="true"
                        >
                            <path
                                fill-rule="evenodd"
                                d="M22 12c0-5.523-4.477-10-10-10S2 6.477 2 12c0 4.991 3.657 9.128 8.438 9.878v-6.987h-2.54V12h2.54V9.797c0-2.506 1.492-3.89 3.777-3.89 1.094 0 2.238.195 2.238.195v2.46h-1.26c-1.243 0-1.63.771-1.63 1.562V12h2.773l-.443 2.89h-2.33v6.988C18.343 21.128 22 16.991 22 12z"
                                clip-rule="evenodd"
                            ></path>
                        </svg>
                    </a>
                    <!-- Repeat for other social media icons -->
                </div>
            </div>
        </footer>
    </div>
</template>

<script setup>
import { format } from "date-fns";
import { onMounted } from "vue";
</script>

<style scoped>
/* Add any additional styling here */
</style>
