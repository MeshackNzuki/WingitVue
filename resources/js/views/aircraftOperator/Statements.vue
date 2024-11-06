<template>
    <div class="h-full">
        <div class="relative flex flex-wrap mt-10 rounded-lg">
            <div class="w-full mb-12 px-4">
                <Table
                    :headers="[
                        'FLIGHT NUMBER',
                        'FLIGHT DATE',
                        'PAYOUT DATE',
                        'PROFIT',
                        'STATUS',
                    ]"
                    title="Statements"
                    v-model:query="query"
                    :rows="filteredFlights.length"
                >
                    <template v-slot:search>
                        <input
                            class="h-6 md:block bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-60 pl-10"
                            placeholder="Search flights"
                            @input="filterFlights"
                        />
                    </template>
                    <template v-slot:content>
                        <tr
                            v-for="(flight, index) in filteredFlights"
                            :key="index"
                        >
                            <td
                                class="border-t-0 px-2 align-middle border-l-0 border-r-0 whitespace-nowrap p-4 items-center"
                            >
                                {{ flight.origin_airport.name }}
                            </td>

                            <td
                                class="border-t-0 px-2 align-middle border-l-0 border-r-0 whitespace-nowrap p-4 items-center"
                            >
                                {{ formatFlightTime(flight.depart_time) }}
                            </td>
                            <td
                                class="border-t-0 px-2 align-middle border-l-0 border-r-0 whitespace-nowrap p-4 items-center"
                            >
                                {{ formatFlightTime(flight.arrival_time) }}
                            </td>
                            <td
                                class="border-t-0 px-2 align-middle border-l-0 border-r-0 whitespace-nowrap p-4 items-center"
                            >
                                {{ flight.price }}
                            </td>
                            <td
                                class="border-t-0 px-2 align-middle border-l-0 border-r-0 whitespace-nowrap p-4 items-center"
                            >
                                {{ flight.initial_seats }}
                            </td>
                            <td
                                class="border-t-0 px-2 align-middle border-l-0 border-r-0 whitespace-nowrap p-4 items-center"
                            >
                                {{
                                    flight.initial_seats -
                                    flight.available_seats
                                }}
                            </td>
                            <td
                                class="border-t-0 px-2 align-middle border-l-0 border-r-0 whitespace-nowrap p-4 items-center"
                            >
                                {{ flight.available_seats }}
                            </td>
                        </tr>
                    </template>
                </Table>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref, onMounted, computed } from "vue";
import axios from "axios";
import Table from "../../components/Tables/MainTable.vue";
import { format } from "date-fns";

const flights = ref([]);
const query = ref("");

const filteredFlights = computed(() => {
    if (!query.value) return flights.value;
    return flights.value.filter((flight) => {
        return (
            flight.origin_airport.name
                .toLowerCase()
                .includes(query.value.toLowerCase()) ||
            flight.destination_airport.name
                .toLowerCase()
                .includes(query.value.toLowerCase())
        );
    });
});

const getFlights = async () => {
    try {
        const res = await axios.get("flights-listed/empty_param");
        flights.value = res.data;
    } catch (error) {
        console.error("Failed to fetch flights:", error);
    }
};

const formatFlightTime = (time) => {
    return format(new Date(time), "EEEE do HH:mm");
};

// Fetch flights when component is mounted
onMounted(() => {
    getFlights();
});
</script>

<style scoped>
/* Add any necessary styles here */
</style>
