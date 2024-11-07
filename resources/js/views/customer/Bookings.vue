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
            <tr v-for="(bookingItem, index) in booking" :key="index">
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
                    {{ bookingItem.flight.destination_airport?.name }}
                </td>
                <td
                    class="border-t-0 px-2 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 items-center"
                >
                    {{
                        format(
                            new Date(bookingItem.flight.depart_time),
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
                            bookingItem.booking_status == 1 &&
                            isBefore(
                                new Date(bookingItem.flight.depart_time),
                                subHours(new Date(), 2),
                            ) &&
                            bookingItem.flight.available_seats > 0
                                ? "Completed"
                                : "Incomplete"
                        }}
                    </span>
                    <button
                        class="bg-emerald-500 rounded-md p-1 shadow-sm mx-2 text-white"
                        v-if="
                            bookingItem.booking_status === 0 &&
                            isBefore(
                                subHours(new Date(), 2),
                                new Date(bookingItem.flight.depart_time),
                            ) &&
                            bookingItem.flight.available_seats > 0
                        "
                        @click="showModal(bookingItem.id)"
                    >
                        <i class="pi pi-refresh"></i>Repay
                    </button>
                </td>
                <dialog :id="bookingItem.id" class="modal">
                    <div class="modal-box">
                        <form method="dialog">
                            <button
                                class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2"
                            >
                                ✕
                            </button>
                        </form>
                        <h3 class="text-lg font-bold">Hello!</h3>
                        <span class="w-full text-center font-bold"
                            >Retry payment
                            {{ bookingItem.flight.flight_no }}
                        </span>
                        <div class="flex justify-center items-center">
                            <div class="flex flex-col my-4">
                                Retrying payment of
                                {{
                                    bookingItem.flight.price * bookingItem.seats
                                }}
                                on flight {{ bookingItem.flight.flight_no }} {
                                {{ bookingItem.flight.origin_airport?.name }} -
                                {{
                                    bookingItem.flight.destination_airport
                                        ?.name
                                }}}
                            </div>
                            <div class="flex flex-col md:flex-row md:gap-4">
                                <div></div>
                            </div>
                        </div>

                        <div
                            class="modal-action flex justify-center items-center"
                        >
                            <form method="dialog">
                                <input
                                    type="mobile"
                                    class="input"
                                    v-model="mpesa_phone"
                                />
                                <button
                                    type="submit"
                                    @click="
                                        repayment(
                                            bookingItem.flight.price *
                                                bookingItem.seats,
                                        )
                                    "
                                    class="btn bg-emerald-400 text-white"
                                >
                                    Pay via Mpesa
                                </button>
                            </form>
                        </div>
                    </div>
                </dialog>
            </tr>
        </template>
    </MainTable>
</template>

<script setup>
import { ref, onMounted } from "vue";
import { format, isBefore, subHours } from "date-fns";
import axios from "axios";

import MainTable from "../../components/Tables/MainTable.vue";
import { authStore } from "../../stores/authStore";

const { user } = authStore();
const booking = ref([]);
const mpesa_phone = ref(user.phone);
const searchQuery = ref("");

const getBookings = async () => {
    const res = await axios.get("/client-booking");
    booking.value = res.data;
};
const showModal = (modalId) => {
    document.getElementById(modalId).showModal();
};

const repayment = async (amount) => {
    const res = await axios.post(
        "initiate-mpesa",
        {
            phone: mpesa_phone.value,
            amount: amount,
        },
        { showLoader: true },
    );
    if (paymentResponse.data.code === "success") {
        // Proceed with booking
        Swal.fire({
            text: "Once your payment is processed, you'll receive an email with your ticket details. Thank you for choosing Wingit!",
            icon: "success",
        });
    } else {
        toast.error("Please confirm Mpesa number before retrying.");
    }
};

onMounted(() => {
    getBookings();
});
</script>

<style scoped>
/* Add any scoped styles here */
</style>
