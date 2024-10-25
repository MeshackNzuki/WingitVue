<template>
    <div>
        <div
            class="min-h-screen flex flex-col items-center justify-center bg-base p-2"
        >
            <div
                class="relative flex flex-col bg-slate-50 shadow-md px-4 mb-6 mt-24 sm:px-6 md:px-32 lg:px-8 py-2 md:py-4 rounded-lg w-full max-w-[500px]"
            >
                <div
                    class="font-bold self-center text-xl sm:text-2xl uppercase text-base"
                >
                    Create an account
                </div>

                <div class="mt-10">
                    <form @submit.prevent="submit">
                        <div class="flex flex-col mb-3 md:mb-6">
                            <label
                                for="name"
                                class="mb-1 text-xs sm:text-sm tracking-wide text-gray-800"
                            >
                                Full Name
                            </label>
                            <div class="relative">
                                <div
                                    class="inline-flex items-center justify-center absolute left-0 top-0 h-full w-10 text-gray-400"
                                >
                                    <i class="pi pi-user"></i>
                                    <!-- PrimeVue email icon -->
                                </div>
                                <input
                                    id="name"
                                    v-model="formVals.name"
                                    type="text"
                                    class="text-sm sm:text-base placeholder-gray-500 pl-10 pr-4 rounded-full border border-gray-400 w-full py-2 focus:outline-none focus:border-green-800"
                                    placeholder="Your full name"
                                />
                            </div>
                            <Error v-if="errors.name" :message="errors.name" />
                        </div>
                        <div class="flex flex-col mb-3 md:mb-6">
                            <label
                                for="email"
                                class="mb-1 text-xs sm:text-sm tracking-wide text-gray-800"
                            >
                                Phone Number
                            </label>
                            <div class="relative">
                                <div
                                    class="inline-flex items-center justify-center absolute left-0 top-0 h-full w-10 text-gray-400"
                                >
                                    <i
                                        class="pi pi-phone"
                                        style="font-size: 1.5em"
                                    ></i>
                                </div>
                                <div
                                    class="flex flex-row items-center relative"
                                >
                                    <div class="absolute left-8 text-gray-400">
                                        <CountryCode
                                            v-model="formVals.country_code"
                                        />
                                    </div>
                                    <input
                                        id="contact_number"
                                        type="tel"
                                        name="contact_number"
                                        v-model="formVals.contact_number"
                                        class="text-sm sm:text-base placeholder-gray-500 pl-10 pr-4 rounded-full border border-gray-400 w-full py-2 focus:outline-none focus:border-green-800 ml-36"
                                    />
                                </div>
                            </div>
                        </div>

                        <div class="flex flex-col mb-3 md:mb-6">
                            <label
                                for="email"
                                class="mb-1 text-xs sm:text-sm tracking-wide text-gray-800"
                            >
                                E-Mail Address
                            </label>
                            <div class="relative">
                                <div
                                    class="inline-flex items-center justify-center absolute left-0 top-0 h-full w-10 text-gray-400"
                                >
                                    <i class="pi pi-envelope"></i>
                                    <!-- PrimeVue email icon -->
                                </div>
                                <input
                                    id="email"
                                    v-model="formVals.email"
                                    type="email"
                                    class="text-sm sm:text-base placeholder-gray-500 pl-10 pr-4 rounded-full border border-gray-400 w-full py-2 focus:outline-none focus:border-green-800"
                                    placeholder="E-Mail Address"
                                />
                            </div>
                            <Error
                                v-if="errors.email"
                                :message="errors.email"
                            />
                        </div>

                        <div class="flex flex-col mb-3 md:mb-6">
                            <label
                                for="password"
                                class="mb-1 text-xs sm:text-sm tracking-wide text-gray-800"
                            >
                                Password
                            </label>
                            <div class="relative">
                                <div
                                    class="inline-flex items-center justify-center absolute left-0 top-0 h-full w-10 text-gray-400"
                                >
                                    <i class="pi pi-lock"></i>
                                    <!-- PrimeVue email icon -->
                                </div>
                                <input
                                    id="password"
                                    v-model="formVals.password"
                                    type="password"
                                    class="text-sm sm:text-base placeholder-gray-500 pl-10 pr-4 rounded-full border border-gray-400 w-full py-2 focus:outline-none focus:border-green-800"
                                    placeholder="Password"
                                />
                            </div>
                            <Error
                                v-if="errors.password"
                                :message="errors.password"
                            />
                        </div>

                        <div class="flex flex-col mb-3 md:mb-6">
                            <label
                                for="password_confirmation"
                                class="mb-1 text-xs sm:text-sm tracking-wide text-gray-800"
                            >
                                Confirm Password
                            </label>
                            <div class="relative">
                                <div
                                    class="inline-flex items-center justify-center absolute left-0 top-0 h-full w-10 text-gray-400"
                                >
                                    <i class="pi pi-lock"></i>
                                    <!-- PrimeVue email icon -->
                                </div>
                                <input
                                    id="password_confirmation"
                                    v-model="formVals.password_confirmation"
                                    type="password"
                                    class="text-sm sm:text-base placeholder-gray-500 pl-10 pr-4 rounded-full border border-gray-400 w-full py-2 focus:outline-none focus:border-green-800"
                                    placeholder="Confirm Password"
                                />
                            </div>
                            <Error
                                v-if="errors.password_confirmation"
                                :message="errors.password_confirmation"
                            />
                        </div>

                        <div class="flex justify-center items-center">
                            <BaseButton
                                label="Submit"
                                class="p-8"
                                @click="submit"
                            />
                        </div>
                    </form>
                </div>

                <div class="flex justify-center items-center mt-6">
                    <router-link
                        to="/login"
                        class="inline-flex items-center font-bold text-gray-700 hover:text-[#EF434A] text-xs text-center"
                    >
                        <span class="ml-2">Have an account? Sign in</span>
                    </router-link>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { reactive, onMounted } from "vue";
