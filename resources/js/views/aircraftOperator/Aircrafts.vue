<template>
    <Table :headers="[
        'TYPE',
        'REG',
        'CAPACITY',
        'YOM',
        'INSURANCE EXPIRY',
        'SPEED',
        'ACTION',
    ]" title="Aircrafts" v-model:query="searchQuery" :rows="aircrafts.length">
        <template v-slot:actions>
            <SmallButton icon="pi pi-plus" :action="() => showModal('addAircraft')"></SmallButton>
            <Button icon="pi pi-print" class="mr-2" severity="secondary" />
            <Button icon="pi pi-upload" severity="secondary" />
        </template>

        <template v-slot:content>
            <tr v-for="(aircraft, index) in aircrafts" :key="index">
                <td class="p-2 whitespace-nowrap">
                    <div class="flex items-center">
                        <div class="text-start">
                            {{ aircraft.aircraft_type }}
                        </div>
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="flex items-center">
                        <div class="text-start">
                            {{ aircraft.registration }}
                        </div>
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="flex items-center">
                        <div class="text-start">
                            {{ aircraft.capacity }}
                        </div>
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="flex items-center">
                        <div class="text-start">
                            {{ aircraft.age }}
                        </div>
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="flex items-center">
                        <div class="text-start">
                            {{
                                format(
                                    new Date(aircraft.insurance_expiry),
                                    "yyyy-MM-dd",
                                )
                            }}
                        </div>
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="flex items-center">
                        <div class="text-start">
                            {{ aircraft.speed }}
                        </div>
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="flex items-center">
                        <SmallButton icon="pi pi-pencil" :action="() => showModal(aircraft.id)"></SmallButton>
                        <SmallButton icon="pi pi-trash" :action="() => handleDelete(aircraft.id)" severity="danger">
                        </SmallButton>
                    </div>
                </td>
                <dialog :id="aircraft.id" class="modal">
                    <form method="dialog" class="modal-box">
                        <button type="submit" class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2">
                            ✕
                        </button>
                        <span class="w-full text-center font-bold">Edit Aircraft info</span>
                        <div class="flex justify-center items-center">
                            <div class="flex flex-col md:flex-row md:gap-4">
                                <div>
                                    <label for="aircraft_type" class="block mt-2 text-xs font-semibold  uppercase">
                                        Aircraft type
                                    </label>
                                    <input name="aircraft_type" class="input input-bordered input-sm w-full max-w-xs"
                                        v-model="aircraftVals.aircraft_type" :placeholder="aircraft.aircraft_type" />

                                    <label for="age" class="block mt-2 text-xs font-semibold  uppercase">
                                        Select YOM
                                    </label>
                                    <select name="age" class="select select-bordered w-full select-sm max-w-xs"
                                        v-model="aircraftVals.age" :placeholder="aircraft.age">
                                        <option v-for="year in years" :key="year" :value="year">
                                            {{ year }}
                                        </option>
                                    </select>

                                    <label for="capacity" class="block mt-2 text-xs font-semibold  uppercase">
                                        Seating capacity
                                    </label>
                                    <input name="capacity" type="number"
                                        class="input input-bordered input-sm w-full max-w-xs"
                                        v-model="aircraftVals.capacity" :placeholder="aircraft.capacity" />

                                    <label for="registration" class="block mt-2 text-xs font-semibold  uppercase">
                                        Registration
                                    </label>
                                    <input name="registration" class="input input-bordered input-sm w-full max-w-xs"
                                        v-model="aircraftVals.registration" :placeholder="aircraft.registration" />

                                    <label for="speed" class="block mt-2 text-xs font-semibold  uppercase">
                                        Aircraft speed
                                    </label>
                                    <input type="number" name="speed"
                                        class="input input-bordered input-sm w-full max-w-xs"
                                        v-model="aircraftVals.speed" :placeholder="aircraft.speed" />
                                </div>
                                <div>
                                    <label for="cor" class="block mt-2 text-xs font-semibold  uppercase">
                                        COR (Certificate of Registration)
                                    </label>
                                    <input type="file" name="cor" @change="handleFileChange"
                                        class="file-input file-input-bordered file-input-info file-input-sm w-full max-w-xs" />

                                    <label for="crs" class="block mt-2 text-xs font-semibold  uppercase">
                                        CRS (Certificate of Release to Service)
                                    </label>
                                    <input type="file" name="crs" @change="handleFileChange"
                                        class="file-input file-input-bordered file-input-info file-input-sm w-full max-w-xs" />

                                    <label for="crs_expiry" class="block mt-2 text-xs font-semibold  uppercase">
                                        CRS expiry
                                    </label>
                                    <input type="date" name="crs_expiry"
                                        class="input input-bordered input-sm w-full max-w-xs"
                                        v-model="aircraftVals.crs_expiry" :min="currentDate"
                                        :placeholder="aircraft.crs_expiry" />

                                    <label for="insurance" class="block mt-2 text-xs font-semibold  uppercase">
                                        Insurance
                                    </label>
                                    <input type="file" name="insurance" @change="handleFileChange"
                                        class="file-input file-input-bordered file-input-info file-input-sm w-full max-w-xs" />

                                    <label for="insurance_expiry" class="block mt-2 text-xs font-semibold  uppercase">
                                        Insurance expiry
                                    </label>
                                    <input type="date" name="insurance_expiry"
                                        class="input input-bordered input-sm w-full max-w-xs"
                                        v-model="aircraftVals.insurance_expiry" :min="currentDate"
                                        :placeholder="aircraft.insurance_expiry" />
                                </div>
                            </div>
                        </div>

                        <div class="modal-action">
                            <button type="submit" class="btn" @click="closeModal">
                                Close
                            </button>
                            <button type="submit" class="btn" @click="handleAircraftEdit(aircraft.id)">Save
                                Edits</button>
                        </div>
                    </form>
                </dialog>
            </tr>
        </template>
    </Table>
    <dialog id="addAircraft" class="modal">
        <form method="dialog" class="modal-box">
            <button type="submit" class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2" @click="closeModal">
                ✕
            </button>
            <span class="w-full text-center font-bold">Aircraft info</span>
            <div class="flex justify-center items-center">
                <div class="flex flex-col md:flex-row md:gap-4">
                    <div>
                        <label for="aircraft_type" class="block mt-2 text-xs font-semibold  uppercase">
                            Aircraft type
                        </label>
                        <input name="aircraft_type" class="input input-bordered input-sm w-full max-w-xs"
                            v-model="aircraftVals.aircraft_type" />

                        <label for="age" class="block mt-2 text-xs font-semibold  uppercase">
                            Select YOM
                        </label>
                        <select name="age" class="select select-bordered w-full select-sm max-w-xs"
                            v-model="aircraftVals.age">
                            <option v-for="year in years" :key="year" :value="year">
                                {{ year }}
                            </option>
                        </select>

                        <label for="capacity" class="block mt-2 text-xs font-semibold  uppercase">
                            Seating capacity
                        </label>
                        <input name="capacity" type="number" class="input input-bordered input-sm w-full max-w-xs"
                            v-model="aircraftVals.capacity" />

                        <label for="registration" class="block mt-2 text-xs font-semibold  uppercase">
                            Registration
                        </label>
                        <input name="registration" class="input input-bordered input-sm w-full max-w-xs"
                            v-model="aircraftVals.registration" />

                        <label for="speed" class="block mt-2 text-xs font-semibold  uppercase">
                            Aircraft speed
                        </label>
                        <input type="number" name="speed" class="input input-bordered input-sm w-full max-w-xs"
                            v-model="aircraftVals.speed" />

                        <label for="coa" class="block mt-2 text-xs font-semibold  uppercase">
                            COA
                        </label>
                        <input type="file" name="coa" @change="handleFileChange"
                            class="file-input file-input-bordered file-input-info file-input-sm w-full max-w-xs" />

                        <label for="coa_expiry" class="block mt-2 text-xs font-semibold  uppercase">
                            Coa expiry
                        </label>
                        <input type="date" name="coa_expiry" class="input input-bordered input-sm w-full max-w-xs"
                            v-model="aircraftVals.coa_expiry" :min="currentDate" />
                    </div>
                    <div>
                        <label for="cor" class="block mt-2 text-xs font-semibold  uppercase">
                            COR (Certificate of Registration)
                        </label>
                        <input type="file" name="cor" @change="handleFileChange"
                            class="file-input file-input-bordered file-input-info file-input-sm w-full max-w-xs" />

                        <label for="crs" class="block mt-2 text-xs font-semibold  uppercase">
                            CRS (Certificate of Release to Service)
                        </label>
                        <input type="file" name="crs" @change="handleFileChange"
                            class="file-input file-input-bordered file-input-info file-input-sm w-full max-w-xs" />

                        <label for="crs_expiry" class="block mt-2 text-xs font-semibold  uppercase">
                            CRS expiry
                        </label>
                        <input type="date" name="crs_expiry" class="input input-bordered input-sm w-full max-w-xs"
                            v-model="aircraftVals.crs_expiry" :min="currentDate" />

                        <label for="insurance" class="block mt-2 text-xs font-semibold  uppercase">
                            Insurance
                        </label>
                        <input type="file" name="insurance" @change="handleFileChange"
                            class="file-input file-input-bordered file-input-info file-input-sm w-full max-w-xs" />

                        <label for="insurance_expiry" class="block mt-2 text-xs font-semibold  uppercase">
                            Insurance expiry
                        </label>
                        <input type="date" name="insurance_expiry" class="input input-bordered input-sm w-full max-w-xs"
                            v-model="aircraftVals.insurance_expiry" :min="currentDate" />
                    </div>
                </div>
            </div>
            <div class="modal-action">
                <button type="submit" class="btn">
                    Close
                </button>
                <button type="submit" class="btn" @click="handleSubmit">Save</button>
            </div>
        </form>
    </dialog>
