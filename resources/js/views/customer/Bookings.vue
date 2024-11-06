<template>

                <MainTable
                    :headers="[
                        'BOOKING DATE',
                        'FLIGHT NO.',
                        'BOOKING REFERENCE',
                        'FROM',
                        'TO',
                        'DEPART TIME',
                        'SEATS',
                        'STATUS',
                    ]"
                    title="Booking"
                    v-model:query="searchQuery"
                    :rows="booking"
                >
                    <template v-slot:content>
                        <tr
                            v-for="(bookingItem, index) in booking"
                            :key="index"
                        >
                            <td
                                class="border-t-0 px-2 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 items-center"
                            >
                                {{
                                    format(
                                        new Date(bookingItem.created_at),
                                        "EE do HH:mm, Y",
                                    )
                                }}
                            </td>
                            <td
                                class="border-t-0 px-2 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 items-center"
                            >
                                {{ bookingItem.flight.flight_no }}
                            </td>
                            <td
                                class="border-t-0 px-2 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 items-center"
                            >
                                {{ bookingItem.reference_no }}
                            </td>
                            <td
                                class="border-t-0 px-2 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 items-center"
                            >
                                {{ bookingItem.flight.origin_airport?.name }}
                            </td>
                            <td
                                class="border-t-0 px-2 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 items-center"
                            >
                                {{
                                    bookingItem.flight.destination_airport?.name
                                }}
                            </td>
                            <td
                                class="border-t-0 px-2 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 items-center"
                            >
                                {{
                                    format(
                                        new Date(
                                            bookingItem.flight.depart_time,
                                        ),
                                        "EEEE do HH:mm",
                                    )
                                }}
                            </td>
                            <td
                                class="border-t-0 px-2 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 items-center"
                            >
                                {{ bookingItem.seats }}
                            </td>
                            <td
                                class="border-t-0 px-2 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 items-center"
                            >
                                <span
                                    :class="
                                        bookingItem.booking_status == 1
                                            ? 'bg-green-500'
                                            : 'bg-red-500' +
                                              ' text-white rounded-md p-1 shadow-sm'
                                    "
                                >
                                    {{
                                        bookingItem.booking_status == 1
                                            ? "Completed"
                                            : "Incomplete"
                                    }}
                                </span>
                            </td>
                        </tr>
                    </template>
                </MainTable>
   
</template>

<script setup>
import { ref, onMounted } from "vue";
import { format } from "date-fns";
import axios from "axios";
import MainTable from "../../components/Tables/MainTable.vue";

    const booking = ref([]);
    const searchQuery = ref("");

    const getBookings = async () => {
        const res = await axios.get("/client-booking");
        booking.value = res.data;
    };

    onMounted(() => {
        getBookings();
    });

   
</script>

<style scoped>
/* Add any scoped styles here */
</style>
