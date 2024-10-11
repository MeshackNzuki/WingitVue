<template>
    <div
        class="bg-gray-200 min-h-screen bg-[url('/pill3.jpg')] bg-cover bg-center no-repeat"
    >
        <div v-if="errors.name" class="text-red-500">{{ errors.name }}</div>
        <div v-if="errors.email" class="text-red-500">{{ errors.email }}</div>
        <div v-if="errors.phone" class="text-red-500">{{ errors.phone }}</div>
        <div v-if="errors.id_number" class="text-red-500">
            {{ errors.id_number }}
        </div>

        <form @submit.prevent="pay">
            <div>
                <label>Full Name <sup class="text-red-500">*</sup></label>
                <input
                    type="text"
                    v-model="formVals.name"
                    @input="handleFormChange"
                />
            </div>
            <div>
                <label>Email <sup class="text-red-500">*</sup></label>
                <input
                    type="email"
                    v-model="formVals.email"
                    @input="handleFormChange"
                />
            </div>
            <div>
                <label>ID/Passport <sup class="text-red-500">*</sup></label>
                <input
                    type="text"
                    v-model="formVals.id_number"
                    @input="handleFormChange"
                />
            </div>
            <div>
                <label>Nationality <sup class="text-red-500">*</sup></label>
                <CountryDropdown v-model="formVals.nationality" />
            </div>
            <div>
                <label>Phone <sup class="text-red-500">*</sup></label>
                <input
                    type="text"
                    v-model="formVals.phone"
                    @input="handleFormChange"
                />
            </div>

            <div
                v-for="(passenger, index) in passengers"
                :key="index"
                class="passenger-form"
            >
                <label class="flex h-12 py-1 md:py-3 items-center">
                    <span class="text-left px-2 w-1/3">
                        Full Name <sup class="text-red-500">*</sup>
                    </span>
                    <input
                        :id="`namePass${index}`"
                        :name="`namePass${index}`"
                        type="text"
                        class="focus:outline-none m-1 rounded-lg px-3 py-1 text-sm w-2/3 me-4"
                        placeholder="Enter Your Full Name"
                        required
                        v-model="passengerData[index].name"
                    />
                </label>

                <label class="flex h-12 py-1 md:py-3 items-center">
                    <span class="text-left px-2 w-1/3">
                        Passport/ID <sup class="text-red-500">*</sup>
                    </span>
                    <input
                        :id="`idNumber${index}`"
                        :name="`idNumber${index}`"
                        type="text"
                        class="focus:outline-none m-1 rounded-lg px-3 py-1 text-sm w-2/3 me-4"
                        placeholder="Enter ID/Passport Number"
                        required
                        v-model="passengerData[index].idNumber"
                    />
                </label>

                <label class="flex h-12 py-1 md:py-3 items-center">
                    <span class="text-left px-2 w-1/3">
                        Nationality <sup class="text-red-500">*</sup>
                    </span>
                    <span
                        class="focus:outline-none m-1 rounded-lg px-3 py-1 text-sm w-2/3 me-4 text-left"
                    >
                        <CountryDropdown
                            :id="`nationality${index}`"
                            :name="`nationality${index}`"
                            v-model="passengerData[index].nationality"
                        />
                    </span>
                </label>

                <hr
                    v-if="flightStore.totalSeats > 2"
                    class="bg-gray-600 h-0.5"
                />
            </div>
            <BaseButton label="Pay Now" type="submit" />
        </form>
    </div>
</template>

<script setup>
import { ref, onMounted, computed } from "vue";
import { useFlightStore } from "../stores"; // Import your flight store
import { authStore } from "../stores/authStore";
import BaseButton from "../components/Buttons/BaseButton.vue";
import CountryDropdown from "../components/countries/Countries.vue";
import { useRouter } from "vue-router";
import axios from "axios";
import Swal from "sweetalert2";
import { toast } from "vue3-toastify";

const flightStore = useFlightStore();
const router = useRouter();

const formVals = ref({
    name: "",
    email: "",
    id_number: "",
    nationality: "Kenya",
    phone: "",
});

const passengerData = ref([]);
const errors = ref({});

const passengers = computed(() => {
    // Ensure `passengerData` has an entry for each seat
    while (passengerData.value.length < flightStore.totalSeats - 1) {
        passengerData.value.push({ name: "", idNumber: "", nationality: "" });
    }
    return Array.from({ length: flightStore.totalSeats - 1 }, (_, i) => i + 2);
});

const handleFormChange = () => {
    // Use reactive state updates
};

const handleFormChangePass = (index) => {
    // Update the specific passenger form values
};

const pay = async () => {
    // Clear error object
    errors.value = {};
    console.log("passenger data", passengerData.value);

    // Implement your validation logic here
    if (!formVals.value.name) {
        errors.value.name = "Name is required";
    }

    // Check for errors and process payment
    const totalAmount =
        flightStore.totalSeats * flightStore.selectedFlight.price;

    if (totalAmount === 0) {
        toast.info("No seats selected...");
        return;
    }

    try {
        const paymentResponse = await axios.post("initiate-mpesa", {
            phone: formVals.value.phone,
            amount: totalAmount,
            email: formVals.value.email,
        });

        if (paymentResponse.data.code === "success") {
            // Proceed with booking
            const bookingResponse = await axios.post("/booking", {
                flight_id: flightStore.selectedFlight.id,
                seats: flightStore.totalSeats,
                guest_name: formVals.value.name,
                guest_email: formVals.value.email,
                guest_phone: formVals.value.phone,
                id_number: formVals.value.id_number,
                nationality: formVals.value.nationality,
            });

            await axios.post(
                `/passengers/${bookingResponse.data.booking.id}`,
                passengerData.value,
            );

            Swal.fire({
                text: "Once your payment is processed, you'll receive an email with your ticket details. Thank you for choosing Wingit!",
                icon: "success",
            });

            setTimeout(() => {
                router.push("/");
            }, 19000);
        } else {
            toast.error("Please confirm Mpesa number before retrying.");
        }
    } catch (error) {
        toast.error("An error occurred. Please try again.");
    }
};

onMounted(() => {
    // Fetch user session details if needed
});
</script>

<style scoped>
/* Add any necessary styles */
</style>