</template>

<script setup>
import { ref, onMounted, watch } from "vue";
import axios from "axios";
import { format } from "date-fns";
import Table from "../../components/Tables/MainTable.vue";
import { toast } from "vue3-toastify";
import { authStore } from "../../stores/authStore";
import Swal from "sweetalert2";
import SmallButton from "../../components/Buttons/Small.vue";

const auth = authStore();
const aircraftVals = ref({
    cor: "",
    crs: "",
    coa: "",
    insurance_expiry: "",
    insurance: "",
    capacity: "",
    registration: "",
    speed: "",
    age: "",
    aircraftoperator: "",
    aircraft_type: "",
    crs_expiry: "",
    coa_expiry: "",
});
const reload = ref(false);
const errorMessage = ref(false);

const currentDate = new Date().toISOString().split("T")[0];
const aircrafts = ref([]);
const years = ref([]);

// Generate years from 1950 to 2030
for (let year = 1950; year <= 2030; year++) {
    years.value.push(year);
}

// Fetch aircraft data
const getAircrafts = async () => {
    const res = await axios.get("aircrafts");
    aircrafts.value = res.data;
};

// Handle file input changes
const handleFileChange = (e) => {
    aircraftVals.value[e.target.name] = e.target.files[0];
};

const validateFields = () => {
    for (const key in aircraftVals.value) {
        if (!aircraftVals.value[key]) {
            errorMessage.value = "Please fill all fields.";
            return false;
        }
    }
    errorMessage.value = "";
    return true;
};

