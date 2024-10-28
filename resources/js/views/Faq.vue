<template>
    <div class="bg-white">
        <section
            class="flex flex-col w-full h-[350px] lg:h-[600px] bg-cover bg-fixed bg-center justify-center items-center bg-[url('../assets/206.jpg')]"
        >
            <div
                class="relative flex flex-col w-full h-[350px] justify-center items-center mt-24 bg-transparent"
            >
                <div class="max-w-[70em] w-full px-8 py-4">
                    <div class="mt-32">
                        <span class="text-gray-50 text-2xl lg:text-4xl">
                            Frequently asked questions
                        </span>
                    </div>
                </div>
            </div>
        </section>

        <div class="w-full min-h-screen flex justify-center">
            <section class="bg-white">
                <div class="px-4 mx-auto max-w-screen-xl sm:py-16 lg:px-6">
                    <h2
                        class="mb-8 text-2xl tracking-tight font-extrabold mt-10 text-gray-900"
                    ></h2>

                    <div
                        class="grid pt-8 text-left border-t border-gray-200 md:gap-16 md:grid-cols-2"
                    >
                        <div>
                            <div
                                v-for="(faq, index) in faqsLeft"
                                :key="index"
                                class="mb-10"
                            >
                                <h3
                                    class="flex items-center mb-4 text-lg font-medium text-gray-900"
                                >
                                    <svg
                                        class="flex-shrink-0 mr-2 w-5 h-5 text-gray-500"
                                        fill="currentColor"
                                        viewBox="0 0 20 20"
                                        xmlns="http://www.w3.org/2000/svg"
                                    >
                                        <path
                                            fill-rule="evenodd"
                                            d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-8-3a1 1 0 00-.867.5 1 1 0 11-1.731-1A3 3 0 0113 8a3.001 3.001 0 01-2 2.83V11a1 1 0 11-2 0v-1a1 1 0 011-1 1 1 0 100-2zm0 8a1 1 0 100-2 1 1 0 000 2z"
                                            clip-rule="evenodd"
                                        />
                                    </svg>
                                    {{ faq.title }}
                                </h3>
                                <p class="text-gray-500">{{ faq.text }}</p>
                            </div>
                        </div>

                        <div>
                            <div
                                v-for="(faq, index) in faqsRight"
                                :key="index"
                                class="mb-10"
                            >
                                <h3
                                    class="flex items-center mb-4 text-lg font-medium text-gray-900"
                                >
                                    <svg
                                        class="flex-shrink-0 mr-2 w-5 h-5 text-gray-500"
                                        fill="currentColor"
                                        viewBox="0 0 20 20"
                                        xmlns="http://www.w3.org/2000/svg"
                                    >
                                        <path
                                            fill-rule="evenodd"
                                            d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-8-3a1 1 0 00-.867.5 1 1 0 11-1.731-1A3 3 0 0113 8a3.001 3.001 0 01-2 2.83V11a1 1 0 11-2 0v-1a1 1 0 011-1 1 1 0 100-2zm0 8a1 1 0 100-2 1 1 0 000 2z"
                                            clip-rule="evenodd"
                                        />
                                    </svg>
                                    {{ faq.title }}
                                </h3>
                                <p class="text-gray-500">{{ faq.text }}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</template>

<script setup>
const faqsLeft = [
    {
        title: "How do I create a client account?",
        text: 'To create an account, click the "Sign Up" button in the top right corner of the page and follow the instructions.',
    },
    {
        title: "How do I create an operator account?",
        text: `On the top bar on Homepage click on operators and select from the dropdown. Follow the instructions thereafter. Kindly note that your account has to be verified as per our terms. After verification, an email will be sent to you.`,
    },
    {
        title: "How can I book a flight?",
        text: `Booking a flight is easy! Simply visit our website or use our mobile app, enter your travel details, including departure and arrival locations, dates, and any specific requirements you may have. Our system will provide you with available options to choose from.`,
    },
];

const faqsRight = [
    {
        title: "What safety measures are in place for flights?",
        text: `Safety is our top priority. All aircraft in our network comply with stringent safety regulations. Our experienced pilots and crew members undergo regular training, and our aircraft are maintained to the highest standards. Rest assured, your safety is paramount throughout your experience.`,
    },
    {
        title: "Can I make changes to my booking after it's confirmed?",
        text: `Yes, you can make changes to your booking, subject to availability and our terms and conditions. If you need to adjust your travel dates, passenger list, or other details, simply reach out to our customer support team, and they'll assist you in making the necessary modifications.`,
    },
];
</script>

<style scoped>
/* Add any custom styles here */
</style>
