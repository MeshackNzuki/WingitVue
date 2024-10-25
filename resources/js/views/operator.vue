<template>
    <div
        class="flex flex-col justify-center items-center min-h-screen pt-24 lg:pt-0"
    >
        <h5 class="font-bold mb-10">Operator Accounts</h5>
        <div class="flex flex-col md:flex-row gap-10">
            <div
                class="flex flex-col gap-3 shadow-sm rounded p-6 bg-gradient-to-br from-gray-50 to-slate-100 hover:scale-105 transition-all duration-300 max-w-[600px]"
            >
                <h4 class="font-bold mb-4 text-center">Aircraft Operators</h4>
                <div class="text-center flex flex-col">
                    <span class="text-ceter">
                        Create an Aircraft Operator account to manage flight
                        schedules, track maintenance, and streamline
                        communication with regulatory bodies. Ideal for
                        businesses in aviation management or private charter
                        services.
                    </span>
                    <router-link to="/aircraft-operator-register">
                        <CommonButton buttonText="Create Now" class="mt-4" />
                    </router-link>
                </div>
            </div>
            <div
                class="flex flex-col gap-3 shadow-sm rounded p-6 bg-gradient-to-br from-gray-50 to-slate-100 hover:scale-105 transition-all duration-300 max-w-[600px]"
            >
                <h4 class="font-bold mb-4 text-center">Tourism Operators</h4>
                <div class="text-center flex flex-col">
                    <span>
                        Register as a Tourism Operator to manage tour packages,
                        track bookings, and offer personalized experiences for
                        travelers that choose you. Ideal for tour companies,
                        travel agencies, or event organizers in the tourism
                        industry.
                    </span>
                    <router-link to="/tourism-operator-register">
                        <CommonButton buttonText="Create Now" class="mt-4" />
                    </router-link>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import CommonButton from "../components/Buttons/CommonButton.vue";
</script>
