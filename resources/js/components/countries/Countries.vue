<script setup>
import { ref, onMounted } from "vue";

// Define props
const props = defineProps({
  modelValue: String,  // This will bind the selected country value
  name: String
});
const emit = defineEmits(["update:modelValue"]); // Emit event for v-model updates

// Define countries data
const countries = ref([]);

// Fetch countries data
const fetchCountries = async () => {
  try {
    const response = await fetch("https://restcountries.com/v3.1/all");
    const data = await response.json();
    countries.value = data.sort((a, b) =>
      a.name.common.localeCompare(b.name.common)
    );
  } catch (error) {
    console.error("Error fetching countries:", error);
  }
};

// Emit the selected country name on change
const updateCountry = (event) => {
  emit("update:modelValue", event.target.value); // Emit the selected country name
};

// Fetch countries on mount
onMounted(fetchCountries);
</script>

<template>
  <select
    @change="updateCountry"
    :name="props.name"
    class="focus:outline-none left-0 text-left px-3 text-sm w-1/2 p-2 rounded-lg"
    :value="props.modelValue" 
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
