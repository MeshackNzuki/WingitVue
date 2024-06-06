<template>
    <div
        class="flex flex-wrap justify-around my-6 bg-slate-100 dark:bg-transparent py-12 w-full gap-4"
    >
        <StatCard /> <StatCard /> <StatCard /> <StatCard /><StatCard />
    </div>
    <div class="flex flex-wrap mt-4">
        <div class="w-full xl:w-8/12 mb-12 xl:mb-0 px-4">
            <!-- <card-page-visits /> -->
        </div>
        <div class="w-full xl:w-4/12 px-4">
            <!-- <card-social-traffic /> -->
        </div>
    </div>
</template>
<script setup>
import StatCard from "../../components/Stats/Primary.vue";
</script>
