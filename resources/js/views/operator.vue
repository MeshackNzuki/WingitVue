<template>
    <div
        class="flex flex-col justify-center items-center min-h-screen pt-24 lg:pt-0 bg-[url('../assets/searchpg.jpg')]">
        <div div v-motion="motionPresets.fadeDown()"
            class="text-2xl  font-serif mb-10 text-slate-50 p-2 rounded-sm shadow-sm">
            OPERATOR ACCOUNTS
        </div>
        <div class="flex flex-col md:flex-row gap-10">
            <div v-motion="motionPresets.fadeLeft()"
                class="flex flex-col gap-3 shadow-sm rounded p-6 bg-blue-50 bg-opacity-15 hover:scale-105 transition-all duration-300 max-w-[600px]">
                <h4 class="font-bold mb-4 text-center text-white">Aircraft Operators</h4>
                <div class="text-center flex flex-col">
                    <!-- <span class="text-ceter">
                        Create an Aircraft Operator account to manage flight
                        schedules, track maintenance, and streamline
                        communication with regulatory bodies. Ideal for
                        businesses in aviation management or private charter
                        services.
                    </span> -->
                    <router-link to="/aircraft-operator-register">
                        <CommonButton buttonText="Create Now" class="mt-4" />
                    </router-link>
                </div>
            </div>
            <div v-motion="motionPresets.fadeRight()"
                class="flex flex-col gap-3 shadow-sm rounded p-6 bg-gradient-to-br bg-blue-50 bg-opacity-15 hover:scale-105 transition-all duration-300 max-w-[600px]">
                <h4 class="font-bold mb-4 text-center text-white">Tourism Operators</h4>
                <div class="text-center flex flex-col">
                    <!-- <span>
                        Register as a Tourism Operator to manage tour packages,
                        track bookings, and offer personalized experiences for
                        travelers that choose you. Ideal for tour companies,
                        travel agencies, or event organizers in the tourism
                        industry.
                    </span> -->
                    <router-link to="/tourism-operator-register">
                        <CommonButton buttonText="Create Now" class="mt-4" />
                    </router-link>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>

import { inject } from "vue";
import CommonButton from "../components/Buttons/CommonButton.vue";

const motionPresets = inject("motionPresets")

</script>
