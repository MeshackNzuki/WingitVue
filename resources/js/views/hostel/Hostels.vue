<template>
    <div>
        <Table
            :headers="['NAME', 'NUMBER OF ROOMS', 'ACTION']"
            title="All Hostels"
        >
            <template v-slot:actions>
                <SmallButton
                    icon="pi pi-plus"
                    :action="() => showModalFunc('addHostelModal')"
                ></SmallButton>
                <Button icon="pi pi-print" class="mr-2" severity="secondary" />
                <Button icon="pi pi-upload" severity="secondary" />
            </template>
            <template v-slot:content>
                <tr v-for="(hostel, index) in hostelData" :key="index">
                    <td class="p-2 whitespace-nowrap">
                        <div class="font-medium">{{ hostel.name }}</div>
                    </td>
                    <td class="p-2 whitespace-nowrap">
                        <div class="text-left">
                            {{ hostel.number_of_rooms }}
                        </div>
                    </td>
                    <td class="p-2 whitespace-nowrap">
                        <div class="text-lg text-center">
                            <SmallButton
                                classes="border border-blue-500 border-dotted px-2 text-sm bg-emerald-500"
                                button-text="Edit"
                                :action="() => showModalFunc(hostel.id)"
                            />
                            <SmallButton
                                classes="border border-blue-500 border-dotted px-2 text-sm bg-red-500 mx-2"
                                button-text="Delete"
                                :action="() => destroy(hostel.id)"
                            />
                        </div>
                    </td>
                    <!-- Edit Hostel Modal -->
                    <dialog
                        :id="hostel.id"
                        class="modal modal-bottom sm:modal-middle"
                    >
                        <div
                            class="modal-box dark:text-slate-400 dark:bg-sky-950"
                        >
                            <h3 class="font-bold text-lg">
                                Edit Hostel Information
                            </h3>
                            <p class="py-4 text-xs">Press ESC key to close</p>
                            <div class="">
                                <form
                                    @submit.prevent="submitForm"
                                    class="flex flex-col gap-2"
                                >
                                    <span>Hostel Information</span>
                                    <div
                                        class="flex flex-col w-full lg:flex-row"
                                    >
                                        <div
                                            class="grid flex-grow card rounded-sm p-1 place-items-center"
                                        >
                                            <div>
                                                <div class="">
                                                    <label
                                                        for="edit_name"
                                                        class="block text-sm font-medium"
                                                        >Hostel Name</label
                                                    >
                                                    <input
                                                        v-model="hostel.name"
                                                        type="text"
                                                        class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                                        id="edit_name"
                                                        name="edit_name"
                                                        required
                                                    />
                                                    <span
                                                        v-if="errors.edit_name"
                                                        class="text-red-500"
                                                        >{{
                                                            errors.edit_name
                                                        }}</span
                                                    >
                                                </div>
                                                <div class="">
                                                    <label
                                                        for="edit_number_of_rooms"
                                                        class="block text-sm font-medium"
                                                        >Number of Rooms</label
                                                    >
                                                    <input
                                                        v-model="
                                                            hostel.number_of_rooms
                                                        "
                                                        type="number"
                                                        class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                                        id="edit_number_of_rooms"
                                                        name="edit_number_of_rooms"
                                                        required
                                                    />
                                                    <span
                                                        v-if="
                                                            errors.edit_number_of_rooms
                                                        "
                                                        class="text-red-500"
                                                        >{{
                                                            errors.edit_number_of_rooms
                                                        }}</span
                                                    >
                                                </div>
                                                <div class="w-full">
                                                    <label
                                                        for="photo"
                                                        class="block text-sm font-medium"
                                                        >Hostel Photo (Drag drop
                                                        /Optional)</label
                                                    >
                                                    <input
                                                        ref="photoInput"
                                                        type="file"
                                                        id="photo"
                                                        name="photo"
                                                        accept="image/*"
                                                        @change="onFileChange"
                                                        class="mt-1 block w-full px-6 py-6 border border-dashed border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                                    />
                                                    <span
                                                        v-if="errors.photo"
                                                        class="text-red-500 text-sm"
                                                        >{{
                                                            errors.photo
                                                        }}</span
                                                    >
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div
                                        class="flex flex-row gap-2 justify-center mt-2"
                                    >
                                        <CommonButton
                                            button-text="Close"
                                            :action="
                                                () =>
                                                    closeModal(
                                                        'editHostelModal',
                                                    )
                                            "
                                        />
                                        <CommonButton
                                            button-text="Submit"
                                            :action="submitForm"
                                        />
                                    </div>
                                </form>
                            </div>
                        </div>
                    </dialog>
                </tr>
            </template>
        </Table>

        <!-- Add Hostel Modal -->
        <dialog id="addHostelModal" class="modal modal-bottom sm:modal-middle">
            <div class="modal-box dark:text-slate-400 dark:bg-sky-950">
                <h3 class="font-bold text-lg">Add Hostel</h3>
                <p class="py-4 text-xs">Press ESC key to close</p>
                <div class="">
                    <form
                        @submit.prevent="submitForm"
                        class="flex flex-col gap-2"
                    >
                        <span>Hostel Information</span>
                        <div class="flex flex-col w-full lg:flex-row">
                            <div
                                class="grid flex-grow card rounded-sm p-1 place-items-center"
                            >
                                <div>
                                    <div class="">
                                        <label
                                            for="name"
                                            class="block text-sm font-medium"
                                            >Hostel Name</label
                                        >
                                        <input
                                            v-model="hostel.name"
                                            type="text"
                                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                            id="name"
                                            name="name"
                                            required
                                        />
                                        <span
                                            v-if="errors.name"
                                            class="text-red-500"
                                            >{{ errors.name }}</span
                                        >
                                    </div>
                                    <div class="">
                                        <label
                                            for="number_of_rooms"
                                            class="block text-sm font-medium"
                                            >Number of Rooms</label
                                        >
                                        <input
                                            v-model="hostel.number_of_rooms"
                                            type="number"
                                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                            id="number_of_rooms"
                                            name="number_of_rooms"
                                            required
                                        />
                                        <span
                                            v-if="errors.number_of_rooms"
                                            class="text-red-500"
                                            >{{ errors.number_of_rooms }}</span
                                        >
                                    </div>
                                    <div class="w-full">
                                        <label
                                            for="photo"
                                            class="block text-sm font-medium"
                                            >Hostel Photo (Drag drop
                                            /Optional)</label
                                        >
                                        <input
                                            ref="photoInput"
                                            type="file"
                                            id="photo"
                                            name="photo"
                                            accept="image/*"
                                            @change="onFileChange"
                                            class="mt-1 block w-full px-6 py-6 border border-dashed border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                        />
                                        <span
                                            v-if="errors.photo"
                                            class="text-red-500 text-sm"
                                            >{{ errors.photo }}</span
                                        >
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="flex flex-row gap-2 justify-center mt-2">
                            <CommonButton
                                button-text="Close"
                                :action="() => closeModal('addHostelModal')"
                            />
                            <CommonButton
                                button-text="Submit"
                                :action="submitForm"
                            />
                        </div>
                    </form>
                </div>
            </div>
        </dialog>
    </div>
