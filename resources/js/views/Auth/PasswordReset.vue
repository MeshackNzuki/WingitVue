<template>
    <div class="flex bg-base justify-center items-center min-h-screen w-full">
        <div class="bg-white shadow-lg rounded-lg p-6 max-w-md mx-auto mt-">
            <div class="pb-4 text-left">
                <h4 class="text-2xl font-bold">Reset Password</h4>
                <p class="text-sm text-gray-500">Enter your email</p>
            </div>
            <div>
                <div class="mb-4">
                    <input
                        type="email"
                        v-model="email"
                        name="email"
                        placeholder="Email Address"
                        class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-teal-500"
                        :disabled="isEmailTrue"
                        required
                    />
                </div>

                <div v-if="isEmailTrue">
                    <p v-if="successMessage" class="text-emerald-600 mb-4">
                        {{ successMessage }}
                    </p>
                    <input
                        type="number"
                        v-model="token"
                        name="token"
                        placeholder="Token"
                        required
                        class="w-full px-4 py-2 border rounded mb-3 focus:outline-none focus:ring-2 focus:ring-teal-500"
                    />
                    <input
                        type="password"
                        v-model="password"
                        name="password"
                        placeholder="New Password"
                        required
                        class="w-full px-4 py-2 border rounded mb-3 focus:outline-none focus:ring-2 focus:ring-teal-500"
                    />
                    <input
                        type="password"
                        v-model="confirm_password"
                        placeholder="Confirm New Password"
                        required
                        class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-teal-500"
                    />
                </div>
                <p v-if="hasError" class="text-red-500 mt-2">
                    {{ errorMessage }}
                </p>

                <div class="text-center mt-6">
                    <button
                        v-if="!isEmailTrue"
                        @click.prevent="checkEmailExists"
                        class="w-full bg-teal-500 text-white py-2 rounded hover:bg-teal-600 focus:outline-none focus:ring-2 focus:ring-teal-600"
                    >
                        Verify Email
                        <span
                            v-if="showSpinner"
                            class="ml-2 inline-block animate-spin w-4 h-4 border-2 border-white border-t-transparent rounded-full"
                        ></span>
                    </button>
                    <button
                        v-else
                        @click="resetPasswordHandler"
                        class="w-full bg-teal-500 text-white py-2 rounded hover:bg-teal-600 focus:outline-none focus:ring-2 focus:ring-teal-600"
                    >
                        Reset Password
                        <span
                            v-if="showSpinner"
                            class="ml-2 inline-block animate-spin w-4 h-4 border-2 border-white border-t-transparent rounded-full"
                        ></span>
                    </button>
                </div>
            </div>
            <div class="text-center mt-6">
                <p class="text-sm">
                    Don't have an account?
                    <router-link
                        to="/client-register"
                        class="text-teal-500 font-semibold hover:underline"
                        >Sign up</router-link
                    >
                </p>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref } from "vue";
import axios from "axios";

const showSpinner = ref(false);
const isEmailTrue = ref(false);
const hasError = ref(false);
const errorMessage = ref("");
const successMessage = ref("");
const email = ref("");
const token = ref("");
const password = ref("");
const confirm_password = ref("");

const checkEmailExists = async () => {
    errorMessage.value = "";
    successMessage.value = "";
    hasError.value = false;
    if (!email.value) {
        hasError.value = true;
        errorMessage.value = "Email address is required";
        return;
    }
    showSpinner.value = true;

    try {
        const response = await axios.post("/api/verify-user-account", {
            email: email.value,
        });

        if (response.data.status) {
            isEmailTrue.value = true;
            successMessage.value = response.data.msg;
        } else {
            isEmailTrue.value = false;
            hasError.value = true;
            errorMessage.value = response.data.msg;
        }
    } catch (error) {
        hasError.value = true;
        errorMessage.value = "An error occurred";
    } finally {
        showSpinner.value = false;
    }
};

const resetPasswordHandler = async () => {
    errorMessage.value = "";
    successMessage.value = "";
    hasError.value = false;
    if (password.value.trim() !== confirm_password.value.trim()) {
        hasError.value = true;
        errorMessage.value = "The passwords do not match";
        return;
    }

    if (password.value.trim() === "" || confirm_password.value.trim() === "") {
        hasError.value = true;
        errorMessage.value = "The password field cannot be empty";
        return;
    }

    if (!token.value) {
        hasError.value = true;
        errorMessage.value = "The token field cannot be empty";
        return;
    }

    const data = {
        email: email.value,
        password: password.value,
        token: token.value,
    };
    showSpinner.value = true;

    try {
        const response = await axios.post("/reset-password", data);
        if (response.data.status) {
            successMessage.value = response.data.msg;
            setTimeout(() => window.location.reload(), 3000);
        } else {
            isEmailTrue.value = false;
            hasError.value = true;
            errorMessage.value = response.data.msg;
        }
    } catch (error) {
        hasError.value = true;
        errorMessage.value = "An error occurred";

        if (error instanceof Error) {
            await logError(error, {
                routeDetails: "ResetPassword.Vue - resetPasswordHandler",
                message: "Error occurred in ResetPassword.Vue",
            });
        }
    } finally {
        showSpinner.value = false;
    }
};
</script>

<style scoped>
/* Additional Tailwind CSS classes or custom styles, if needed */
</style>
