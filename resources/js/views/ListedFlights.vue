<template>
    <div>
        <div class="w-full p-2 bg-gray-200 min-h-screen">
            <div class="mt-16">
                <div
                    class="w-full flex justify-center space-x-2 md:space-x-10 px-2"
                >
                    <label class="cursor-pointer label">
                        <span class="label-text">Shuffle</span>
                        <input
                            type="checkbox"
                            class="ml-2 toggle toggle-base"
                            @change="sortFlights"
                        />
                    </label>
                    <label class="cursor-pointer label">
                        <span class="label-text">Sort by price</span>
                        <input
                            type="checkbox"
                            class="ml-2 toggle toggle-base"
                            @change="sortFlightsPrice"
                        />
                    </label>
                    <router-link
                        to="/search-flight"
                        class="mt-2.5 flex flex-row"
                    >
                        <i class="pi pi-search text-gray-700 text-2xl"></i>
                        <span class="w-4 ml-1 label-text hidden lg:block"
                            >Search</span
                        >
                    </router-link>
                </div>

                <div class="w-full mt-8 flex justify-center">
                    <div
                        class="flex flex-wrap w-full justify-center max-w-screen-2xl gap-4"
                    >
                        flight cards
                    </div>
                </div>

                <hr class="my-10 bg-base h-0.5" />

                <div
                    class="relative flex flex-col items-center justify-center overflow-hidden p-4 sm:p-4"
                >
                    <div
                        class="w-full max-w-4xl rounded-md border-2 bg-gray-100 p-2"
                    >
                        <div class="flex flex-col items-center">
                            <span
                                class="rounded-lg bg-cyan-100 py-px px-2 text-sm text-yellow-800"
                            >
                                Experience seamless convenience from your
                                comfort
                            </span>
                            <h3
                                class="mt-2 mb-2 max-w-2xl text-center text-md font-light md:leading-tight"
                            >
                                Want to be notified when your route is
                                available? Then join this newsletter
                            </h3>
                            <form
                                class="mx-auto mt-4 flex w-full max-w-md flex-col gap-2 sm:flex-row sm:gap-0"
                                @submit.prevent="handleSubscribe"
                            >
                                <div class="flex justify-center space-x-2">
                                    <input
                                        type="text"
                                        name="destination"
                                        id="destination"
                                        class="grow w-full rounded-lg border border-base px-3 focus:border-emerald-500 focus:outline-none sm:rounded-l-md"
                                        placeholder="Destination"
                                        required
                                    />
                                    <input
                                        type="email"
                                        name="email"
                                        id="email"
                                        class="grow w-full rounded-lg border border-base px-3 focus:border-emerald-500 focus:outline-none sm:rounded-l-md"
                                        placeholder="Email Address"
                                        required
                                    />
                                </div>
                                <BaseButton
                                    action="handleSubscribe"
                                    label="Subscribe"
                                />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script setup>
import { ref, onMounted } from "vue";
import { useRouter } from "vue-router";
import { useMainStore } from "../stores";
import { toast } from "vue3-toastify";
import BaseButton from "../components/Buttons/BaseButton.vue";

// Local state

const searchResults = ref([]);

const rerender = ref(false);

const mainStore = useMainStore(); // Pinia store for flight data

// Functions
const sortFlights = () => {
    const shuffledResults = [...searchResults.value];
    for (let i = shuffledResults.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [shuffledResults[i], shuffledResults[j]] = [
            shuffledResults[j],
            shuffledResults[i],
        ];
    }
    searchResults.value = shuffledResults;
    rerender.value = !rerender.value;
};

const sortFlightsPrice = () => {
    searchResults.value = [...searchResults.value].sort(
        (a, b) => a.price - b.price,
    );
    rerender.value = !rerender.value;
};

const handleSubscribe = (e) => {
    e.preventDefault();
    toast.add({
        severity: "info",
        summary: "Subscribed",
        detail: "You will now receive updates on your destination",
        life: 3000,
    });
};

const getFlights = async () => {
    const flights = await mainStore.fetchFlights();
    searchResults.value = flights;
};

onMounted(() => {
    getFlights();
});
</script>
