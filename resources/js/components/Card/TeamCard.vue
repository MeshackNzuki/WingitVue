<template>
    <div class="w-full bg-gray-50 rounded-2xl p-6 md:p-12 flex flex-col justify-center items-center shadow-md">
        <div class="mb-4 relative">
            <!-- Rounded image -->

            <img width="100" height="100" :src="imageSrc" :alt="name" class="object-cover rounded-full h-36 w-36" />
        </div>
        <div class="text-center">
            <p class="text-xl  mb-1">{{ name }}</p>
            <p class="text-base  font-normal">{{ title }}</p>
        </div>
        <!-- Toggle description with "Read More" -->
        <div class=" mt-2">
            {{ showFullDescription ? description : truncatedDescription }}
            <span v-if="description.length > 70" class="text-sky-500 cursor-pointer ml-2" @click="toggleDescription">
                {{ showFullDescription ? "Read Less" : "Read More" }}
            </span>
        </div>
    </div>
</template>

<script setup>
import { defineProps, ref, computed } from "vue";

const props = defineProps({
    name: String,
    title: String,
    imageSrc: String,
    description: String,
});

// Truncated description
const truncatedDescription = computed(() =>
    props.description.length > 70
        ? props.description.slice(0, 70) + "..."
        : props.description,
);

// Show full description toggle
const showFullDescription = ref(false);

const toggleDescription = () => {
    showFullDescription.value = !showFullDescription.value;
};
</script>
