<template>
    <div class="bg-gray-200 min-h-screen bg-[url('../assets/pill3.jpg')] bg-cover bg-center no-repeat">
        <div
            className="w-full flex flex-col lg:flex-row  justify-center align-center md:p-8 bg-gray-800 bg-opacity-25  ">
            <div className="lg:mt-24  " v-motion="motionPresets.fadeDown(Math.random() * 150)">
                <div className="card card-compact max-w-md bg-white bg-opacity-95 mx-3 shadow-lg mb-4">
                    <span className="w-full flex justify-center">
                        <h2 className="uppercase text-l font-bold  mt-2">
                            <span className="font-exo-2">
                                Your Booking information
                            </span>
                        </h2>
                    </span>
                    <form @submit.prevent="pay" class="p-4">
                        <div>
                            <label class="flex h-12 py-1 md:py-3 items-center">
                                <span class="text-left px-2 w-1/3">
                                    Full Name
                                </span>
                                <input v-model="formVals.name" type="text"
                                    class="focus:outline-none m-1 rounded-lg px-3 py-1 text-sm w-2/3 me-4"
                                    placeholder="Enter Your Full Name" required />
                            </label>
                        </div>
                        <div v-if="errors.name" class="text-red-500">
                            {{ errors.name }}
                        </div>
                        <div>
                            <label class="flex h-12 py-1 md:py-3 items-center">
                                <span class="text-left px-2 w-1/3">
                                    Email
                                </span>
                                <input v-model="formVals.email" type="email"
                                    class="focus:outline-none m-1 rounded-lg px-3 py-1 text-sm w-2/3 me-4"
                                    placeholder="Enter Your Full Name" required />
                            </label>
                        </div>
                        <div v-if="errors.email" class="text-red-500">
                            {{ errors.email }}
                        </div>
                        <div>
                            <label class="flex h-12 py-1 md:py-3 items-center">
                                <span class="text-left px-2 w-1/3">
                                    ID /Passport
                                </span>
                                <input v-model="formVals.id_number" type="email"
                                    class="focus:outline-none m-1 rounded-lg px-3 py-1 text-sm w-2/3 me-4"
                                    placeholder="Enter Passport no." required />
                            </label>
                        </div>
                        <div v-if="errors.id_number" class="text-red-500">
                            {{ errors.id_number }}
                        </div>
                        <div>
                            <label class="flex h-12 py-1 md:py-3 items-center">
                                <span class="text-left px-2 w-1/3">
                                    Nationality
                                </span>
                                <CountryDropdown v-if="!auth.is_authenticated" v-model="formVals.nationality" />
                                <span v-else>{{ formVals.nationality }}</span>
                            </label>
                        </div>
                        <div>
                            <label class="flex h-12 py-1 md:py-3 items-center">
                                <span class="text-left px-2 w-1/3">
                                    Phone no.
                                </span>
                                <input v-model="formVals.phone" type="email"
                                    class="focus:outline-none m-1 rounded-lg px-3 py-1 text-sm w-2/3 me-4"
                                    placeholder="Enter Your Full Name" required />
                            </label>
                        </div>
                        <div v-if="errors.phone" class="text-red-500">
                            {{ errors.phone }}
                        </div>
                        <span v-if="passengers?.length > 0" className="w-full flex justify-center">
                            <h2 className="uppercase text-l font-bold  mt-2">
                                <span className="{exo2.className}">
                                    Other Passengers' Infomation
                                </span>
                            </h2>
                        </span>

                        <div v-for="(passenger, index) in passengers" :key="index" class="passenger-form">

                            <label class="flex h-12 py-1 md:py-3 items-center">
                                <span class="text-left px-2 w-1/3">
                                    Full Name
                                </span>
                                <input :id="`namePass${index}`" :name="`namePass${index}`" type="text"
                                    class="focus:outline-none m-1 rounded-lg px-3 py-1 text-sm w-2/3 me-4"
                                    placeholder="Enter Your Full Name" required v-model="passengerData[index].name" />
                            </label>

                            <label class="flex h-12 py-1 md:py-3 items-center">
                                <span class="text-left px-2 w-1/3">
                                    Passport/ID
                                </span>
                                <input :id="`idNumber${index}`" :name="`idNumber${index}`" type="text"
                                    class="focus:outline-none m-1 rounded-lg px-3 py-1 text-sm w-2/3 me-4"
                                    placeholder="Enter ID/Passport Number" required
                                    v-model="passengerData[index].idNumber" />
                            </label>

                            <label class="flex h-12 py-1 md:py-3 items-center">
                                <span class="text-left px-2 w-1/3">
                                    Nationality
                                </span>
                                <span class="focus:outline-none m-1 rounded-lg px-3 py-1 text-sm w-2/3 me-4 text-left">
                                    <!-- issue here -->
                                    <CountryDropdown v-model="passengerData[index].nationality
                                        " />
                                </span>
                            </label>
                            <hr v-if="
                                mainStore.totalSeats > 2 &&
                                mainStore.totalSeats - 1
                            " class="bg-gray-600 h-0.5" />
                        </div>
                    </form>
                </div>
            </div>
            <div v-motion="motionPresets.fadeDown(Math.random() * 150)" class=" col-span-3 lg:col-span-1 m-3 order-first card card-compact max-w-md max-h-100 bg-white
                bg-opacity-95 shadow-lg mb-4 mt-24">
                <span class="w-full flex justify-center">
                    <h2 class="uppercase text-l font-bold  mt-2">
                        <span>Flight summary</span>
                    </h2>
                </span>
                <div class="px-2 md:px-8 m-2">
                    <ul class="py-6 border-b space-y-3 md:space-y-4">
                        <li class="grid grid-cols-3 gap-1">
                            <div class="flex flex-col col-span-1 pt-3">
                                <span class="text-gray-600 font-semi-bold cursor-pointer">
                                    <i @click="
                                        mainStore.decreaseSeats(
                                            mainStore.selectedFlight?.id,
                                        )
                                        " class="pi pi-minus text-base animate-pulse"></i>
                                    Seats
                                    <i @click="
                                        mainStore.increaseSeats(
                                            mainStore.selectedFlight.id,
                                            mainStore.selectedFlight
                                                ?.available_seats,
                                        )
                                        " class="pi pi-plus text-base animate-pulse"></i>
                                </span>
                            </div>
                            <div class="col-span-2 pt-3 md:pt-3">
                                <div class="flex items-center font-light justify-between">
                                    {{ mainStore.totalSeats }} x KES
                                    {{
                                        Number(
                                            mainStore.selectedFlight?.price,
                                        ).toLocaleString()
                                    }}
                                    =
                                    <span
                                        class=" font-semibold text-right ml-1 rounded-md bg-emerald-500 bg-opacity-35">
                                        KES
                                        {{
                                            Number(totalAmount).toLocaleString()
                                        }}
                                    </span>
                                </div>
                            </div>
                        </li>
                        <li class="grid grid-cols-3 gap-1">
                            <div class="flex flex-col col-span-1 pt-1 md:pt-3">
                                <span class="text-gray-600">Routing</span>
                            </div>
                            <div class="col-span-2 pt-1 md:pt-3">
                                <div class="flex items-center space-x-2 text-sm justify-between">
                                    <span class=" font-light">{{
                                        mainStore.selectedFlight?.origin_airport
                                            .name
                                    }}</span>
                                    -
                                    <span class=" font-light">{{
                                        mainStore.selectedFlight
                                            ?.destination_airport.name
                                    }}</span>
                                </div>
                            </div>
                        </li>
                        <li class="grid grid-cols-6 gap-2">
                            <div class="flex flex-col col-span-3 pt-3">
                                <span class="text-gray-600">Departure date</span>
                            </div>
                            <div class="col-span-3 pt-3">
                                <span class=" font-light">
                                    {{
                                        format(
                                            new Date(
                                                mainStore.selectedFlight?.depart_time,
                                            ),
                                            "EEE d, M, Y, HH:mm",
                                        )
                                    }}
                                </span>
                            </div>
                        </li>
                        <li class="grid grid-cols-6 gap-2">
                            <div class="flex flex-col col-span-3 pt-3">
                                <span class="text-gray-600">Arrival date</span>
                            </div>
                            <div class="col-span-3 pt-3">
                                <span class=" font-light">
                                    {{
                                        format(
                                            new Date(
                                                mainStore.selectedFlight?.arrival_time,
                                            ),
                                            "EEE d, M, Y, HH:mm",
                                        )
                                    }}
                                </span>
                            </div>
                        </li>
                        <li class="grid grid-cols-6 gap-2">
                            <div class="flex flex-col col-span-3 pt-1 md:pt-3">
                                <span class="text-gray-600">Aircraft</span>
                            </div>
                            <div class="col-span-3 pt-3">
                                <span class=" font-light text-right">
                                    {{
                                        mainStore.selectedFlight.aircraft
                                            ?.aircraft_type
                                    }}
                                </span>
                            </div>
                        </li>
                        <li class="grid grid-cols-6 gap-2">
                            <div class="flex flex-col col-span-3 pt-1 md:pt-3">
                                <span class="text-gray-600">Operator</span>
                            </div>
                            <div class="col-span-3 pt-1">
                                <span class=" font-light text-right">
                                    {{
                                        mainStore.selectedFlight
                                            ?.aircraft_operator?.company_name
                                    }}
                                </span>
                            </div>
                        </li>
                    </ul>
                </div>
                <hr class="border-gray-700" />
                <ul>
                    <li class="flex justify-between bg-emerald-500 bg-opacity-35 px-2 py-2 md:px-10">
                        <div class="flex flex-col col-span-3 pt-1 md:pt-3">
                            <span class="text-gray-600 text-lg font-bold">Total</span>
                        </div>
                        <div class="col-span-3 pt-1 md:pt-3">
                            <span class=" text-end font-bold">
                                KES {{ Number(totalAmount).toLocaleString() }}
                            </span>
                        </div>
                    </li>
                </ul>
                <hr class="border-gray-700" />
            </div>
        </div>
        <div className="w-full flex  justify-center align-center  md:p-8 "
            v-motion="motionPresets.fadeUp(Math.random() * 150)">
            <div class="card card-compact w-96 mx-3 bg-white bg-opacity-95 shadow-lg mb-4">
                <span class="w-full flex justify-center">
                    <h2 class="uppercase text-l font-bold  mt-2">
                        <span>Payment options</span>
                    </h2>
                </span>
                <span className="w-full flex justify-center">
                    <h2 className="uppercase text-l font-bold  mt-2">
                        <span className="{exo2.className}">
                            Ticket Total : KES
                            {{ Number(totalAmount).toLocaleString() }}
                        </span>
                    </h2>
                </span>
                <div class="w-full p-3 border-b border-gray-200 flex flex-row gap-2">

                    <div class="w-full flex flex-col">
                        <label for="type2" class="flex items-center cursor-pointer">
                            <input type="radio" class="form-radio h-5 w-5 text-indigo-500" name="type" id="type2"
                                checked />
                            <img src="https://upload.wikimedia.org/wikipedia/commons/1/15/M-PESA_LOGO-01.svg" width="80"
                                class="ml-3" />
                        </label>
                    </div>
                    <div class="w-full mt-4">
                        <label for="type1" class="flex items-center cursor-pointer">
                            <input type="radio" class="form-radio h-5 w-5 text-indigo-500" name="type" id="type1"
                                disabled />
                            <img src="https://upload.wikimedia.org/wikipedia/commons/b/b5/PayPal.svg" width="80"
                                class="ml-3" />
                        </label>
                    </div>
                </div>
                <div class="flex justify-center p-2 gap-2 flex-col">
                    <div class="form-control w-full">
                        <label class="label">
                            <span class="label-text">Enter Mpesa number</span>
                        </label>
                        <input type="text" v-model="formVals.mpesa_phone" placeholder="Type here"
                            class="input input-bordered input-sm input-base-100 w-full w-xs" />
                    </div>
                    <BaseButton @click="pay" label="Proceed to pay" />
                </div>
            </div>
        </div>
        <dialog id="my-dialog" v-if="transactionStatus"
            class="fixed top-0 left-0 w-full h-full z-50 overflow-y-auto bg-black bg-opacity-50 flex">

            <div class="flex items-center justify-center h-full w-full">
                <div class="p-4 w-full max-w-md text-center bg-white shadow-md rounded-md">
                    <h2 class="text-xl font-semibold">Processing payment...</h2>

                    <p
                        :class="['mt-4 text-sm text-gray-600 rounded-badge', transactionStatus[1]?.status == 'error' ? 'bg-red-50' : '']">
                        {{ transactionStatus[0].message }}
                    </p>
                    <div class="flex items-center justify-center mt-6 w-ful">
                        <div class="mpesaloader"></div>
                    </div>

                </div>
            </div>
        </dialog>

    </div>
