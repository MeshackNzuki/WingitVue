<script setup>
import { ref, onMounted } from "vue";

const props = defineProps(["action", "name"]);
const countries = ref([]);

const fetchCountries = async () => {
    try {
        const response = await fetch("https://restcountries.com/v3.1/all");
        const data = await response.json();
        countries.value = data.sort((a, b) =>
            a.name.common.localeCompare(b.name.common),
        );
    } catch (error) {
        console.error("Error fetching countries:", error);
    }
};

onMounted(fetchCountries);
</script>

<template>
    <select
        @change="props.action"
        :name="props.name"
        class="focus:outline-none left-0 text-left px-3 text-sm w-1/2 p-2 rounded-lg"
        default-value="Kenya"
    >
        <option
            v-for="country in countries"
            :key="country.name.common"
            :value="country.name.common"
        >
            {{ country.name.common }}
        </option>
    </select>
</template>
