<template>
    <div class="h-full">
        <div class="relative flex flex-wrap">
            <div class="w-full mb-12 px-4">
                <Table
                    :headers="[
                        'NAME',
                        'HOURS',
                        'LICENSE',
                        'LICENSE EXP',
                        'MEDICAL',
                        'MED EXPIRY',
                        'ACTION',
                    ]"
                    title="Pilots"
                    v-model:query="query"
                    :rows="pilots"
                >
                    <template v-slot:actions>
                        <SmallButton
                            icon="pi pi-plus"
                            :action="() => showModal('addPilot')"
                        ></SmallButton>
                    </template>
                    <template v-slot:content>
                        <tr v-for="(pilot, index) in pilots" :key="pilot.id">
                            <td class="p-2 whitespace-nowrap">
                                {{ pilot.name }}
                            </td>
                            <td class="p-2 whitespace-nowrap">
                                {{ pilot.hours }}
                            </td>
                            <td class="p-2 whitespace-nowrap">
                                {{ pilot.license }}
                            </td>
                            <td class="p-2 whitespace-nowrap">
                                {{ pilot.license_expiry }}
                            </td>
                            <td class="p-2 whitespace-nowrap">
                                {{ pilot.medical }}
                            </td>
                            <td class="p-2 whitespace-nowrap">
                                {{ pilot.medical_expiry }}
                            </td>
                            <td class="p-2 whitespace-nowrap flex justify-end">
                                <SmallButton
                                    icon="pi pi-pencil"
                                    @click="showModal(pilot.id)"
                                />
                                <SmallButton
                                    icon="pi pi-trash"
                                    @click="handleDelete(pilot.id)"
                                    class="text-red-500"
                                />
                            </td>
                            <dialog :id="pilot.id" class="modal">
                                <form method="dialog" class="modal-box">
                                    <button
                                        class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2"
                                    >
                                        ✕
                                    </button>
                                    <div>
                                        <div
                                            class="w-full flex justify-center items-center"
                                        >
                                            <div>
                                                <span
                                                    class="w-full text-center font-bold"
                                                    >Edit Pilot info</span
                                                >

                                                <label
                                                    for="Category_id"
                                                    class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                                                >
                                                    Name
                                                </label>
                                                <input
                                                    id="name"
                                                    name="name"
                                                    placeholder=""
                                                    autocomplete="name"
                                                    class="input input-bordered input-sm w-full max-w-xs"
                                                    v-model="pilotVals.name"
                                                />

                                                <label
                                                    for="author_id"
                                                    class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                                                >
                                                    Total Hours
                                                </label>
                                                <input
                                                    id="hours"
                                                    name="hours"
                                                    type="number"
                                                    placeholder=""
                                                    autocomplete="pilotname"
                                                    class="input input-bordered input-sm w-full max-w-xs"
                                                    v-model="pilotVals.hours"
                                                />

                                                <label
                                                    for="license"
                                                    class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                                                >
                                                    License
                                                </label>
                                                <input
                                                    type="file"
                                                    name="license"
                                                    class="file-input file-input-info file-input-sm file-input-bordered w-full max-w-xs"
                                                    @change="
                                                        handleFileChange
                                                    "
                                                />

                                                <label
                                                    for="license_expiry"
                                                    class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                                                >
                                                    License expiry
                                                </label>
                                                <input
                                                    id="license_expiry"
                                                    name="license_expiry"
                                                    type="date"
                                                    :min="currentDate"
                                                    class="input input-bordered input-sm w-full max-w-xs"
                                                    v-model="
                                                        pilotVals.license_expiry
                                                    "
                                                />

                                                <label
                                                    for="medical"
                                                    class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                                                >
                                                    Medical
                                                </label>
                                                <input
                                                    type="file"
                                                    name="medical"
                                                    class="file-input file-input-info file-input-sm file-input-bordered w-full max-w-xs"
                                                    @change="
                                                        handleFileChange()
                                                    "
                                                />

                                                <label
                                                    for="medical_expiry"
                                                    class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                                                >
                                                    Medical expiry
                                                </label>
                                                <input
                                                    id="medical_expiry"
                                                    name="medical_expiry"
                                                    type="date"
                                                    :min="currentDate"
                                                    class="input input-bordered input-sm w-full max-w-xs"
                                                    v-model="
                                                        pilotVals.medical_expiry
                                                    "
                                                />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-action">
                                        <button class="btn" type="button">
                                            Close
                                        </button>
                                        <button
                                            class="btn"
                                            type="button"
                                            @click="handleSubmit()"
                                        >
                                            Save
                                        </button>
                                    </div>
                                </form>
                            </dialog>
                        </tr>
                    </template>
                </Table>
            </div>
        </div>

        <!-- Add Modal -->

        <dialog id="addPilot" class="modal">
            <form method="dialog" class="modal-box">
                <button
                    class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2"
                >
                    ✕
                </button>
                <div>
                    <div class="w-full flex justify-center items-center">
                        <div>
                            <span class="w-full text-center font-bold"
                                >Pilot info</span
                            >

                            <label
                                for="Category_id"
                                class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                            >
                                Name
                            </label>
                            <input
                                id="name"                              
                                placeholder=""
                                autocomplete="name"
                                class="input input-bordered input-sm w-full max-w-xs"
                                v-model="pilotVals.name"
                            />

                            <label
                                for="author_id"
                                class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                            >
                                Total Hours
                            </label>
                            <input
                                id="hours"                              
                                type="number"
                                placeholder=""
                                autocomplete="pilotname"
                                class="input input-bordered input-sm w-full max-w-xs"
                                v-model="pilotVals.hours"
                            />

                            <label
                                for="license"
                                class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                            >
                                License
                            </label>
                            <input
                                type="file"
                                name="licence"
                                class="file-input file-input-info file-input-sm file-input-bordered w-full max-w-xs"
                                @change="handleFileChange"
                            />

                            <label
                                for="license_expiry"
                                class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                            >
                                License expiry
                            </label>
                            <input
                                id="license_expiry"
                                name="license_expiry"
                                type="date"
                                :min="currentDate"
                                class="input input-bordered input-sm w-full max-w-xs"
                                v-model="pilotVals.license_expiry"
                            />

                            <label
                                for="medical"
                                class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                            >
                                Medical
                            </label>
                            <input
                                type="file"
                                name="medical"
                                class="file-input file-input-info file-input-sm file-input-bordered w-full max-w-xs"
                                @change="handleFileChange"
                            />

                            <label
                                for="medical_expiry"
                                class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                            >
                                Medical expiry
                            </label>
                            <input
                                id="medical_expiry"
                                name="medical_expiry"
                                type="date"
                                :min="currentDate"
                                class="input input-bordered input-sm w-full max-w-xs"
                                v-model="pilotVals.medical_expiry"
                            />
                        </div>
                    </div>
                </div>
                <div class="modal-action">
                    <button class="btn" type="button">Close</button>
                    <button class="btn" type="button" @click="handleSubmit">
                        Save
                    </button>
                </div>
            </form>
        </dialog>
    </div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import axios from "axios";
