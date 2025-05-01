<template>
    <div class="h-full">
        <div class="relative flex flex-wrap">
            <div class="w-full mb-12 px-4">
                <Table :headers="[
                    'NAME',
                    'HOURS',
                    'LICENSE EXPIRY',
                    'MEDICAL EXPIRY',
                    'ACTION',
                ]" title="Pilots" v-model:query="query" :rows="pilots.length">
                    <template v-slot:actions>
                        <SmallButton icon="pi pi-plus" :action="() => showModal('addPilot')"></SmallButton>
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
                                {{ pilot.license_expiry }}
                            </td>
                            <td class="p-2 whitespace-nowrap">
                                {{ pilot.medical_expiry }}
                            </td>
                            <td class="p-2 whitespace-nowrap flex justify-center gap-2">
                                <SmallButton icon="pi pi-pencil" button-text="Edit" @click="showModal(pilot.id)" />
                                <SmallButton icon="pi pi-trash" button-text="Delete" @click="handleDelete(pilot.id)"
                                    classes="bg-red-500 text-white" />
                            </td>
                            <dialog :id="pilot.id" class="modal">
                                <form method="dialog" class="modal-box">
                                    <button class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2">
                                        ✕
                                    </button>
                                    <div>
                                        <div class="w-full flex justify-center items-center">
                                            <div>
                                                <span class="w-full text-center font-bold">Edit Pilot Information</span>

                                                <label for="Category_id"
                                                    class="block mt-2 text-xs font-semibold  uppercase">
                                                    Name
                                                </label>
                                                <input id="name" name="name" :placeholder="pilot.name"
                                                    autocomplete="name"
                                                    class="input input-bordered input-sm w-full max-w-xs"
                                                    v-model="pilotVals.name" />

                                                <label for="author_id"
                                                    class="block mt-2 text-xs font-semibold  uppercase">
                                                    Total Hours
                                                </label>
                                                <input id="hours" name="hours" type="number" :placeholder="pilot.hours"
                                                    autocomplete="pilotname"
                                                    class="input input-bordered input-sm w-full max-w-xs"
                                                    v-model="pilotVals.hours" />

                                                <label for="license"
                                                    class="block mt-2 text-xs font-semibold  uppercase">
                                                    License
                                                </label>
                                                <input type="file" name="license"
                                                    class="file-input file-input-info file-input-sm file-input-bordered w-full max-w-xs"
                                                    @change="
                                                        handleFileChange
                                                    " />

                                                <label for="license_expiry"
                                                    class="block mt-2 text-xs font-semibold  uppercase">
                                                    License expiry
                                                </label>
                                                <input id="license_expiry" name="license_expiry" type="date"
                                                    :placeholder="pilot.license_expiry" :min="currentDate"
                                                    class="input input-bordered input-sm w-full max-w-xs" v-model="pilotVals.license_expiry
                                                        " />

                                                <label for="medical"
                                                    class="block mt-2 text-xs font-semibold  uppercase">
                                                    Medical
                                                </label>
                                                <input type="file" name="medical"
                                                    class="file-input file-input-info file-input-sm file-input-bordered w-full max-w-xs"
                                                    @change="
                                                        handleFileChange()
                                                        " />

                                                <label for="medical_expiry"
                                                    class="block mt-2 text-xs font-semibold  uppercase">
                                                    Medical expiry
                                                </label>
                                                <input id="medical_expiry" name="medical_expiry" type="date"
                                                    :min="currentDate" medical_expiry
                                                    class="input input-bordered input-sm w-full max-w-xs" v-model="pilotVals.medical_expiry
                                                        " />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-action">
                                        <button class="btn" type="submit">
                                            Close
                                        </button>
                                        <button class="btn" type="submit" @click="handleSubmitEdit(pilot.id)">
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
                <button class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2">
                    ✕
                </button>
                <div>
                    <div class="w-full flex justify-center items-center">
                        <div>
                            <span class="w-full text-center font-bold">Pilot Information</span>

                            <label for="Category_id" class="block mt-2 text-xs font-semibold  uppercase">
                                Name
                            </label>
                            <input id="name" placeholder="" autocomplete="name"
                                class="input input-bordered input-sm w-full max-w-xs" v-model="pilotVals.name" />

                            <label for="author_id" class="block mt-2 text-xs font-semibold  uppercase">
                                Total Hours
                            </label>
                            <input id="hours" type="number" placeholder="" autocomplete="pilotname"
                                class="input input-bordered input-sm w-full max-w-xs" v-model="pilotVals.hours" />

                            <label for="license" class="block mt-2 text-xs font-semibold  uppercase">
                                License
                            </label>
                            <input type="file" name="licence"
                                class="file-input file-input-info file-input-sm file-input-bordered w-full max-w-xs"
                                @change="handleFileChange" />

                            <label for="license_expiry" class="block mt-2 text-xs font-semibold  uppercase">
                                License expiry
                            </label>
                            <input id="license_expiry" name="license_expiry" type="date" :min="currentDate"
                                class="input input-bordered input-sm w-full max-w-xs"
                                v-model="pilotVals.license_expiry" />

                            <label for="medical" class="block mt-2 text-xs font-semibold  uppercase">
                                Medical
                            </label>
                            <input type="file" name="medical"
                                class="file-input file-input-info file-input-sm file-input-bordered w-full max-w-xs"
                                @change="handleFileChange" />

                            <label for="medical_expiry" class="block mt-2 text-xs font-semibold  uppercase">
                                Medical expiry
                            </label>
                            <input id="medical_expiry" name="medical_expiry" type="date" :min="currentDate"
                                class="input input-bordered input-sm w-full max-w-xs"
                                v-model="pilotVals.medical_expiry" />
                        </div>
                    </div>
                </div>
                <div class="modal-action">
                    <button class="btn" type="submit">Close</button>
                    <button class="btn" type="submit" @click="handleSubmit">
                        Save
                    </button>
                </div>
            </form>
        </dialog>
    </div>
