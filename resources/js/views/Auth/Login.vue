<template>
    <Header />
    <div
        class="bg-gray-50 dark:bg-gray-900 h-screen flex flex-wrap h-100 w-full items-center justify-center overflow-hidden"
    >
        <div class="lg:w-1/2">
            <section class="dark:bg-gray-900">
                <div
                    class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0"
                >
                    <a
                        href="#"
                        class="flex items-center mb-6 text-2xl font-semibold text-gray-900 dark:text-white"
                    >
                        <img
                            class="w-8 h-8 mr-2"
                            src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/logo.svg"
                            alt="logo"
                        />
                        LOGO
                    </a>
                    <div
                        class="w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700"
                    >
                        <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
                            <h1
                                class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white"
                            >
                                Sign in
                            </h1>
                            <form
                                class="space-y-4 md:space-y-6"
                                @submit.prevent="handleLogin"
                            >
                                <div>
                                    <label
                                        for="email"
                                        class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
                                        >Your email / User name</label
                                    >
                                    <input
                                        v-model="email"
                                        type="email"
                                        name="email"
                                        id="email"
                                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                        placeholder="name@company.com"
                                        required
                                    />
                                </div>
                                <div>
                                    <label
                                        for="password"
                                        class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
                                        >Password</label
                                    >
                                    <input
                                        v-model="password"
                                        type="password"
                                        name="password"
                                        id="password"
                                        placeholder="••••••••"
                                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                        required
                                    />
                                </div>

                                <button
                                    type="submit"
                                    class="w-full dark:gray-400 text-white bg-emerald-600 hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800"
                                >
                                    <span
                                        v-if="isLoading"
                                        class="animate-spin mr-2 transition-all duration-200"
                                        >&#9696;</span
                                    >
                                    LOGIN
                                </button>
                                <p
                                    class="text-sm font-light text-gray-500 dark:text-gray-400"
                                >
                                    Forget your password?
                                    <a
                                        href="#"
                                        class="font-medium text-primary-600 hover:underline dark:text-primary-500"
                                        >Request Reset</a
                                    >
                                </p>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <div class="bg-lime-50 hidden lg:block md:w-1/2 h-screen">
            <img
                src="https://images.pexels.com/photos/1164572/pexels-photo-1164572.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                class="h-screen w-full"
            />
        </div>
    </div>
    <Footer />
</template>

<script setup>
import { ref } from "vue";
import axios from "axios";
import { authStore } from "../../stores/authStore";
import Header from "../../components/Header.vue";
import Footer from "../../components/Footer.vue";
import { useRouter } from "vue-router";

const { login } = authStore();

const email = ref("");
const password = ref("");
const isLoading = ref(false);
const router = useRouter();

const handleLogin = async () => {
    isLoading.value = true;
    try {
        const response = await axios.post("/login", {
            email: email.value,
            password: password.value,
        });
        console.log(response.data);
        login(response.data.data);
        if (response.data.data.roles && response.data.data.token) {
            console.log("first", response.data.data.roles);
            router.push("/" + response.data.data.roles);
        }
    } catch (error) {
        console.error(error);
    } finally {
        isLoading.value = false;
    }
};
</script>
