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
                        v-if="mainStore.flights.length > 0"
                        class="flex flex-col md:grid grid-cols-3 gap-4"
                    >
                        <div v-for="(flight, index) in mainStore.flights">
                            <div
                                class="relative hover:scale-105 transition-all duration-300 transition-timing-function-cubic-bezier-0.7 rounded-lg shadow-md m-2 from-cyan-50 via-purple-50 to-rose-100 bg-gradient-to-tl bg-cover backdrop-blur-md bg-opacity-25 max-w-lg"
                            >
                                <div
                                    class="absolute flex justify-center m-auto h-1/3 w-1/2 mr-0 bottom-0 bg-transparent"
                                >
                                    <div
                                        class="absolute left-0 top-1/3 bg-gold rounded-bl-lg rounded-tr-lg rounded-br-lg px-2 -ml-1 shadow-lg"
                                    >
                                        <p class="font-bold">
                                            <i
                                                class="pi pi-map-marker me-1 text-sm"
                                            ></i>
                                            <span class="text-xs">{{
                                                flight.destination_airport?.city?.toUpperCase()
                                            }}</span>
                                            <br />
                                            <span class="text-sm">
                                                <i
                                                    class="pi pi-info-circle w-4 mr-2 text-base"
                                                ></i>
                                                <small>
                                                    <template
                                                        v-if="
                                                            flight.has_offer ==
                                                            1
                                                        "
                                                    >
                                                        {{
                                                            calculateDiscount(
                                                                flight.price,
                                                                flight.offer_price,
                                                            )
                                                        }}% Off
                                                    </template>
                                                    <template v-else>
                                                        Best Price
                                                    </template>
                                                </small>
                                            </span>
                                        </p>
                                    </div>
                                </div>
                                <div>
                                    <div
                                        class="grid grid-cols-2 grid-flow-col gap-4 shadow-sm"
                                    >
                                        <div class="flex justify-center p-1">
                                            <span
                                                class="bg-cyan-100 text-sm rounded-lg p-1 px-2 flex flex-row text-gray-900"
                                            >
                                                <i
                                                    class="pi pi-calendar w-5 h-5"
                                                ></i>
                                                {{
                                                    format(
                                                        new Date(
                                                            flight.depart_time,
                                                        ),
                                                        "EEE d, M, y ",
                                                    )
                                                }}
                                            </span>
                                        </div>
                                        <div class="flex justify-center p-1">
                                            <span
                                                class="bg-cyan-100 text-sm rounded-lg p-1 px-2 flex flex-row text-gray-900"
                                            >
                                                <i
                                                    class="pi pi-ticket w-5 h-5"
                                                ></i>
                                                <span class="me-1">{{
                                                    flight.available_seats
                                                }}</span>
                                                <span>{{
                                                    flight.available_seats > 1
                                                        ? "seats"
                                                        : "seat"
                                                }}</span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="px-6">
                                    <div>
                                        <table class="w-full">
                                            <tr>
                                                <td class="text-left">
                                                    <small>
                                                        {{
                                                            format(
                                                                new Date(
                                                                    flight.depart_time,
                                                                ),
                                                                "h:mm a",
                                                            )
                                                        }}</small
                                                    >
                                                </td>
                                                <td></td>
                                                <td>
                                                    <small>{{
                                                        format(
                                                            new Date(
                                                                flight.arrival_time,
                                                            ),
                                                            "h:mm a",
                                                        )
                                                    }}</small>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-left">
                                                    <span
                                                        class="font-semibold uppercase text-xs relative overflow-hidden"
                                                    >
                                                        {{
                                                            flight.origin_airport?.name.split(
                                                                " ",
                                                            )[0]
                                                        }}
                                                    </span>
                                                </td>
                                                <td
                                                    class="flex justify-center flex-row pt-1.5"
                                                >
                                                    <div
                                                        class="flex justify-center items-center p-1 relative"
                                                    >
                                                        <div
                                                            class="h-1 w-6 sm:w-8 border-dashed border-base border-t-2 relative"
                                                        >
                                                            <div
                                                                class="w-2.5 h-2.5 bg-base rounded-full absolute -left-5 -top-1.5 transform translate-x-1/2"
                                                            ></div>
                                                        </div>
                                                    </div>
                                                    <span
                                                        class="h-4 w-4 rounded-full bg-base flex justify-center items-center"
                                                    >
                                                        <i
                                                            class="pi pi-send text-gray-50 h-2.5 w-2.5"
                                                        ></i>
                                                    </span>
                                                    <div
                                                        class="flex justify-center items-center p-1 relative"
                                                    >
                                                        <div
                                                            class="h-1 w-6 sm:w-8 border-dashed border-base border-t-2 relative"
                                                        >
                                                            <div
                                                                class="w-2.5 h-2.5 bg-base rounded-full absolute -right-1/3 -top-1.5 transform translate-x-1/2"
                                                            ></div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="text-right">
                                                    <span
                                                        class="font-semibold uppercase text-xs relative overflow-hidden"
                                                    >
                                                        {{
                                                            flight.destination_airport?.name.split(
                                                                " ",
                                                            )[0]
                                                        }}
                                                    </span>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="text-left">
                                        <span
                                            class="text-sm font-light text-left"
                                        >
                                            {{
                                                flight.aircraft_operator
                                                    ?.company_name
                                            }}
                                        </span>
                                    </div>
                                    <div class="w-full text-center">
                                        <span
                                            v-if="flight.has_offer == 1"
                                            class="text-sm font-normal text-center line-through text-red-500 bg-red-50 p-1 rounded-full"
                                        >
                                            KES
                                            {{ formatCurrency(flight.price) }}
                                        </span>
                                        <span
                                            class="text-sm font-normal text-center m-2 bg-cyan-100 px-2 py-1 rounded-full"
                                        >
                                            KES
                                            {{
                                                flight.has_offer == 1
                                                    ? formatCurrency(
                                                          flight.offer_price,
                                                      )
                                                    : formatCurrency(
                                                          flight.price,
                                                      )
                                            }}.
                                        </span>
                                    </div>
                                    <div class="text-right mt-3">
                                        <div class="flex justify-end mb-1">
                                            <div
                                                class="text-second flex justify-center space-x-2 px-4"
                                            >
                                                <button
                                                    @click="
                                                        mainStore.decreaseSeats(
                                                            flight.id,
                                                        )
                                                    "
                                                    class="mb-2 text-gray-900 hover:scale-105 p-2 h-6 w-6 flex justify-center items-center transition duration-250 rounded-full bg-gray-300 shadow-md mt-1"
                                                >
                                                    <i class="pi pi-minus"></i>
                                                </button>
                                                <span
                                                    class="bg-base p-2 w-8 flex justify-center items-center h-8 mb-2 text-gray-50 rounded-full font-light"
                                                >
                                                    {{
                                                        flight.seats <=
                                                        flight.available_seats
                                                            ? flight.seats
                                                            : "Add"
                                                    }}
                                                </span>
                                                <button
                                                    @click="
                                                        mainStore.increaseSeats(
                                                            flight.id,
                                                            flight.available_seats,
                                                        )
                                                    "
                                                    class="mb-2 text-gray-900 hover:scale-105 p-2 h-6 w-6 flex justify-center items-center transition duration-250 rounded-full bg-gray-300 shadow-md mt-1"
                                                >
                                                    <i class="pi pi-plus"></i>
                                                </button>
                                                <label
                                                    for="Category"
                                                    class="block mb-2 text-md text-gray-800"
                                                >
                                                    Seats
                                                </label>
                                            </div>
                                        </div>
                                        <button
                                            @click="
                                                mainStore.bookFlight(flight.id)
                                            "
                                            class="flex-no-shrink bg-gradient-to-tr from-teal-600 via-base to-base hover:scale-110 px-5 ml-4 py-2 mb-2 text-sm shadow-sm hover:shadow-lg tracking-wider text-gray-50 font-light rounded-full transition ease-in duration-200"
                                        >
                                            {{
                                                mainStore.loading
                                                    ? "Please wait..."
                                                    : " Book Now"
                                            }}
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
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
import { format } from "date-fns";

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

const formatCurrency = (price) => Number(price.split(".")[0]).toLocaleString();
onMounted(() => {
    mainStore.fetchFlights();
});

const getFlights = async () => {
    const flights = await mainStore.fetchFlights();
    searchResults.value = flights;
};

onMounted(() => {
    getFlights();
});
</script>
