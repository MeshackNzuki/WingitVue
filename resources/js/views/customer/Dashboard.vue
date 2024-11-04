<template>
    <div
        class="bg-slate-100 dark:bg-transparent min-h-screen p-2 bg-[url('../assets/hiw.jpg')] bg-cover"
    >
        <span class="font-semibold text-base">
            {{
                mainStore.greetings +
                ", " +
                (user.name.split(" ")[0] || user.company_name) +
                "!"
            }}</span
        >
        <div class="grid grid-cols-2 md:grid-cols-3 gap-4 mt-4">
            <div class="flex h-24 justify-center items-center p-4">
                <div
                    class="bg-sky-100 shadow-sm rounded-lg p-4 text-base text-center w-full max-w-xs"
                >
                    <router-link to="/">
                        <div><i class="pi pi-plus"></i></div>
                        <div>Book a trip</div>
                    </router-link>
                </div>
            </div>
            <div class="flex h-24 justify-center items-center p-2">
                <div
                    class="bg-sky-100 shadow-sm rounded-lg p-4 text-base text-center w-full max-w-xs"
                >
                    <router-link to="/customer/bookings">
                        <div><i class="pi pi-history"></i></div>
                        <div>
                            Bookings {{ mainStore.customerData.bookings }}
                        </div>
                    </router-link>
                </div>
            </div>
            <div class="flex h-24 justify-center items-center p-2">
                <div
                    class="bg-sky-100 shadow-sm rounded-lg p-4 text-base text-center w-full max-w-xs"
                >
                    <router-link to="/customer/previous-bookings">
                        <div><i class="pi pi-calendar-clock"></i></div>
                        <div>
                            Previous Bookings
                            {{ mainStore.customerData.previous_bookings }}
                        </div>
                    </router-link>
                </div>
            </div>
            <div class="flex justify-center items-center p-2">
                <div
                    class="bg-sky-100 shadow-sm rounded-lg p-4 text-base text-center w-full max-w-xs"
                >
                    <router-link to="/customer/trips">
                        <div><i class="pi pi-map-marker"></i></div>
                        <div>Places {{ mainStore.customerData.bookings }}</div>
                    </router-link>
                </div>
            </div>
            <div class="flex justify-center items-center p-2">
                <div
                    class="bg-sky-100 shadow-sm rounded-lg p-4 text-base text-center w-full max-w-xs"
                >
                    <router-link to="/customer/fun-things">
                        <div><i class="pi pi-sparkles"></i></div>
                        <div>Fun Things</div>
                    </router-link>
                </div>
            </div>
            <div class="flex justify-center items-center p-2">
                <div
                    class="bg-sky-100 shadow-sm rounded-lg p-4 text-base text-center w-full max-w-xs"
                >
                    <router-link to="/customer/packinglist">
                        <div><i class="pi pi-briefcase"></i></div>
                        <div><i class="pi pi-plus"></i> Parking Lists</div>
                    </router-link>
                </div>
            </div>
        </div>
    </div>
</template>
<script setup>
import CommonButton from "../../components/Buttons/CommonButton.vue";
import { useMainStore } from "../../stores";
import { authStore } from "../../stores/authStore";

const { user, is_authenticated } = authStore();

const mainStore = useMainStore();

const fetchDashData = async () => {
    const response = await axios.get("/dashdata-client");
    mainStore.setDashDataCustomer(response.data);
};

fetchDashData();
</script>
