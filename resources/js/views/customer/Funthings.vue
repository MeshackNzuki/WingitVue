<script setup>
import { ref, onMounted, watch } from "vue";
import axios from "axios";
import CommonButton from "../../components/Buttons/CommonButton.vue";

const funThings = ref([]);
const newItem = ref({ name: "", time: "", venue: "", budget: "" });
const rerender = ref(false);

const fetchFunThings = async () => {
    try {
        const response = await axios.get("/fun-things");
        funThings.value = response.data.data;
    } catch (error) {
        console.error("Error fetching fun things:", error);
    }
};

const handleAddFunThing = async () => {
    try {
        await axios.post("/fun-things", newItem.value);
        rerender.value = !rerender.value;
        newItem.value = { name: "", time: "", venue: "", budget: "" };
    } catch (error) {
        console.error("Error adding fun thing:", error.response?.data);
    }
};

const handleDeleteFunThing = async (id) => {
    try {
        await axios.delete(`/fun-things/${id}`);
        rerender.value = !rerender.value;
    } catch (error) {
        console.error("Error deleting fun thing:", error);
    }
};

onMounted(() => {
    fetchFunThings();
});

watch(rerender, () => {
    fetchFunThings();
});
</script>

<template>
    <div class="card card-compact bg-transparent w-full block">
        <div class="font-semibold text-gray-700 px-4 mt-4">Fun Things To Do</div>
        <p class="text-sm text-center">List your exciting activities for the trip!</p>

        <ul class="px-4 mt-4">
            <template v-if="funThings.length">
                <li v-for="(thing, index) in funThings" :key="thing.id"
                    class="w-full grid grid-cols-2 m-2 grid-flow-col gap-4 text-sm">
                    <div class="col-span-3">
                        <b>{{ index + 1 }}.</b>
                        <span class="text-emerald-700 font-semibold ms-1">{{ thing.name }}</span>
                        — {{ thing.time }} at <b>{{ thing.venue }}</b> (Budget: ${{ thing.budget }})
                    </div>
                    <div>
                        <i class="pi pi-trash text-red-500 cursor-pointer" @click="handleDeleteFunThing(thing.id)"></i>
                    </div>
                </li>
            </template>
            <template v-else>
                <span>No fun things yet, add some below!</span>
            </template>
        </ul>

        <div class="px-4 py-4 text-center space-y-2">
            <input type="text" class="border px-2 py-1 rounded w-full" placeholder="Activity Name"
                v-model="newItem.name" />
            <input type="datetime-local" class="border px-2 py-1 rounded w-full" placeholder="Time"
                v-model="newItem.time" />
            <input type="text" class="border px-2 py-1 rounded w-full" placeholder="Venue" v-model="newItem.venue" />
            <input type="number" class="border px-2 py-1 rounded w-full" placeholder="Budget"
                v-model="newItem.budget" />

            <CommonButton :action="handleAddFunThing" button-text="Add Fun Thing" />
        </div>
    </div>
</template>
