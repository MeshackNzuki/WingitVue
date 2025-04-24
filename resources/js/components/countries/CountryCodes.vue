<script setup>
import { ref, onMounted } from "vue";
import axios from "axios";

const props = defineProps({
    modelValue: Object, // Expecting an object with `name` and `code`
    name: String,
});
const emit = defineEmits(["update:modelValue"]); // Emit event for v-model updates

const countryCodes = ref([]);

const fetchCountryCodes = async () => {

    try {
        const response = await axios.get("https://restcountries.com/v3.1/all");
        const codesData = response.data.map((country) => {
            const root = country.idd?.root || "";
            const suffixes = country.idd?.suffixes || []; // All suffixes
            const code = suffixes.length > 1 ? root : root + (suffixes[0] || "");

            return {
                name: country.name.common,
                code: code, // Ensure correct dialing code
            };
        });

        countryCodes.value = codesData
            .filter((c) => c.code) // Ensure valid codes
            .sort((a, b) => a.name.localeCompare(b.name));

        // Set the first country as default if modelValue is empty
        if (!props.modelValue && countryCodes.value.length > 0) {
            emit("update:modelValue", countryCodes.value[0]);
        }
    } catch (error) {
        console.error("Error fetching country codes:", error);
    }
};




// Emit both country name and code when a new selection is made
const updateValue = (event) => {
    const selectedCountry = countryCodes.value.find(
        (country) => country.code === event.target.value,
    );
    emit("update:modelValue", selectedCountry || { name: "", code: "" });
};

onMounted(() => {

    fetchCountryCodes();

    const interval = setInterval(() => {
        if (countryCodes.value.length === 0) {
            console.warn('Retrying fetchCountries and coeds...');
            fetchCountryCodes();
        } else {
            clearInterval(interval); // Stop once data is loaded
        }
    }, 3000);
});
</script>

<template>
    <select id="countryCode" class="w-24  rounded-md p-1" :name="name" :value="modelValue?.code" @input="updateValue">
        <option v-if="countryCodes.length === 0">Loading...</option>
        <option v-else v-for="country in countryCodes" :key="country.code" :value="country.code">
            {{ country.name }} ({{ country.code }})
        </option>
    </select>
</template>
