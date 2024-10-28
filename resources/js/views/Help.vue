<template>
    <div
        class="bg-[url('../assets/homeh.jpg')] bg-cover bg-no-repeat lg:bg-contain"
    >
        <div class="container mx-auto px-6 text-gray-800 md:px-12 xl:px-6">
            <main>
                <div
                    class="relative flex items-top justify-center min-h-screen gray-900 sm:items-center sm:pt-0"
                >
                    <div class="max-w-6xl mx-auto mt-24 sm:px-6 lg:px-8">
                        <div class="mt-8 overflow-hidden">
                            <div class="grid grid-cols-1 md:grid-cols-2">
                                <!-- Contact Information Section -->
                                <div
                                    class="p-6 mr-2 bg-gray-100 bg-opacity-75 sm:rounded-lg"
                                >
                                    <h1
                                        class="text-4xl sm:text-5xl text-base white font-extrabold tracking-tight"
                                    >
                                        Talk to us
                                    </h1>
                                    <p
                                        class="text-normal text-lg sm:text-2xl font-medium mt-2 libre-caslon"
                                    >
                                        Fill in the form to start a conversation
                                    </p>

                                    <div
                                        class="flex items-center mt-8 text-gray-800"
                                    >
                                        <svg
                                            fill="none"
                                            stroke="currentColor"
                                            strokeLinecap="round"
                                            strokeLinejoin="round"
                                            strokeWidth="1.5"
                                            viewBox="0 0 24 24"
                                            class="w-8 h-8 text-gray-800"
                                        >
                                            <path
                                                strokeLinecap="round"
                                                strokeLinejoin="round"
                                                strokeWidth="1.5"
                                                d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"
                                            />
                                            <path
                                                strokeLinecap="round"
                                                strokeLinejoin="round"
                                                strokeWidth="1.5"
                                                d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"
                                            />
                                        </svg>
                                        <div
                                            class="ml-4 text-md tracking-wide w-40"
                                        >
                                            Aero Club Nairobi, Kenya
                                        </div>
                                    </div>

                                    <div
                                        class="flex items-center mt-4 text-gray-800"
                                    >
                                        <svg
                                            fill="none"
                                            stroke="currentColor"
                                            strokeLinecap="round"
                                            strokeLinejoin="round"
                                            strokeWidth="1.5"
                                            viewBox="0 0 24 24"
                                            class="w-8 h-8 text-gray-800"
                                        >
                                            <path
                                                strokeLinecap="round"
                                                strokeLinejoin="round"
                                                strokeWidth="1.5"
                                                d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"
                                            />
                                        </svg>
                                        <div
                                            class="ml-4 text-md tracking-wide w-40"
                                        >
                                            0725633577
                                        </div>
                                    </div>

                                    <div
                                        class="flex items-center mt-2 text-gray-800"
                                    >
                                        <svg
                                            fill="none"
                                            stroke="currentColor"
                                            strokeLinecap="round"
                                            strokeLinejoin="round"
                                            strokeWidth="1.5"
                                            viewBox="0 0 24 24"
                                            class="w-8 h-8 text-gray-800"
                                        >
                                            <path
                                                strokeLinecap="round"
                                                strokeLinejoin="round"
                                                strokeWidth="1.5"
                                                d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"
                                            />
                                        </svg>
                                        <div
                                            class="ml-4 text-md tracking-wide w-40"
                                        >
                                            support@wingit.co.ke
                                        </div>
                                    </div>
                                </div>

                                <!-- Contact Form Section -->
                                <form
                                    class="p-6 flex flex-col justify-center"
                                    @submit.prevent="notify"
                                >
                                    <div class="flex flex-col">
                                        <label for="name" class="hidden"
                                            >Full Name</label
                                        >
                                        <input
                                            type="text"
                                            v-model="formData.name"
                                            id="name"
                                            placeholder="Full Name"
                                            class="w-full mt-2 py-3 px-3 rounded-lg bg-white bg-opacity-75 border border-gray-400 text-black focus:border-indigo-500 focus:outline-none"
                                        />
                                    </div>

                                    <div class="flex flex-col mt-2">
                                        <label for="email" class="hidden"
                                            >Email</label
                                        >
                                        <input
                                            type="email"
                                            v-model="formData.email"
                                            id="email"
                                            placeholder="Email"
                                            class="w-full mt-2 py-3 px-3 rounded-lg bg-white bg-opacity-75 border border-gray-400 text-black focus:border-indigo-500 focus:outline-none"
                                        />
                                    </div>

                                    <div class="flex flex-col mt-2">
                                        <label for="tel" class="hidden"
                                            >Number</label
                                        >
                                        <input
                                            type="tel"
                                            v-model="formData.tel"
                                            id="tel"
                                            placeholder="Telephone Number"
                                            class="w-full mt-2 py-3 px-3 rounded-lg bg-white bg-opacity-75 border border-gray-400 text-black focus:border-indigo-500 focus:outline-none"
                                        />
                                    </div>

                                    <div class="flex flex-col mt-2">
                                        <label for="message" class="hidden"
                                            >Message</label
                                        >
                                        <textarea
                                            v-model="formData.message"
                                            id="message"
                                            placeholder="Your Message"
                                            class="w-full mt-2 py-3 px-3 rounded-lg bg-white bg-opacity-75 border border-gray-400 text-black focus:border-indigo-500 focus:outline-none"
                                        ></textarea>
                                    </div>

                                    <button
                                        type="submit"
                                        class="md:w-32 bg-base hover:bg-second text-gray-50 font-light py-3 px-6 rounded-full mt-3 hover:text-gray-800 transition ease-in-out duration-300"
                                    >
                                        Submit
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
</template>

<script>
import { ref } from "vue";
import { toast } from "vue3-toastify";

export default {
    setup() {
        const formData = ref({
            name: "",
            email: "",
            tel: "",
            message: "",
        });

        const notify = () => {
            toast("Message sent!");
            // Clear form after submission
            formData.value = {
                name: "",
                email: "",
                tel: "",
                message: "",
            };
        };

        return {
            formData,
            notify,
        };
    },
};
</script>

<style scoped>
.libre-caslon {
    font-family: "Libre Caslon Text", serif;
}
</style>
