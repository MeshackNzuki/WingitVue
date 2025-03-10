<script setup>
import { ref, onMounted, watch } from "vue";
import axios from "axios";
import { PrimeIcons } from "primevue/api";
import CommonButton from "../../components/Buttons/CommonButton.vue";

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

onMounted(() => {
    fetchItems();
});

watch(rerender, () => {
    fetchItems();
})
</script>

<template>
    <div class="card card-compact bg-transparent w-full block">
        <div class="font-semibold text-gray-700 px-4">Packing Checklist</div>
        <span class="text-center text-sm">
            <p>Items are marked as unpacked by default, Please when packed, click the green tick to mark as packed.</p>
        </span>
        <ul class="px-4 mt-4">
            <template v-if="items.length">
                <li v-for="(item, index) in items" :key="item.id" class="w-full grid grid-cols-3 grid-flow-col gap-4"
                    :style="{ textDecoration: item.is_packed !== 1 ? 'line-through' : 'none' }">
                    <div class="col-span-10">{{ index + 1 }}. {{ item.name }}</div>
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
        <div class="px-2 pb-4 text-center">
            <p class="my-3">
                <input type="text" class="border-b  px-1  rounded-full" v-model="newItem"
                    placeholder="Type item name here" />
            </p>
            <CommonButton :action="handleAddItem" button-text="Add Item" />
        </div>
    </div>
</template>