</template>

<script setup>
import Table from "../../components/Tables/MainTable.vue";
import CommonButton from "../../components/Buttons/CommonButton.vue";
import SmallButton from "../../components/Buttons/Small.vue";
import { ref, onMounted } from "vue";
import axios from "axios";

const showModalFunc = (modalId) => {
    document.getElementById(modalId).showModal();
};

const closeModal = (modalId) => {
    document.getElementById(modalId).close();
};

const destroy = async (id) => {
    const response = await axios.delete(`hostel/hostels/${id}`);

    console.log("response", response.data.success);
    if (response.data.success) {
        loadHostelData();
    }
};

const hostelData = ref([]);
const hostel = ref({
    name: "",
    number_of_rooms: "",
});

const errors = ref({
    name: "",
    number_of_rooms: "",
});

onMounted(async () => {
    loadHostelData();
});

const loadHostelData = async () => {
    const response = await axios.get("/hostel/hostels/");
    hostelData.value = response.data.data.data;
};

const submitForm = async (modalId, hostelId) => {
    validateForm();
    const formData = new FormData();
    formData.append("name", hostel.value.name);
    formData.append("photo", hostel.value?.photo);
    formData.append("number_of_rooms", hostel.value.number_of_rooms);
    if (Object.values(errors.value).every((val) => val === "")) {
        try {
            if (modalId === "editHostelModal") {
                const response = await axios.put(
                    `hostel/hostels/${hostelId}`,
                    formData,
                );
            } else {
                console.log("hostel", hostel.value);
                const response = await axios.post("hostel/hostels/", formData);
                if (response.data.success) {
                    loadHostelData();
                }
            }
        } catch (error) {
            console.log("Error:", error);
        }
    }
};

const validateForm = () => {
    resetErrors();
    if (!hostel.value.name) {
        errors.value.name = "Hostel Name is required";
    }
    if (!hostel.value.number_of_rooms) {
        errors.value.number_of_rooms = "Number of Rooms is required";
    }
};

const resetErrors = () => {
    Object.keys(errors.value).forEach((key) => {
        errors.value[key] = "";
    });
};
</script>