// Handle form submission
const handleSubmit = async () => {
    validateFields();
    const payload = new FormData();
    payload.append("cor", aircraftVals.value.cor);
    payload.append("crs", aircraftVals.value.crs);
    payload.append("coa", aircraftVals.value.coa);
    payload.append("insurance_expiry", aircraftVals.value.insurance_expiry);
    payload.append("insurance", aircraftVals.value.insurance);
    payload.append("capacity", aircraftVals.value.capacity);
    payload.append("registration", aircraftVals.value.registration);
    payload.append("speed", aircraftVals.value.speed);
    payload.append("age", aircraftVals.value.age);
    payload.append("aircraftoperator", auth.user.id);
    payload.append("aircraft_type", aircraftVals.value.aircraft_type);
    payload.append("crs_expiry", aircraftVals.value.crs_expiry);
    payload.append("coa_expiry", aircraftVals.value.coa_expiry);

    for (let [key, value] of payload.entries()) {
        console.log(`${key}: ${value}`);
    }

    try {
        const res = await axios.post("aircrafts", payload, {
            headers: {
                "Content-Type": "multipart/form-data",
            },
        });

        toast.success("Aircraft has been added");
        reload.value = !reload.value;
    } catch (error) {
        console.log(error);
        toast.error("An error occurred");
    }
};

// Handle aircraft edit
const handleAircraftEdit = async (id) => {
    const payload = new FormData();
    for (const key in aircraftVals.value) {
        if (aircraftVals.value[key]) {
            payload.append(key, aircraftVals.value[key]);
        }
    }
    try {
        await axios.put(`aircrafts/${id}`, payload);
        toast.success("Aircraft data updated.");
        reload.value = !reload.value;
        aircraftVals.value = {
            cor: "",
            crs: "",
            coa: "",
            insurance_expiry: "",
            insurance: "",
            capacity: "",
            registration: "",
            speed: "",
            age: "",
            aircraftoperator: "",
            aircraft_type: "",
            crs_expiry: "",
            coa_expiry: "",
        };
        closeModal();
    } catch (error) {
        toast.error(error.message);
    }
};

// Handle delete confirmation
const handleDelete = (id) => {
    Swal.fire({
        title: "Are you sure?",
        text: "You won't be able to revert this!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes, delete it!",
    }).then(async (result) => {
        if (result.isConfirmed) {
            await axios.delete(`aircrafts/${id}`).then(() => {
                Swal.fire("Deleted!", "Aicraft has been deleted.", "success");
                reload.value = !reload.value;
            }).catch((error) => {
                Swal.fire("Error!", "An error occurred while deleting the aircraft.", error.message);
            });


        }
    });


};

// Fetch aircrafts on component mount
onMounted(getAircrafts);

watch(reload, () => {
    getAircrafts();
});

const showModal = (modalId) => {
    document.getElementById(modalId).showModal();
};
</script>
