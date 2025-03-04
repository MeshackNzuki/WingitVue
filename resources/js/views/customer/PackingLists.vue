<script setup>
import { ref, onMounted } from "vue";
import axios from "axios";
import { PrimeIcons } from "primevue/api";

const items = ref([]);
const newItem = ref("");
const rerender = ref(false);

const fetchItems = async () => {
    try {
        const response = await axios.get("/show-items");
        items.value = response.data;
        console.log("fetch");
    } catch (error) {
        console.error("Error fetching items:", error);
    }
};

const handleAddItem = async () => {
    try {
        const response = await axios.post("/create-item", { newItem: newItem.value });
        items.value = response.data;
        newItem.value = "";
        rerender.value = !rerender.value;
    } catch (error) {
        console.error("Error adding item:", error);
    }
};

const handleToggleItem = async (itemId) => {
    try {
        const response = await axios.post(`/toggle-item/${itemId}`);
        items.value = response.data;
        rerender.value = !rerender.value;
    } catch (error) {
        console.error("Error toggling item:", error);
    }
};

const handleDeleteItem = async (itemId) => {
    try {
        const response = await axios.post(`/delete-item/${itemId}`);
        items.value = response.data;
        rerender.value = !rerender.value;
    } catch (error) {
        console.error("Error deleting item:", error);
    }
};

onMounted(fetchItems);
</script>

<template>
    <div class="card card-compact from-sky-50 to-cyan-50 bg-gradient-to-r w-full block shadow-xl">
        <div class="font-semibold text-gray-700 px-4">Packing Checklist</div>
        <ul class="px-3">
            <template v-if="items.length">
                <li v-for="item in items" :key="item.id" class="w-full grid grid-cols-3 grid-flow-col gap-4"
                    :style="{ textDecoration: item.is_packed !== 1 ? 'line-through' : 'none' }">
                    <div class="col-span-10">{{ item.name }}</div>
                    <div>
                        <i :class="['pi', item.is_packed === 1 ? 'pi-check-circle text-success' : 'pi-check-circle text-info']"
                            @click="handleToggleItem(item.id)" class="cursor-pointer"></i>
                    </div>
                    <div>
                        <i class="pi pi-trash text-red-500 cursor-pointer" @click="handleDeleteItem(item.id)"></i>
                    </div>
                </li>
            </template>
            <template v-else>
                <span>Add items here</span>
            </template>
        </ul>
        <div class="px-6 pb-4 text-center">
            <p class="my-3">
                <input type="text" class="border-b input-sm rounded-full" v-model="newItem" />
            </p>
            <button @click="handleAddItem"
                class="mb-2 md:mb-0 flex-no-shrink bg-emerald-500 hover:bg-green-500 px-5 py-2 text-xs shadow-sm hover:shadow-lg font-medium tracking-wider border-2 text-gray-50 rounded-full transition ease-in duration-300"
                type="button" aria-label="like">
                <i class="pi pi-plus"></i> Add Item
            </button>
        </div>
    </div>
</template>
