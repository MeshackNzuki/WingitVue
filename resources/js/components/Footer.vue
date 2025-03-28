<template>
    <div class="bg-base">
        <footer class="max-w-screen-xl mx-auto py-4 bg-base px-2 lg:px-12">
            <div class="md:flex md:justify-between">
                <div class="mb-6 md:mb-0">
                    <router-link to="#" class="flex items-center">
                        <img src="@/assets/logo.svg" width="100" height="100" class="mr-4 h-6 md:h-6"
                            alt="Wingit Logo" />
                    </router-link>
                </div>
                <div class="grid grid-cols-2 gap-8 sm:gap-6 sm:grid-cols-3">
                    <div>
                        <h3 class="mb-6 text-sm font-semibold text-gold uppercase">
                            Company
                        </h3>
                        <ul>
                            <li class="mb-2">
                                <router-link to="/about" class="text-slate-50 hover:underline font-light">
                                    About us
                                </router-link>
                            </li>
                            <li class="mb-2">
                                <router-link to="/principle" rel="nofollow"
                                    class="text-slate-50 hover:underline font-light">
                                    How it works
                                </router-link>
                            </li>
                            <li class="mb-2">
                                <router-link to="/help" rel="nofollow" class="text-slate-50 hover:underline font-light">
                                    Contact us
                                </router-link>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <h3 class="mb-6 text-sm font-semibold text-gold uppercase">
                            Travel
                        </h3>
                        <ul>
                            <li class="mb-2">
                                <router-link to="/search-flight" class="text-slate-50 hover:underline font-light">
                                    Airports
                                </router-link>
                            </li>
                            <li class="mb-2">
                                <router-link to="/search-flight" class="text-slate-50 hover:underline font-light">
                                    Cities
                                </router-link>
                            </li>
                            <li class="mb-2">
                                <router-link to="/search-flight" class="text-slate-50 hover:underline font-light">
                                    Parks
                                </router-link>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <h3 class="mb-6 text-sm font-semibold text-gold uppercase">
                            Legal
                        </h3>
                        <ul>
                            <li class="mb-4">
                                <router-link to="/privacy" class="text-slate-50 hover:underline font-light">
                                    Privacy Policy
                                </router-link>
                            </li>
                            <li>
                                <router-link to="/terms" class="text-slate-50 hover:underline font-light">
                                    Terms &amp; Conditions
                                </router-link>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- <div
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
            </div> -->
            <section class="flex justify-center mt-12">
                <div class="p-4 w-full max-w-screen-md mb-12 pb-6 text-white">
                    <h2 class=" mb-6 text-center text-white">Need assistance in booking?</h2>
                    <div
                        class="flex flex-col md:flex-row md:space-x-8 space-y-4 md:space-y-0 justify-center transition-all duration-300">
                        <div class="flex items-center hover:scale-105">
                            <i class="pi pi-phone text-xl mr-4"></i>
                            <a :href="`tel:${phone}`" class="  hover:text-sky-500">{{ phone
                            }}</a>
                        </div>
                        <div class="flex items-center hover:scale-105">
                            <i class="pi pi-whatsapp  text-green-500 mr-4"></i>
                            <a :href="`https://wa.me/${phone}`" class="  hover:text-green-500">WhatsApp</a>
                        </div>
                        <div class="flex items-center hover:scale-105">
                            <i class="pi pi-instagram text-xl text-pink-500 mr-4"></i>
                            <a href="https://www.instagram.com/yourprofile" class=" hover:text-pink-500">Instagram</a>
                        </div>
                        <div class="flex items-center hover:scale-105">
                            <i class="pi pi-facebook text-xl text-sky-500 mr-4"></i>
                            <a href="https://www.instagram.com/yourprofile" class="  hover:text-sky-500">Facebook</a>
                        </div>
                    </div>
                </div>
            </section>
            <hr class="my-6 border-gray-200 sm:mx-auto lg:my-8" />
            <div class="sm:flex sm:items-center sm:justify-between">
                <span class="text-sm text-slate-50 sm:text-center">
                    © {{ format(new Date(), "y") }}
                    <a href="#" class="hover:underline">Wingit™</a>
                </span>
                <div class="flex mt-4 space-x-6 sm:justify-center sm:mt-0">
                    <a href="#" class="text-slate-50 hover:text-slate-50">

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

const phone = "+254725633577";

</script>

<style scoped>
/* Add any additional styling here */
</style>
