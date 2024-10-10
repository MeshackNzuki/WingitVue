<template>
    <div class="bg-gray-200 min-h-screen bg-[url('/pill3.jpg')] bg-cover bg-center no-repeat">
      <motion.div
        initial="{ x: '100%' }"
        animate="{ x: 0 }"
        transition="{
          type: 'slide',
          stiffness: 50,
          ease: 'easeOut',
          duration: 0.5
        }"
        class="p-4"
      >
        <div v-if="errors.name" class="text-red-500">{{ errors.name }}</div>
        <div v-if="errors.email" class="text-red-500">{{ errors.email }}</div>
        <div v-if="errors.phone" class="text-red-500">{{ errors.phone }}</div>
        <div v-if="errors.id_number" class="text-red-500">{{ errors.id_number }}</div>
        
        <form @submit.prevent="pay">
          <div>
            <label>Full Name <sup class="text-red-500">*</sup></label>
            <input type="text" v-model="formVals.name" @input="handleFormChange" />
          </div>
          <div>
            <label>Email <sup class="text-red-500">*</sup></label>
            <input type="email" v-model="formVals.email" @input="handleFormChange" />
          </div>
          <div>
            <label>ID/Passport <sup class="text-red-500">*</sup></label>
            <input type="text" v-model="formVals.id_number" @input="handleFormChange" />
          </div>
          <div>
            <label>Nationality <sup class="text-red-500">*</sup></label>
            <CountryDropdown v-model="formVals.nationality" />
          </div>
          <div>
            <label>Phone <sup class="text-red-500">*</sup></label>
            <input type="text" v-model="formVals.phone" @input="handleFormChange" />
          </div>
          
          <div v-for="(passenger, index) in totalPassengers" :key="index">
            <div>
              <label>Passenger {{ index + 1 }} Name <sup class="text-red-500">*</sup></label>
              <input
                type="text"
                v-model="formValsPass[index].name"
                @input="handleFormChangePass(index)"
                placeholder="Enter Full Name"
              />
            </div>
            <div>
              <label>Passenger {{ index + 1 }} ID/Passport <sup class="text-red-500">*</sup></label>
              <input
                type="text"
                v-model="formValsPass[index].id_number"
                @input="handleFormChangePass(index)"
                placeholder="Enter ID/Passport Number"
              />
            </div>
            <div>
              <label>Passenger {{ index + 1 }} Nationality <sup class="text-red-500">*</sup></label>
              <CountryDropdown
                v-model="formValsPass[index].nationality"
              />
            </div>
            <hr v-if="index < totalPassengers - 1" class="bg-gray-600 h-0.5" />
          </div>
  
          <BtnBase type="submit" text="Book Flight" />
        </form>
      </motion.div>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted } from "vue";
  import { useFlightStore } from "../stores/flightStore"; // Import your flight store
  import { useAuthStore } from "../stores/authStore"; // Import your auth store
  import Header from "../components/headers/header.vue";
  import Footer from "../components/footers/footer.vue";
  import CountryDropdown from "../components/countries/countries.vue";
  import { useRouter } from "vue-router";
  import axios from "axios";
  import Swal from "sweetalert2";
  import { toast } from "react-toastify";
  
  const flightStore = useFlightStore();
  const authStore = useAuthStore();
  const router = useRouter();
  
  const formVals = ref({
    name: "",
    email: "",
    id_number: "",
    nationality: "Kenya",
    phone: "",
  });
  
  const formValsPass = ref([{ name: "", id_number: "", nationality: "" }]);
  const errors = ref({});
  const totalPassengers = flightStore.searchData.reduce((total, flight) => total + flight.seats, 0);
  
  const handleFormChange = () => {
    // Use reactive state updates
  };
  
  const handleFormChangePass = (index) => {
    // Update the specific passenger form values
  };
  
  const pay = async () => {
    // Clear error object
    errors.value = {};
  
    // Implement your validation logic here
    if (!formVals.value.name) {
      errors.value.name = "Name is required";
    }
  
    // Check for errors and process payment
    const totalAmount = calculateTotalAmount();
  
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
          flight_id: flightStore.flightData.map(a => a.id).join(""),
          seats: flightStore.searchData.map(a => a.seats).join(""),
          guest_name: formVals.value.name,
          guest_email: formVals.value.email,
          guest_phone: formVals.value.phone,
          id_number: formVals.value.id_number,
          nationality: formVals.value.nationality,
        });
  
        await axios.post(`/passengers/${bookingResponse.data.booking.id}`, formValsPass.value);
        
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
  
  function calculateTotalAmount() {
    // Calculate the total amount based on flight and seat selection
    return flightStore.searchData.reduce((accSeats, flight) => accSeats + flight.seats, 0) *
      flightStore.flightData.reduce((accPrice, flight) => accPrice + (flight.has_offer ? flight.offer_price : flight.price), 0);
  }
  
  onMounted(() => {
    // Fetch user session details if needed
  });
  </script>
  
  <style scoped>
  /* Add any necessary styles */
  </style>
  