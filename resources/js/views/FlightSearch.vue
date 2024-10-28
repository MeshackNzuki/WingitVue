<template>
    <div>
        <div
            class="w-full p-2 bg-[url('../assets/searchpg.jpg')] bg-cover object-cover min-h-screen flex justify-center"
        >
            <div class="md:mx-16 flex flex-col justify-center max-w-screen-xl">
                <div class="rounded text-gray-50 text-3xl font-bold mb-16">
                    <span class="font-exo2">Search for a flight</span>
                </div>

                <div
                    class="flex flex-col md:flex-row justify-center space-x-0 lg:space-x-2 space-y-2 lg:space-y-0 w-full text-gray-50"
                >
                    <div class="rounded text-sm flex flex-col justify-start">
                        <label for="passengers">Passengers </label>
                        <input
                            type="number"
                            v-model="seats"
                            placeholder="Type here..."
                            class="input input-sm p-5 text-gray-700"
                        />
                    </div>
                    <div class="rounded text-sm flex flex-col justify-start">
                        <label for="startDate">Date </label>
                        <input
                            type="date"
                            v-model="startDate"
                            @change="setStartDate"
                            class="input input-sm p-5 text-gray-700"
                        />
                    </div>
                    <div class="flex rounded text-sm flex-col justify-start">
                        <label for="origin">Origin </label>
                        <Select
                            :options="airportOptions"
                            id="origin"
                            isSearchable
                            placeholder="Start typing..."
                            noOptionsMessage="No Match"
                            @change="setOrigin"
                            class="text-base pl-10 pr-4 py-1 bg-white rounded-lg min-w-[250px] text-gray-800 text-sm"
                        />
                    </div>
                    <div class="flex rounded text-sm flex-col justify-start">
                        <label for="destination">Destination </label>
                        <Select
                            :options="airportOptions"
                            id="destination"
                            isSearchable
                            placeholder="Start typing..."
                            noOptionsMessage="No Match"
                            @change="setDestination"
                            class="text-base pl-10 pr-4 py-1 bg-white rounded-lg min-w-[250px] text-gray-800 text-sm"
                        />
                    </div>
                </div>

                <div class="flex justify-center mt-8 space-x-4">
                    <button
                        class="btn btn-sm bg-base shadow-gray-900 shadow-md text-gray-50 font-light border-0 hover:text-black"
                        @click="searchFlights"
                    >
                        Search Now
                    </button>
                    <router-link to="/listed-flights">
                        <button
                            class="btn btn-sm bg-base shadow-gray-900 shadow-md text-gray-50 font-light border-0 hover:text-black"
                        >
                            Go To Flights
                        </button>
                    </router-link>
                </div>

                <div class="w-full mt-8 flex justify-center">
                    <div
                        v-if="mainStore.flights.length > 0"
                        class="flex flex-col grid grid-cols-3 gap-4"
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
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import "vue-select/dist/vue-select.css";
import Select from "vue-select";
import axios from "axios";

const seats = ref(1);
const startDate = ref(null);
const airportOptions = ref([]);

function setStartDate(event) {
    startDate.value = new Date(event.target.value).getTime();
}

function setOrigin(option) {
    origin.value = option.value;
}

function setDestination(option) {
    destination.value = option.value;
}

function searchFlights() {
    // Search flights logic here
}
const getOptions = async () => {
    const res = await axios.get("airports");
    const data = res.data;
    const options = data.map((d) => ({
        value: d.id,
        label: d.name,
        //label: d.name + ", " + d.town + ", " + d.city,
    }));
    airportOptions.value = options;
};
onMounted(() => {
    getOptions();
});
</script>

<style>
.vs__dropdown-toggle {
    border: none;
}
</style>
