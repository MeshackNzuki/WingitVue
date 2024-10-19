<template><Table
    :headers="['TYPE', 'REG', 'CAPACITY', 'YOM', 'INSURANCE EXPIRY', 'SPEED', 'ACTION']"
    title="Aircrafts"
    v-model:query="searchQuery"
    :rows="aircrafts.length"
>
    <template v-slot:actions>
        <SmallButton
            icon="pi pi-plus"
            :action="() => showModal('addAircraft')"
        ></SmallButton>
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
                        {{ format(new Date(aircraft.insurance_expiry), "yyyy-MM-dd") }}
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
                    <SmallButton
                        icon="pi pi-pencil"
                        :action="() => editAircraft(aircraft.id)"
                    ></SmallButton>
                    <SmallButton
                        icon="pi pi-trash"
                        :action="() => handleDelete(aircraft.id)"
                        severity="danger"
                    ></SmallButton>
                </div>
            </td>
            <dialog id="my_modal_create" class="modal">
      <form method="dialog" class="modal-box" @submit.prevent="handleSubmit">
        <button type="button" class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2" @click="closeModal">
          ✕
        </button>
        <div>
          <span class="w-full text-center font-bold">Edit Aircraft info</span>

          <label for="aircraft_type" class="block mt-2 text-xs font-semibold text-gray-800 uppercase">
            Aircraft type
          </label>
          <input
            name="aircraft_type"
            class="input input-bordered input-sm w-full max-w-xs"
            v-model="aircraftVals.aircraft_type"
          />

          <label for="age" class="block mt-2 text-xs font-semibold text-gray-800 uppercase">
            Select YOM
          </label>
          <select
            name="age"
            class="select select-bordered w-full select-sm max-w-xs"
            v-model="aircraftVals.age"
          >
            <option v-for="year in years" :key="year" :value="year">{{ year }}</option>
          </select>

          <label for="capacity" class="block mt-2 text-xs font-semibold text-gray-800 uppercase">
            Seating capacity
          </label>
          <input
            name="capacity"
            type="number"
            class="input input-bordered input-sm w-full max-w-xs"
            v-model="aircraftVals.capacity"
          />

          <label for="registration" class="block mt-2 text-xs font-semibold text-gray-800 uppercase">
            Registration
          </label>
          <input
            name="registration"
            class="input input-bordered input-sm w-full max-w-xs"
            v-model="aircraftVals.registration"
          />

          <label for="speed" class="block mt-2 text-xs font-semibold text-gray-800 uppercase">
            Aircraft speed
          </label>
          <input
            type="number"
            name="speed"
            class="input input-bordered input-sm w-full max-w-xs"
            v-model="aircraftVals.speed"
          />

          <label for="cor" class="block mt-2 text-xs font-semibold text-gray-800 uppercase">
            COR (Certificate of Registration)
          </label>
          <input
            type="file"
            name="cor"
            @change="handleFileChange"
            class="file-input file-input-bordered file-input-info file-input-sm w-full max-w-xs"
          />

          <label for="crs" class="block mt-2 text-xs font-semibold text-gray-800 uppercase">
            CRS (Certificate of Release to Service)
          </label>
          <input
            type="file"
            name="crs"
            @change="handleFileChange"
            class="file-input file-input-bordered file-input-info file-input-sm w-full max-w-xs"
          />

          <label for="cor_expiry" class="block mt-2 text-xs font-semibold text-gray-800 uppercase">
            COR expiry
          </label>
          <input
            type="date"
            name="cor_expiry"
            class="input input-bordered input-sm w-full max-w-xs"
            v-model="aircraftVals.cor_expiry"
            :min="currentDate"
          />

          <label for="crs_expiry" class="block mt-2 text-xs font-semibold text-gray-800 uppercase">
            CRS expiry
          </label>
          <input
            type="date"
            name="crs_expiry"
            class="input input-bordered input-sm w-full max-w-xs"
            v-model="aircraftVals.crs_expiry"
            :min="currentDate"
          />

          <label for="insurance" class="block mt-2 text-xs font-semibold text-gray-800 uppercase">
            Insurance
          </label>
          <input
            type="file"
            name="insurance"
            @change="handleFileChange"
            class="file-input file-input-bordered file-input-info file-input-sm w-full max-w-xs"
          />

          <label for="insurance_expiry" class="block mt-2 text-xs font-semibold text-gray-800 uppercase">
            Insurance expiry
          </label>
          <input
            type="date"
            name="insurance_expiry"
            class="input input-bordered input-sm w-full max-w-xs"
            v-model="aircraftVals.insurance_expiry"
            :min="currentDate"
          />
        </div>

        <div class="modal-action">
          <button type="button" class="btn" @click="closeModal">Close</button>
          <button type="submit" class="btn">Save</button>
        </div>
      </form>
    </dialog>
        </tr>
    </template>
