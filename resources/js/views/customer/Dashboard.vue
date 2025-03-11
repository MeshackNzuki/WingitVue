<template>
    <div
        class="bg-slate-100 dark:bg-transparent min-h-screen p-2 bg-[url('../assets/hiw.jpg')] bg-cover bg-center bg-fixed">
        <span class="font-semibold text-base">
            {{
                mainStore.greetings +
                ", " +
                (user.name.split(" ")[0] || user.company_name) +
                "!"
            }}</span>
        <div class="grid grid-cols-2 md:grid-cols-3 gap-4 mt-4">
            <div class="flex h-24 justify-center items-center p-4">
                <div class="bg-sky-100 shadow-sm rounded-lg p-4 text-base text-center w-full max-w-xs">
                    <router-link to="/">
                        <div><i class="pi pi-plus"></i></div>
                        <div>Book a trip</div>
                    </router-link>
                </div>
            </div>
            <div class="flex h-24 justify-center items-center p-2">
                <div class="bg-sky-100 shadow-sm rounded-lg p-4 text-base text-center w-full max-w-xs">
                    <router-link to="/customer/bookings">
                        <div><i class="pi pi-history"></i></div>
                        <div>
                            Bookings {{ mainStore.customerData.bookings }}
                        </div>
                    </router-link>
                </div>
            </div>
            <div class="flex h-24 justify-center items-center p-2">
                <div class="bg-sky-100 shadow-sm rounded-lg p-4 text-base text-center w-full max-w-xs">
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
                <div class="bg-sky-100 shadow-sm rounded-lg p-4 text-base text-center w-full max-w-xs">
                    <router-link to="/customer/trips">
                        <div><i class="pi pi-map-marker"></i></div>
                        <div>Places {{ mainStore.customerData.bookings }}</div>
                    </router-link>
                </div>
            </div>
            <div class="flex justify-center items-center p-2">
                <div class="bg-sky-100 shadow-sm rounded-lg p-4 text-base text-center w-full max-w-xs">
                    <router-link to="/customer/fun-things">
                        <div><i class="pi pi-sparkles"></i></div>
                        <div>Fun Things</div>
                    </router-link>
                </div>
            </div>
            <div class="flex justify-center items-center p-2">
                <div class="bg-sky-100 shadow-sm rounded-lg p-4 text-base text-center w-full max-w-xs">
                    <router-link to="/customer/packing">
                        <div><i class="pi pi-briefcase"></i></div>
                        <div><i class="pi pi-plus"></i> Parking Lists</div>
                    </router-link>
                </div>
            </div>
        </div>
        <div class="w-full text-center font-semibold my-6">
            Fun things
        </div>
        <div class="w-full flex justify-center bg-cover bg-center bg-no-repeat"
            style="background-image: url('/bg.jpg');">
            <div class="max-w-screen-2xl flex flex-wrap justify-center gap-4 m-4 lg:m-8">
                <div class="card w-full max-w-xs sm:max-w-sm md:max-w-md lg:w-96 glass">
                    <figure class="w-full h-48 overflow-hidden">
                        <img class="w-full h-full object-cover" src="../../assets/byz.jpg" alt="nature" />
                    </figure>
                    <div class="card-body">
                        <h2 class="card-title">Business Travel</h2>
                        <p>
                            Offering a service to help make every business trip less time-consuming and more efficient.
                            When it comes to business, we know it's important to save time and money.
                        </p>
                    </div>
                </div>
                <div class="card w-full max-w-xs sm:max-w-sm md:max-w-md lg:w-96 glass">
                    <figure class="w-full h-48 overflow-hidden">
                        <img class="w-full h-full object-cover" src="../../assets/wildlife.jpg" alt="hike" />
                    </figure>
                    <div class="card-body text-gray-50 lg:text-gray-700">
                        <h2 class="card-title">Safari Adventure</h2>
                        <p>
                            Embark on your next adventure to explore some of Kenya's most wild and breathtaking
                            destinations while witnessing incredible wildlife and scenery from the air.
                        </p>
                    </div>
                </div>
                <div class="card w-full max-w-xs sm:max-w-sm md:max-w-md lg:w-96 glass">
                    <figure class="w-full h-48 overflow-hidden">
                        <img class="w-full h-full object-cover" src="../../assets/Recreation.jpg" alt="" />
                    </figure>
                    <div class="card-body text-gray-50 lg:text-gray-700">
                        <h2 class="card-title">Recreation</h2>
                        <p>
                            Whether you are dreaming of a beach holiday, safari escape or reunion with family or
                            friends,
                            we will take you there in comfort, safety, and style.
                        </p>
                    </div>
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
