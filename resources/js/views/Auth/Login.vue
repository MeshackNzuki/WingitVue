<template>
    <div>
        <section class="fixed w-full z-50 snap-center">
            <Header />
        </section>
        <div class="min-h-screen flex flex-col items-center justify-center bg-[url('../assets/searchpg.jpg')] p-2">
            <div v-motion="motionPresets.fadeDown()"
                class="relative flex flex-col bg-white bg-opacity-85 shadow-md px-4 lg:px-8 py-2 mt-16 w-full lg:max-w-[420px] rounded-lg">
                <div class="font-bold self-center text-xl sm:text-l uppercase text-base mt-3">
                    Login
                </div>
                <div>
                    <Error :msg="error_message" />
                </div>
                <div class="mt-10">
                    <form @submit.prevent="submit">
                        <div class="flex flex-col mb-6">
                            <label for="email" class="mb-1 text-xs sm:text-sm tracking-wide  font-bold">
                                E-Mail Address:
                            </label>
                            <div class="relative">
                                <div class="inline-flex items-center justify-center absolute left-0 top-0 h-full w-10 ">
                                    <i class="pi pi-envelope"></i>
                                    <!-- PrimeVue email icon -->
                                </div>

                                <input id="email" type="email" name="email" v-model="formVals.email"
                                    class="text-sm sm:text-base placeholder-gray-500 pl-10 pr-4 rounded-full border border-gray-400 w-full py-2 focus:outline-none focus:border-green-800"
                                    placeholder="E-Mail Address" />
                            </div>
                            <Error v-if="errors.email" :msg="errors.email" />
                        </div>
                        <div class="flex flex-col mb-6">
                            <label for="password" class="mb-1 text-xs sm:text-sm tracking-wide  font-bold">
                                Password:
                            </label>
                            <div class="relative">
                                <div class="inline-flex items-center justify-center absolute left-0 top-0 h-full w-10 ">
                                    <i class="pi pi-lock"></i>
                                    <!-- PrimeVue lock icon -->
                                </div>
                                <div class="inline-flex items-center justify-center absolute right-0 top-0 h-full w-10 "
                                    @click="togglePasswordVisibility">
                                    <i :class="isText
                                        ? 'pi pi-eye'
                                        : 'pi pi-eye-slash'
                                        "></i>
                                    <!-- PrimeVue eye icon -->
                                </div>
                                <input id="password" :type="isText ? 'text' : 'password'" name="password"
                                    v-model="formVals.password"
                                    class="text-sm sm:text-base placeholder-gray-500 pl-10 pr-4 rounded-full border border-gray-400 w-full py-2 focus:outline-none focus:border-green-800"
                                    placeholder="Password" />
                            </div>
                            <Error v-if="errors.password" :msg="errors.password" />
                        </div>

                        <div class="flex items-center mb-6 -mt-4">
                            <div class="flex ml-auto">
                                <router-link to="/password-reset"
                                    class="inline-flex text-sm  hover:text-[#EF434A] font-light underline">Forgot
                                    Password?</router-link>
                            </div>
                        </div>

                        <div class="flex justify-center items-center">
                            <BaseButton label="Submit" class="p-8" @click="submit" />
                        </div>

                        <div class=" text-sm px-4 my-4 rounded-md">
                            <RouterLink to="/client-register" class="underline">No account?</RouterLink>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref, reactive, onMounted, inject } from "vue";
import { useRouter } from "vue-router";
import { toast } from "vue3-toastify";
import BaseButton from "../../components/Buttons/BaseButton.vue";
import { authStore } from "../../stores/authStore";
import axios from "axios";
import Error from "../../components/Flash/Error.vue";

const router = useRouter();
const { user, login, is_authenticated } = authStore();
const motionPresets = inject("motionPresets");

const formVals = reactive({ email: "", password: "" });
const isText = ref(false);
const error_message = ref(null)
const errors = reactive({}); // Single source of truth for errors

const validate = (values) => {
    // Clear previous errors
    Object.keys(errors).forEach((key) => delete errors[key]);

    if (!values.email) {
        errors.email = "Email is required";
    }
    if (!values.password) {
        errors.password = "Password is required";
    }

    return Object.keys(errors).length === 0; // Return validation status
};

const submit = async () => {
    if (!validate(formVals)) return; // Stop if validation fails

    try {
        const res = await axios.post("/login", { ...formVals });
        login(res.data.user);
    } catch (error) {
        error_message.value = "Wrong credentials"; // Store error in errors object
        setTimeout(() => {
            error_message.value = '';
        }, 4000);
    }
};

const togglePasswordVisibility = () => {
    isText.value = !isText.value;
};

const checkAuth = async () => {
    if (is_authenticated) {
        login(user);
    }
};

onMounted(checkAuth);
</script>


<style scoped>
/* Add scoped styles here */
</style>