</template>

<script setup>
import { ref, onMounted, watch } from "vue";
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
const reload = ref(false);

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
        await axios.post("/pilots", formData).then(() => {
            reload.value = !reload.value
        });
        Swal.fire("Success", "Pilot added successfully", "success");
        pilotVals.value = {
            name: "",
            hours: "",
            license: "",
            license_expiry: "",
            medical: "",
            medical_expiry: "",
        };

        getPilots();
    } catch (error) {
        console.error(error);
        Swal.fire("Error", "Failed to add pilot", "error");
    }
};

// Handle submit for edit
const handleSubmitEdit = async (id) => {
    let pilot = pilots.value.find((pilot) => pilot.id === id);
    const formData = new FormData();
    formData.append("name", pilotVals.value.name || pilot.name);
    formData.append("hours", pilotVals.value.hours || pilot.hours);
    formData.append("license", editLicenseFile.value?.files[0] || '');
    formData.append("license_expiry", pilotVals.value.license_expiry || pilot.license_expiry);
    formData.append("medical", editMedicalFile.value?.files[0] || '');
    formData.append("medical_expiry", pilotVals.value.medical_expiry || pilot.medical_expiry);
    try {
        await axios.put(`/pilots/${id}`, formData);
        Swal.fire("Success", "Pilot updated successfully", "success");
        pilotVals.value = {
            name: "",
            hours: "",
            license: "",
            license_expiry: "",
            medical: "",
            medical_expiry: "",
        };
        getPilots();
    } catch (error) {
        console.error(error);
        Swal.fire("Error", "Failed to update pilot", "error");
    }
};
const showModal = (modalId) => {
    document.getElementById(modalId).showModal();
};

const handleDelete = async (id) => {
    Swal.fire({
        title: "Are you sure?",
        text: "You won't be able to revert this!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#d33",
        cancelButtonColor: "#0e5b5c",
        confirmButtonText: "Yes, delete it!",
    }).then(async (result) => {
        if (result.isConfirmed) {
            await axios.delete(`/pilots/${id}`);
            Swal.fire({
                title: "Deleted!",
                text: "Pilot has been deleted.",
                icon: "success",
                confirmButtonColor: "#0e5b5c",
            });
            reload.value = !reload.value
            getPilots();
        }
    });
};

// Fetch pilots when component is mounted
onMounted(() => {
    getPilots();
});

watch(reload, () => {
    getPilots();
});
</script>
