<script setup>
import { ref, onMounted } from "vue";
import axios from "axios";

const props = defineProps(["action", "name"]);
const countryCodes = ref([]);

const fetchCountryCodes = async () => {
    try {
        const response = await axios.get("https://restcountries.com/v3.1/all");
        const codesData = response.data.map((country) => ({
            name: country.name.common,
            code:
                country.idd.root +
                (country.idd.suffixes && country.idd.suffixes.length > 0
                    ? country.idd.suffixes[0]
                    : ""),
        }));

        countryCodes.value = codesData
            .filter((c) => c.code) // Only include countries with valid codes
            .sort((a, b) => a.name.localeCompare(b.name));
    } catch (error) {
        console.error("Error fetching country codes:", error);
    }
};

onMounted(fetchCountryCodes);
</script>

<template>
    <select
        id="countryCode"
        class="w-24 text-gray-400"
        @change="props.action"
        :name="props.name"
        default-value="+254"
    >
        <option v-if="countryCodes.length === 0">Loading...</option>
        <option
            v-else
            v-for="country in countryCodes"
            :key="country.code"
            :value="country.code"
        >
            {{ country.name }} ({{ country.code }})
        </option>
    </select>
</template>