import SmallButton from "../../components/Buttons/Small.vue";
import Swal from "sweetalert2";
import Table from "../../components/Tables/MainTable.vue";
import { authStore } from "../../stores/authStore";


const auth = authStore()

const pilots = ref([]);
const pilotVals = ref({
    name: "",
    hours: "",
    license: "",
    license_expiry: "",
    medical: "",
    medical_expiry: "",
});
const query = ref("");

const currentDate = ref(new Date().toISOString().split("T")[0]);


const editLicenseFile = ref(null);
const editMedicalFile = ref(null);

const getPilots = async () => {
    const { data } = await axios.get("/pilots");
    pilots.value = data;
};

const handleFileChange = (e) => {
    pilotVals.value = { ...pilotVals, [e.target.name]: e.target.files[0] };
};

// Open/close modals
const openAddModal = () => addModal.value.showModal();
const closeAddModal = () => addModal.value.close();


const closeEditModal = () => editModal.value.close();

// Handle submit for new pilot
const handleSubmit = async () => {
    const formData = new FormData();
    formData.append("name", pilotVals.value.name);
    formData.append("hours", pilotVals.value.hours);
    formData.append("license", pilotVals.value.license);
    formData.append("license_expiry", pilotVals.value.license_expiry);
    formData.append("medical", pilotVals.value.medical);
    formData.append("medical_expiry", pilotVals.value.medical_expiry);
    formData.append("aircraftoperator", auth.user.id);
    for (let [key, value] of formData.entries()) {
        console.log(`${key}: ${value}`);
    }
    try {
        await axios.post("/pilots", formData);
        Swal.fire("Success", "Pilot added successfully", "success");
 
        getPilots();
    } catch (error) {
        console.error(error);
        Swal.fire("Error", "Failed to add pilot", "error");
    }
};

// Handle submit for edit
const handleSubmitEdit = async (id) => {
    const formData = new FormData();
    formData.append("name", pilotVals.value.name);
    formData.append("hours", pilotVals.value.hours);
    formData.append("license", editLicenseFile.value.files[0]);
    formData.append("license_expiry", pilotVals.value.license_expiry);
    formData.append("medical", editMedicalFile.value.files[0]);
    formData.append("medical_expiry", pilotVals.value.medical_expiry);

    try {
        await axios.put(`/pilots/${id}`, formData);
        Swal.fire("Success", "Pilot updated successfully", "success");
        closeEditModal();
        getPilots();
    } catch (error) {
        console.error(error);
        Swal.fire("Error", "Failed to update pilot", "error");
    }
};
const showModal = (modalId) => {
    document.getElementById(modalId).showModal();
};

// Fetch pilots when component is mounted
onMounted(() => {
    getPilots();
});
</script>