</Table>
<dialog id="my_modal_create" class="modal">
      <form method="dialog" class="modal-box" @submit.prevent="handleSubmit">
        <button type="button" class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2" @click="closeModal">
          ✕
        </button>
        <div>
          <span class="w-full text-center font-bold">Aircraft info</span>

          <label for="aircraft_type" class="block mt-2 text-xs font-semibold text-gray-800 uppercase">
            Aircraft type
          </label>
          <input
            name="aircraft_type"
            class="input input-bordered input-sm w-full max-w-xs"
            v-model="aircraftVals.aircraft_type"
          />

          <label for="age" class="block mt-2 text-xs font-semibold text-gray-800 uppercase">
            Select YOM
          </label>
          <select
            name="age"
            class="select select-bordered w-full select-sm max-w-xs"
            v-model="aircraftVals.age"
          >
            <option v-for="year in years" :key="year" :value="year">{{ year }}</option>
          </select>

          <label for="capacity" class="block mt-2 text-xs font-semibold text-gray-800 uppercase">
            Seating capacity
          </label>
          <input
            name="capacity"
            type="number"
            class="input input-bordered input-sm w-full max-w-xs"
            v-model="aircraftVals.capacity"
          />

          <label for="registration" class="block mt-2 text-xs font-semibold text-gray-800 uppercase">
            Registration
          </label>
          <input
            name="registration"
            class="input input-bordered input-sm w-full max-w-xs"
            v-model="aircraftVals.registration"
          />

          <label for="speed" class="block mt-2 text-xs font-semibold text-gray-800 uppercase">
            Aircraft speed
          </label>
          <input
            type="number"
            name="speed"
            class="input input-bordered input-sm w-full max-w-xs"
            v-model="aircraftVals.speed"
          />

          <label for="cor" class="block mt-2 text-xs font-semibold text-gray-800 uppercase">
            COR (Certificate of Registration)
          </label>
          <input
            type="file"
            name="cor"
            @change="handleFileChange"
            class="file-input file-input-bordered file-input-info file-input-sm w-full max-w-xs"
          />

          <label for="crs" class="block mt-2 text-xs font-semibold text-gray-800 uppercase">
            CRS (Certificate of Release to Service)
          </label>
          <input
            type="file"
            name="crs"
            @change="handleFileChange"
            class="file-input file-input-bordered file-input-info file-input-sm w-full max-w-xs"
          />

          <label for="cor_expiry" class="block mt-2 text-xs font-semibold text-gray-800 uppercase">
            COR expiry
          </label>
          <input
            type="date"
            name="cor_expiry"
            class="input input-bordered input-sm w-full max-w-xs"
            v-model="aircraftVals.cor_expiry"
            :min="currentDate"
          />

          <label for="crs_expiry" class="block mt-2 text-xs font-semibold text-gray-800 uppercase">
            CRS expiry
          </label>
          <input
            type="date"
            name="crs_expiry"
            class="input input-bordered input-sm w-full max-w-xs"
            v-model="aircraftVals.crs_expiry"
            :min="currentDate"
          />

          <label for="insurance" class="block mt-2 text-xs font-semibold text-gray-800 uppercase">
            Insurance
          </label>
          <input
            type="file"
            name="insurance"
            @change="handleFileChange"
            class="file-input file-input-bordered file-input-info file-input-sm w-full max-w-xs"
          />

          <label for="insurance_expiry" class="block mt-2 text-xs font-semibold text-gray-800 uppercase">
            Insurance expiry
          </label>
          <input
            type="date"
            name="insurance_expiry"
            class="input input-bordered input-sm w-full max-w-xs"
            v-model="aircraftVals.insurance_expiry"
            :min="currentDate"
          />
        </div>

        <div class="modal-action">
          <button type="button" class="btn" @click="closeModal">Close</button>
          <button type="submit" class="btn">Save</button>
        </div>
      </form>
    </dialog>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';
import { useSession } from '../../auth/auth';
import { toast } from 'react-toastify'; // Consider using a Vue toast library
import "react-datepicker/dist/react-datepicker.css"; // Consider using a Vue datepicker

const aircraftVals = ref({});
const reload = ref(false);
const aircraft_edit_id = ref(null);
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

// Handle form submission
const handleSubmit = async () => {
  const session = await useSession();
  aircraftVals.value.aircraftoperator = session?.session.user.id;

  const payload = new FormData();
  for (const key in aircraftVals.value) {
    if (aircraftVals.value[key]) {
      payload.append(key, aircraftVals.value[key]);
    }
  }

  if (payload.get('aircraft_type').length < 10) {
    toast.error("Please fill all the fields");
    return;
  }

  try {
    await axios.post("aircrafts", payload, {
      headers: {
        "Content-Type": "multipart/form-data",
      },
    });
    toast.success("Aircraft has been added");
    reload.value = !reload.value;
    closeModal();
  } catch (error) {
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
    closeModal();
  } catch (error) {
    toast.error(error.message);
  }
};

// Handle delete confirmation
const handleDelete = (id) => {
  if (confirm("Confirm to delete item. Action is irreversible.")) {
    axios.post(`aircraft/delete/${id}`)
      .then(() => {
        toast.success("Deleted successfully");
        reload.value = !reload.value;
      })
      .catch(() => {
        toast.error("Not enough permission");
      });
  }
};

// Show and close modal
const showModal = () => {
  const modal = document.getElementById("my_modal_create");
  modal.showModal();
};

const closeModal = () => {
  const modal = document.getElementById("my_modal_create");
  modal.close();
};

// Fetch aircrafts on component mount
onMounted(getAircrafts);
</script>