</template>

<script setup>
import { ref, onMounted, computed, inject } from "vue";
import { useMainStore } from "../stores"; // Import your flight store
import { authStore } from "../stores/authStore";
import BaseButton from "../components/Buttons/BaseButton.vue";
import CountryDropdown from "../components/countries/Countries.vue";
import { useRouter } from "vue-router";
import axios from "axios";
import { format } from "date-fns";
import Swal from "sweetalert2";
import { toast } from "vue3-toastify";

const mainStore = useMainStore();

const auth = authStore();

const router = useRouter();

const transactionStatus = ref(null);

const motionPresets = inject("motionPresets");

const formVals = ref({
    name: auth.user?.name || "",
    email: auth.user?.email || "",
    id_number: auth.user?.id_number || "",
    nationality: auth.user?.nationality || "Kenya",
    phone: auth.user?.phone || "",
    mpesa_phone: auth.user?.phone || "",
});

const passengerData = ref([]);
const errors = ref({});

const passengers = computed(() => {
    // Ensure `passengerData` has an entry for each seat
    while (passengerData.value.length < mainStore.totalSeats - 1) {
        passengerData.value.push({ name: "", idNumber: "", nationality: "" });
    }
    return Array.from({ length: mainStore.totalSeats - 1 }, (_, i) => i + 2);
});

