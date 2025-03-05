<template>
    <div class="bg-white">
        <section
            class="flex flex-col w-full h-[350px] lg:h-[600px] bg-cover bg-fixed bg-center justify-center items-center bg-[url('../assets/206.jpg')]">
            <div class="relative flex flex-col w-full h-[350px] justify-center items-center mt-24 bg-transparent">
                <div class="max-w-[70em] w-full px-8 py-4">
                    <div class="mt-32">
                        <span class="text-gray-50 text-2xl lg:text-4xl" v-motion="getRandomMotionPreset()">
                            Frequently asked questions
                        </span>
                    </div>
                </div>
            </div>
        </section>

        <div class="w-full min-h-screen flex justify-center">
            <section class="bg-white">
                <div class="px-4 mx-auto max-w-screen-xl sm:py-16 lg:px-6">
                    <h2 class="mb-8 text-2xl tracking-tight font-extrabold mt-10 text-gray-900"></h2>

                    <div class="grid pt-8 text-left border-t border-gray-200 md:gap-16 md:grid-cols-2">
                        <div>
                            <div v-for="(faq, index) in faqsLeft" :key="index" class="mb-10"
                                v-motion="getRandomMotionPreset()">
                                <h3 class="flex items-center mb-4 text-lg font-medium text-gray-900">
                                    <i class="pi pi-question-circle me-2 text-base"></i>
                                    {{ faq.title }}
                                </h3>
                                <p class="">{{ faq.text }}</p>
                            </div>
                        </div>

                        <div>
                            <div v-for="(faq, index) in faqsRight" :key="index" class="mb-10"
                                v-motion="getRandomMotionPreset()">
                                <h3 class="flex items-center mb-4 text-lg font-medium text-gray-900">
                                    <i class="pi pi-question-circle me-2 text-base"></i>
                                    {{ faq.title }}
                                </h3>
                                <p class="">{{ faq.text }}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <section class="flex justify-center">
            <div class="p-4 w-full max-w-screen-md mb-12 pb-6" v-motion="getRandomMotionPreset()">
                <h2 class="text-lg font-lg mb-6 text-gray-900 text-center">Got more Questions? Contact Us</h2>
                <div class="flex flex-col md:flex-row md:space-x-8 space-y-4 md:space-y-0 justify-center">
                    <div class="flex items-center">
                        <i class="pi pi-phone text-xl text-gray-700 mr-4"></i>
                        <a :href="`tel:${phone}`" class="text-lg text-gray-700 hover:text-blue-500">{{ phone }}</a>
                    </div>
                    <div class="flex items-center">
                        <i class="pi pi-whatsapp text-xl text-green-500 mr-4"></i>
                        <a :href="`https://wa.me/${phone}`"
                            class="text-lg text-gray-700 hover:text-green-500">WhatsApp</a>
                    </div>
                    <div class="flex items-center">
                        <i class="pi pi-instagram text-xl text-pink-500 mr-4"></i>
                        <a href="https://www.instagram.com/yourprofile"
                            class="text-lg text-gray-700 hover:text-pink-500">Instagram</a>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script setup>
import { inject } from 'vue';

const motionPresets = inject("motionPresets");

const phone = "+254725633577";

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

function getRandomMotionPreset() {
    const presets = [
        motionPresets.fadeUp(Math.random() * 300),
        motionPresets.fadeIn(Math.random() * 300),
        motionPresets.fadeLeft(Math.random() * 300),
        motionPresets.fadeRight(Math.random() * 300),
        motionPresets.fadeDown(Math.random() * 300),
    ];
    return presets[Math.floor(Math.random() * presets.length)];
}
</script>

<style scoped></style>