import { useRouter } from "vue-router";
import BaseButton from "../../components/Buttons/BaseButton.vue";
import Error from "../../components/Errors/Error.vue";
import axios from "axios";
import Swal from "sweetalert2";
import { authStore } from "../../stores/authStore";
import CountryCode from "../../components/countries/CountryCodes.vue";

const { user, login, is_authenticated } = authStore();

// Reactive form values and errors
const formVals = reactive({
    name: "",
    username: "",
    first_name: "",
    second_name: "",
    country: "",
    phone: "",
    contact_number: "",
    email: "",
    password: "",
    password_confirmation: "",
    id_no: "",
    passport: "",
});

const errors = reactive({});

// Validation function
const validate = () => {
    const validationErrors = {};
    const mailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

    if (!formVals.name) validationErrors.name = "Name is required";
    else if (!formVals.name.split(" ")[1])
        validationErrors.name = "Please input second name";

    if (!formVals.email) validationErrors.email = "Email is required";
    else if (!mailRegex.test(formVals.email))
        validationErrors.email = "Please enter a valid email";

    if (!formVals.password)
        validationErrors.password = "Please set your password";
    if (formVals.password !== formVals.password_confirmation)
        validationErrors.password_confirmation = "Your passwords don't match";
    if (formVals.password.length < 8)
        validationErrors.password = "Please use at least 8 characters";

    return validationErrors;
};

// Submit function
const router = useRouter();
const submit = async () => {
    Object.assign(errors, validate());

    if (Object.keys(errors).length > 0) return;

    const [first_name, second_name] = formVals.name.split(" ");
    formVals.first_name = first_name;
    formVals.second_name = second_name;
    formVals.username = first_name;
    formVals.country = formVals.country_code.name;
    formVals.phone = formVals.country_code.code + formVals.contact_number;
    console.log("formvals", formVals);
    try {
        const response = await axios.post("register/customer", formVals);

        login(response.data.user);
        console.log("response", response);
        Swal.fire({
            text: "Account created - Happy adventure!",
            icon: "success",
            confirmButtonText: "Close",
            confirmButtonColor: "#0f6566",
        });
        router.push("/customer");
    } catch (error) {
        Swal.fire({
            text: error.response?.data?.message || "Error creating account",
            icon: "error",
            confirmButtonText: "Close",
            confirmButtonColor: "#425C59",
        });
    }
};
onMounted(() => {
    if (is_authenticated) {
        console.log("first", user.role);
        router.push(user.role);
    }
});
</script>