const totalAmount = computed(() => {
    return mainStore.totalSeats * (mainStore.selectedFlight?.price || 0);
});

const handleFormChange = () => {
    // Use reactive state updates
};

const pay = async () => {
    // Clear error object
    errors.value = {};

    // Implement your validation logic here
    if (!formVals.value.name) {
        errors.value.name = "Name is required";
        return;
    }

    // Check for errors and process payment

    if (totalAmount.value === 0) {
        toast.info("No seats selected...");
        return;
    }
    var mailRegex = /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/i;

    if (!formVals.value.email) {
        errors.value.email = "Email is required";
    } else if (!mailRegex.test(formVals.value.email)) {
        errors.value.email = "Please enter a valid email";
    }

    if (!formVals.value.phone) {
        errors.value.phone = "Phone is required";
    }
    if (!formVals.value.mpesa_phone) {
        errors.value.phone = "Mpesa phone is required";
    }

    if (!formVals.value.id_number) {
        errors.value.id_number = "ID/Passport is required";
    }

    if (Object.values(errors.value).length != 0) {
        //console.log("Error messages:", Object.values(errors));
        return;
    }

    if (
        passengerData.value.length > 0 &&
        (
            passengerData.value.some((passenger) =>
                Object.values(passenger).some((value) => !value.toString().trim())
            ) ||
            passengerData.value.length < (mainStore.totalSeats - 1)
        )
    ) {
        toast.info("Please provide information for all passengers");
        return;
    }


    transactionStatus.value = [{
        message: "Requesting  for safaricom Mpesa service..."
    }];

    // test passengers

    //test passengers
    const paymentResponse = await axios.post(
        "initiate-mpesa",
        {
            phone: formVals.value.mpesa_phone,
            amount: totalAmount.value,
            email: formVals.value.email,
        },
        { showLoader: true },
    );



    transactionStatus.value =
        [{
            message: "Waiting for safaricom to repond..."
        }]


    if (paymentResponse.data.code === "success") {

        const requestId = paymentResponse.data?.request_id;

        setTimeout(() => {
            transactionStatus.value = [{ message: "Please check your handset and input your Mpesa PIN" }];
        }, 2000);

        const bookingResponse = await axios.post("/booking", {
            flight_id: mainStore.selectedFlight.id,
            seats: mainStore.totalSeats,
            guest_name: formVals.value.name,
            guest_email: formVals.value.email,
            guest_phone: formVals.value.phone,
            id_number: formVals.value.id_number,
            nationality: formVals.value.nationality,
        });

        if (passengerData.value.length > 0) {
            await axios.post(
                `/passengers/${bookingResponse.data.booking.id}`,
                passengerData.value,
            );

        }
        setTimeout(() => {
            transactionStatus.value = [{ message: "Checking transaction status..." }];
        }, 5000);

        const checkMpesaStatus = async (requestId) => {
            const interval = setInterval(async () => {
                try {
                    const response = await axios.post(`/check-mpesa-status/${requestId}`);

                    if (response.data.status === "completed") {
                        transactionStatus.value = [{ message: "Payment successful!" }, { success: "success" }];

                        setTimeout(() => {
                            Swal.fire({
                                text: "Payment processed! you'll receive an email with your ticket details. Thank you for choosing Wingit!",
                                icon: "success",
                                confirmButtonColor: "#0e5b5c",
                                confirmButtonText: "Got it!",
                            });
                        }, 2000);

                        transactionStatus.value = null;

                        clearInterval(interval); // Stop polling

                    } else if (response.data.status === "failed") {
                        transactionStatus.value = [{ message: "Payment failed. Please try again." }, { status: "error" }];

                        setTimeout(() => {
                            transactionStatus.value = null;
                        }, 5000);

                        clearInterval(interval); // Stop polling

                    }
                    // If status is "pending", continue polling every 2 seconds.

                } catch (error) {
                    console.error("Error checking payment status:", error);
                }
            }, 2000); // Poll every 2 seconds
        };

        // Call the function with the requestId
        checkMpesaStatus(requestId);


        // setTimeout(() => {
        //     router.push("/");
        // }, 19000);

    } else {
        transactionStatus.value = [{ message: "Please confirm Mpesa number before retrying" }, { error: "error" }];
        setTimeout(() => { transactionStatus.value = null }, 3000)
        return
    }
};

onMounted(() => {
    // Fetch user session details if needed
});
</script>

<style scoped>
.mpesaloader {
    height: 4px;
    width: 180px;
    --c: no-repeat linear-gradient(#0e5b5c 0 0);
    background: var(--c), var(--c), #bbbbbb;
    background-size: 60% 100%;
    animation: l16 2s infinite;
    border-radius: 10px;
}

@keyframes l16 {
    0% {
        background-position: -150% 0, -150% 0
    }

    66% {
        background-position: 250% 0, -150% 0
    }

    100% {
        background-position: 250% 0, 250% 0
    }
}
</style>
