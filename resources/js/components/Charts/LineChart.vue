<template>
    <Line
        class="bg-white rounded-lg shadow-lg m-2 dark:bg-slate-300 text-white"
        :data="data"
        :options="options"
    />
</template>

<script lang="ts">
import {
    Chart as ChartJS,
    CategoryScale,
    LinearScale,
    PointElement,
    LineElement,
    Title,
    Tooltip,
    Legend,
} from "chart.js";
import { Line } from "vue-chartjs";

ChartJS.register(
    CategoryScale,
    LinearScale,
    PointElement,
    LineElement,
    Title,
    Tooltip,
    Legend,
);

export default {
    name: "App",
    components: {
        Line,
    },
    data() {
        return {
            data: {
                labels: [
                    "January",
                    "February",
                    "March",
                    "April",
                    "May",
                    "June",
                    "July",
                    "August",
                    "September",
                    "October",
                    "November",
                    "December",
                ],
                datasets: [
                    {
                        label: "Data One",
                        backgroundColor: "#f87979",
                        data: [40, 39, 10, 40, 39, 80, 40],
                    },
                ],
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
            },
        };
    },
};
</script>
