<template>
    <div class="bg-slate-100 dark:bg-sky-950 min-h-screen rounded-md">
        <div class="flex flex-wrap justify-around my-6 py-12 w-full gap-4">
            <StatCard label="All flights" description="verified"
                :quantity="mainStore.airOpData.all_flights_count || '0'" icon="pi pi-th-large" />
            <StatCard label="Listed flights" description="Approved"
                :quantity="mainStore.airOpData.listed_flights_count || '0'" icon="pi pi-list" />
            <StatCard label="My pilots" description="Approved" :quantity="mainStore.airOpData.pilots_count || '0'"
                icon="pi pi-user" />
            <StatCard label="Trips" description="32% Increase"
                :quantity="mainStore.airOpData.total_revenue_count || '0'" icon="pi pi-sync" />
        </div>
        <div class="flex mt-4">
            <div class="w-full flex flex-col md:flex-row justify-evenly items-center">
                <div class="w-full flex flex-col justify-center items-center h-[30vh]">
                    <div class="flex flex-col gap-4 mb-4">
                        <div class="flex flex-row gap-4">
                            <SmallStatCard :quantity="mainStore.airOpData.total_revenue_count
                                " />
                            <SmallStatCard />
                        </div>
                        <div class="flex flex-row gap-4">
                            <SmallStatCard />
                            <SmallStatCard />
                        </div>
                    </div>
                    <div class="flex flex-wrap gap-4">
                        <div class="radial-progress shadow-lg opacity-90 bg-white text-orange-500" style="--value: 89"
                            role="progressbar">
                            89%
                        </div>
                        <div class="radial-progress shadow-lg opacity-90 bg-white text-emerald-500" style="--value: 70"
                            role="progressbar">
                            70%
                        </div>
                        <div class="radial-progress shadow-lg opacity-90 bg-white text-lime-500" style="--value: 40"
                            role="progressbar">
                            40%
                        </div>
                    </div>
                </div>
                <div class="w-full flex justify-center h-[30vh]">
                    <LineChart />
                </div>
                <div class="w-full flex justify-center h-[30vh]">
                    <DoughnutChart />
                </div>
            </div>
        </div>
        <div class="flex mt-6 pt-6">
            <div class="w-full flex flex-col md:flex-row justify-around items-center gap-4">
                <CardMain title="Useful links">
                    <ul class="menu rounded-box w-full">
                        <li>
                            <details close>
                                <summary>Users</summary>
                                <ul>
                                    <li><a>Submenu 1</a></li>
                                    <li><a>Submenu 2</a></li>
                                </ul>
                            </details>
                        </li>
                        <li>
                            <details close>
                                <summary>Statements</summary>
                                <ul>
                                    <li><a>Submenu 1</a></li>
                                    <li><a>Submenu 2</a></li>
                                </ul>
                            </details>
                        </li>
                        <li>
                            <details close>
                                <summary>Profile</summary>
                                <ul>
                                    <li><a>Submenu 1</a></li>
                                    <li><a>Submenu 2</a></li>
                                </ul>
                            </details>
                        </li>
                        <li>
                            <details close>
                                <summary>Check docs</summary>
                                <ul>
                                    <li><a>Submenu 1</a></li>
                                    <li><a>Submenu 2</a></li>
                                </ul>
                            </details>
                        </li>
                        <li>
                            <details close>
                                <summary>AirCrafts</summary>
                                <ul>
                                    <li><a>Submenu 1</a></li>
                                    <li><a>Submenu 2</a></li>
                                </ul>
                            </details>
                        </li>
                    </ul>
                    <router-link to="/admin/users">
                        <commonButton button-text="View All ..." />
                    </router-link>
                </CardMain>
                <div class="flex-1 h-full">
                    <BarChart />
                </div>

                <Calendar class="shadow-lg" inline showWeek />
            </div>
        </div>
    </div>
</template>
<script setup>
import StatCard from "../../components/Stats/Primary.vue";
import SmallStatCard from "../../components/Stats/Small.vue";
import Calendar from "primevue/calendar";
import BarChart from "../../components/Charts/BarChart.vue";
import LineChart from "../../components/Charts/LineChart.vue";
import DoughnutChart from "../../components/Charts/DoughnutChart.vue";
import CardMain from "../../components/Card/CardMain.vue";
import { useMainStore } from "../../stores";
import CommonButton from "../../components/Buttons/CommonButton.vue";
import axios from "axios";

const mainStore = useMainStore();

const fetchDashData = async () => {
    const response = await axios.get("/dashdata-airop");
    mainStore.setDashDataAirOp(response.data);
};
fetchDashData();
</script>
