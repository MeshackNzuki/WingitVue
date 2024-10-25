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
        const codesData = response.data.map((country) => ({
            name: country.name.common,
            code:
                country.idd.root +
                (country.idd.suffixes && country.idd.suffixes.length > 0
                    ? country.idd.suffixes[0]
                    : ""),
        }));

        countryCodes.value = codesData
            .filter((c) => c.code)
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

onMounted(fetchCountryCodes);
</script>

<template>
    <select
        id="countryCode"
        class="w-24 text-gray-700 rounded-md p-1"
        :name="name"
        :value="modelValue?.code"
        @input="updateValue"
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
