<template>
    <div>
        <div class="w-full p-2 bg-gray-200 min-h-screen bg-[url('../assets/bg.jpg')]">
            <div class="mt-16">
                <div class="w-full flex justify-center space-x-2 md:space-x-10 px-2 ">
                    <!-- <label class="cursor-pointer label hover:scale-105 transition-all duration-300">
                        <span class="label-text">Shuffle</span>
                        <input type="checkbox" class="ml-2 toggle toggle-base" @change="sortFlights" />
                    </label> -->
                    <label class="cursor-pointer label hover:scale-105 transition-all duration-300">
                        <span class="label-text">Sort By Price</span>
                        <input type="checkbox" class="ml-2 toggle toggle-base" @change="sortFlightsPrice" />
                    </label>
                    <label class="cursor-pointer label">
                        <span
                            class="label-text badge bg-base p-3 shadow-md text-white hover:scale-105 transition-all duration-300"
                            @click="resetFlights">Reset</span>

                    </label>
                    <router-link to="/flight-search"
                        class="mt-2.5 flex flex-row hover:scale-105 transition-all duration-300">
                        <i class="pi pi-search  text-2xl"></i>
                        <span class="w-4 ml-1 label-text hidden lg:block">Search</span>
                    </router-link>
                </div>


                <div v-if="mainStore.flights.length > 0"
                    class="flex flex-col md:grid grid-cols-3 gap-4  max-w-screen-2xl mt-16 m-auto">
                    <div v-for="(flight, index) in flights" v-motion="motionPresets.fadeUp(Math.random() * 150)">
                        <div
                            class="max-w-sm mx-auto from-cyan-50 via-purple-50 to-rose-100 bg-gradient-to-tl shadow-lg rounded-lg relative">
                            <div class="flex items-center justify-between  px-6 py-0.5">
                                <div class="text-lg font-bold">
                                    {{
                                        flight.aircraft_operator
                                            ?.company_name
                                    }}
                                </div>
                                <router-link>
                                    <div v-if="
                                        flight.aircraft_operator?.logo
                                    " class="avatar pointer">
                                        <div class="size-8 rounded-full ring ring-third">
                                            <img :src="`https://api.wingit.co.ke/core/storage/app/public/uploads/avatars/${flight.aircraft_operator?.logo}`"
                                                alt="User Avatar" />
                                        </div>
                                    </div>
                                    <div v-else class="relative overflow-hidden bg-gold rounded-full gray-600">
                                        <div class="size-10 rounded-full ring ring-third">
                                            <img src="../assets/logo.png" alt="User Avatar" />
                                        </div>
                                    </div>
                                </router-link>
                            </div>

                            <!-- <div
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
                                        </p>
                                    </div> -->

                            <div>
                                <div class="flex w-full justify-between">
                                    <div class="flex justify-center p-1">
                                        <span
                                            class="bg-cyan-100 text-sm rounded-lg p-1 px-2 flex flex-row text-gray-900">
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
                                    <span class="font-semibold text-xs mt-4">FLIGHT:{{ flight.flight_no }}</span>
                                    <div class="flex justify-center p-1">
                                        <span
                                            class="bg-cyan-100 text-sm rounded-lg p-1 px-2 flex flex-row text-gray-900">
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
                                                    }}</small>
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
                                                <span class="font-semibold uppercase text-xs relative overflow-hidden">
                                                    {{
                                                        flight.origin_airport?.name.split(
                                                            " ",
                                                        )[0]
                                                    }}
                                                </span>
                                            </td>
                                            <td class="flex justify-center flex-row pt-1.5">
                                                <div class="flex justify-center items-center p-1 relative">
                                                    <div
                                                        class="h-1 w-6 sm:w-8 border-dashed border-base border-t-2 relative">
                                                        <div
                                                            class="w-2.5 h-2.5 bg-base rounded-full absolute -left-5 -top-1.5 transform translate-x-1/2">
                                                        </div>
                                                    </div>
                                                </div>
                                                <span
                                                    class="size-5 rounded-full bg-base flex justify-center items-center">
                                                    <svg width="18px" height="18px" viewBox="0 0 24 24" version="1.1"
                                                        xmlns="http://www.w3.org/2000/svg"
                                                        xmlns:xlink="http://www.w3.org/1999/xlink" fill="#ffffff">
                                                        <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                                                        <g id="SVGRepo_tracerCarrier" stroke-linecap="round"
                                                            stroke-linejoin="round"></g>
                                                        <g id="SVGRepo_iconCarrier">
                                                            <g id="🔍-Product-Icons" stroke="none" stroke-width="1"
                                                                fill="none" fill-rule="evenodd">
                                                                <g id="ic_fluent_airplane_24_regular" fill="#ffffff"
                                                                    fill-rule="nonzero">
                                                                    <path
                                                                        d="M9.46919998,9.64319623 L8.76896994,3.76843084 L8.76710757,3.69483566 C8.76710757,2.80621457 9.48747729,2.08584485 10.3760984,2.08584485 C11.1788794,2.08584485 11.9218023,2.50550659 12.3544416,3.22025731 L12.4407989,3.38093148 L15.385665,9.46995365 L19.3428194,9.35413963 C20.7764517,9.31203281 21.9727746,10.4400871 22.0151239,11.8847274 L22.0160008,11.9499605 C22.0160008,13.3843303 20.8532144,14.5471167 19.3968974,14.5467955 L15.4327301,14.4307421 L12.4408511,20.6189605 C12.0579681,21.4109607 11.2557936,21.9141552 10.3760984,21.9141552 C9.48747729,21.9141552 8.76710757,21.1937854 8.76744131,20.2827924 L8.77394708,20.164845 L9.48082465,14.2565719 L7.3487405,14.1943124 L7.0798372,14.9299926 C6.79932412,15.6973087 6.06934989,16.2076712 5.2523667,16.2076712 C4.37643365,16.2076712 3.66634961,15.4975871 3.6663497,14.6212975 L3.66671081,13.861732 L3.51166584,13.8294555 C2.62167552,13.6436712 1.98399916,12.8591352 1.98399916,11.9499605 C1.98399916,11.0406621 2.62214845,10.2561854 3.51221687,10.0711276 L3.66671101,10.0389641 L3.66634961,9.27826691 C3.66634961,8.47624085 4.26447316,7.80342041 5.10100277,7.70020621 L5.2523667,7.69224982 C5.99730606,7.69224982 6.67523788,8.11741422 7.01683448,8.81928941 L7.07965265,8.96942416 L7.34928097,9.70533179 L9.46919998,9.64319623 Z M10.3760984,3.58584485 C10.3159044,3.58584485 10.2671076,3.6346417 10.2667738,3.67246374 L11.1531665,11.0944828 L6.31272071,11.2363579 L5.68530725,9.52108796 L5.65276359,9.44201959 C5.57839918,9.28972577 5.42297213,9.19224982 5.29886242,9.1908072 L5.24063152,9.19295861 C5.19903584,9.19816414 5.16634961,9.23493241 5.16634953,9.27791055 L5.16729071,11.2587256 L3.81774959,11.5396812 C3.62334837,11.5801 3.48399916,11.7514019 3.48399916,11.9499605 C3.48399916,12.1488457 3.62349315,12.3204658 3.81777809,12.3610227 L5.16729088,12.6419576 L5.16634961,14.6216541 C5.16634961,14.66916 5.20486077,14.7076712 5.2523667,14.7076712 C5.43953173,14.7076712 5.60676364,14.5907508 5.67101347,14.4150016 L6.31126118,12.6633773 L11.165177,12.8051178 L10.2683025,20.276313 L10.2671076,20.3051643 C10.2671076,20.3653583 10.3159044,20.4141552 10.3760984,20.4141552 C10.6804219,20.4141552 10.9579277,20.2400791 11.0903941,19.9660701 L14.5052716,12.9029476 L19.4188447,13.0471167 C20.0247873,13.0471167 20.5160817,12.5559031 20.5160817,11.960971 L20.515528,11.9177565 C20.4977422,11.3121942 19.9924188,10.8357073 19.3867788,10.8534954 L14.4583367,10.997736 L11.1066298,4.06557353 L11.0542344,3.96737821 C10.910871,3.73107325 10.6537746,3.58584485 10.3760984,3.58584485 Z"
                                                                        id="🎨-Color"></path>
                                                                </g>
                                                            </g>
                                                        </g>
                                                    </svg>
                                                </span>
                                                <div class="flex justify-center items-center p-1 relative">
                                                    <div
                                                        class="h-1 w-6 sm:w-8 border-dashed border-base border-t-2 relative">
                                                        <div
                                                            class="w-2.5 h-2.5 bg-base rounded-full absolute -right-1/3 -top-1.5 transform translate-x-1/2">
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="text-right">
                                                <span class="font-semibold uppercase text-xs relative overflow-hidden">
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

                                <div class="w-full text-center">
                                    <span v-if="flight.has_offer == 1"
                                        class="text-sm font-normal text-center line-through text-red-500 bg-red-50 p-1 rounded-full">
                                        KES
                                        {{ formatCurrency(flight.price) }}
                                    </span>
                                </div>
                                <div class="flex justify-between">
                                    <div
                                        class="text-sm font-bold text-center m-2 bg-emerald-200 px-2 py-1 h-7 rounded-full">
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
                                    </div>
                                    <div class="text-right mt-3">
                                        <div class="flex justify-end mb-1">
                                            <div class="text-second flex justify-center space-x-2 px-4">
                                                <button @click="
                                                    mainStore.decreaseSeats(
                                                        flight.id,
                                                    )
                                                    "
                                                    class="mb-2 text-gray-900 hover:scale-105 p-2 h-6 w-6 flex justify-center items-center transition duration-250 rounded-full bg-gray-300 shadow-md mt-1">
                                                    <i class="pi pi-minus"></i>
                                                </button>
                                                <span
                                                    class="bg-base p-2 w-8 flex justify-center items-center h-8 mb-2 text-gray-50 rounded-full font-light">
                                                    {{
                                                        flight.seats <= flight.available_seats ? flight.seats : "Add" }}
                                                        </span>
                                                        <button @click="
                                                            mainStore.increaseSeats(
                                                                flight.id,
                                                                flight.available_seats,
                                                            )
                                                            "
                                                            class="mb-2 text-gray-900 hover:scale-105 p-2 h-6 w-6 flex justify-center items-center transition duration-250 rounded-full bg-gray-300 shadow-md mt-1">
                                                            <i class="pi pi-plus"></i>
                                                        </button>
                                                        <label for="Category" class="block mb-2 text-md ">
                                                            Seats
                                                        </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="flex justify-between w-full items-center">
                                    <div class="text-sm flex justify-between items-center">
                                        <i class="pi pi-tags w-4 mr-1 text-red-500"></i>
                                        <small>
                                            <span v-if="flight.has_offer == 1">
                                                {{
                                                    calculateDiscount(
                                                        flight.price,
                                                        flight.offer_price,
                                                    )
                                                }}% Off
                                            </span>
                                            <span v-else> Best Price </span>
                                        </small>
                                    </div>
                                    <button @click="
                                        mainStore.bookFlight(flight.id)
                                        "
                                        class="flex-no-shrink bg-gradient-to-tr from-teal-600 via-base to-base hover:scale-110 px-5 ml-4 py-2 mb-2 text-sm shadow-sm hover:shadow-lg tracking-wider text-gray-50 font-light rounded-full transition ease-in duration-200">
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
        </div>
    </div>
</template>
<script setup>

import { ref, onMounted, inject } from "vue";
import { useRouter } from "vue-router";
import { useMainStore } from "../stores";
import { toast } from "vue3-toastify";
import BaseButton from "../components/Buttons/BaseButton.vue";
import { format } from "date-fns";

const motionPresets = inject("motionPresets");

// Local state

const flights = ref([]);

const rerender = ref(false);

const mainStore = useMainStore();

// Functions
const sortFlights = () => {
    const shuffledResults = [...flights.value];
    for (let i = shuffledResults.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [shuffledResults[i], shuffledResults[j]] = [
            shuffledResults[j],
            shuffledResults[i],
        ];
    }
    flights.value = shuffledResults;
    rerender.value = !rerender.value;
};

const sortFlightsPrice = () => {
    flights.value = [...flights.value].sort(
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
    flights.value = mainStore.flights;
});
const resetFlights = () => {

    mainStore.fetchFlights();
    flights.value = mainStore.flights;

}
</script>
