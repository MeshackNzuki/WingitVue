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
                        class="btn btn-sm bg-base shadow-gray-900 shadow-md text-gray-50 font-thin border-0 hover:text-black"
                        @click="searchFlights"
                    >
                        Search Now
                    </button>
                    <router-link to="/listed-flights">
                        <button
                            class="btn btn-sm bg-base shadow-gray-900 shadow-md text-gray-50 font-thin border-0 hover:text-black"
                        >
                            Go To Flights
                        </button>
                    </router-link>
                </div>

                <div class="mx-auto p-2 md:p-8">
                    <div
                        class="grid grid-cols-1 gap-6 md:grid-cols-2 lg:grid-cols-3"
                    >
                        <!-- Flight Card Content -->
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
