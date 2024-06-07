<template>
    <div class="bg-slate-100 dark:bg-transparent min-h-screen">
        <div class="flex flex-wrap justify-around my-6 py-12 w-full gap-4">
            <StatCard /> <StatCard /> <StatCard /> <StatCard /><StatCard />
        </div>
        <div class="flex mt-4">
            <div
                class="w-full flex flex-col md:flex-row justify-around items-center"
            >
                <div class="w-full md:w-1/4 flex justify-center h-[40vh]">
                    <DoughnutChart />
                </div>
                <div class="w-full md:w-1/4 flex justify-center h-[40vh]">
                    <LineChart />
                </div>
                <div class="w-full md:w-2/4 flex justify-center h-[40vh]">
                    <BarChart />
                </div>
            </div>
        </div>
    </div>
</template>
<script setup>
import StatCard from "../../components/Stats/Primary.vue";
import BarChart from "../../components/Charts/BarChart.vue";
import LineChart from "../../components/Charts/LineChart.vue";
import DoughnutChart from "../../components/Charts/DoughnutChart.vue";
</script>
