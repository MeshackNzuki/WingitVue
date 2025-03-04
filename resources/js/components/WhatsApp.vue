<!-- ChatMenu.vue -->
<template>
    <div class="relative">
        <button @click="toggleFabAndMenu"
            class="fixed bottom-5 right-5 p-3 size-14 rounded-full bg-green-600 text-white shadow-lg hover:bg-green-700 transition duration-200">
            <i :class="fab ? 'pi pi-times ' : 'pi pi-comments text-3xl'"></i>
        </button>

        <transition name="fade">
            <div v-if="menu" class="fixed bottom-20 right-2 md:right-6 w-80 bg-[#ece5dd] rounded-lg shadow-lg">
                <div class="flex items-center justify-between bg-teal-600 text-white p-3 rounded-t-lg">
                    <span class="font-semibold">
                        <div class="avatar online">
                            <div class="w-12 rounded-full">
                                <img :src="Ryan" />
                            </div>
                        </div>
                    </span>
                    <button @click="closeMenu" class="text-white">
                        <i class="pi pi-times"></i>
                    </button>
                </div>
                <div class="p-4">
                    <div class="chat chat-end">
                        <div class="chat-image avatar">
                            <div class="w-10 rounded-full">
                                <img alt="Tailwind CSS chat bubble component" :src="Ryan" />
                            </div>
                        </div>
                        <div class="chat-header">
                            Wingit
                            <time class="text-xs opacity-50">Just now</time>
                        </div>
                        <div class="chat-bubble px-2 py-1 text-sm bg-lime-200 text-gray-600">
                            Hello, how can we help you?
                        </div>
                        <div class="chat-footer opacity-50">delivered</div>
                    </div>
                    <div class="flex">
                        <input type="text" v-model="text" placeholder="Reply to this message..."
                            class="flex-1 border border-gray-300 rounded-full py-1 px-2 focus:outline-none focus:ring focus:ring-teal-700" />
                        <a :href="apilink" target="_blank"
                            class="ml-1 flex items-center justify-center w-12 h-12 bg-green-600 text-white rounded-full hover:bg-green-700 transition duration-200">
                            <i class="pi pi-send"></i>
                        </a>
                    </div>
                </div>
            </div>
        </transition>
    </div>
</template>

<script setup>
import { ref, watch, onMounted } from "vue";
import Ryan from "../assets/team/ryan.png";

const fab = ref(false);
const menu = ref(false);
const text = ref("");
const phone = "+254725633577"; // Directly assign phone number
const apilink = ref("");

// Method to toggle the FAB button and show/hide the menu
const toggleFabAndMenu = () => {
    fab.value = !fab.value;
    menu.value = fab.value; // Show menu if fab is active
};

// Method to close the menu
const closeMenu = () => {
    fab.value = false;
    menu.value = false;
};

// Method to determine if the user is on a mobile device
const isMobile = () => {
    const userAgent = navigator.userAgent || navigator.vendor || window.opera;
    return /android|bb\d+|meego.+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge|maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm os|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.browser|vodafone|wap|windows ce|xda/i.test(
        userAgent,
    );
};

// Watcher to update `apilink` whenever `text` changes
watch(text, (newValue) => {
    updateApiLink(newValue);
});

// Initialize `apilink` on component creation
onMounted(() => {
    updateApiLink("Hello!");
    const intervalId = setInterval(() => {
        menu.value = true;
    }, 30000);

    setTimeout(() => {
        menu.value = false;
        clearInterval(intervalId);
    }, 40000);
});

// Helper function to update the WhatsApp link
const updateApiLink = (message) => {
    apilink.value = `http://${isMobile() ? "api" : "web"}.whatsapp.com/send?phone=${phone}&text=${encodeURIComponent(message)}`;
};
</script>

<style scoped>
.fade-enter-active,
.fade-leave-active {
    transition: opacity 0.5s;
}

.fade-enter,
.fade-leave-to {
    opacity: 0;
}
</style>
