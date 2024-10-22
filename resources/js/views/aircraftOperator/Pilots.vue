<template>
    <div class="h-full ml-14 mb-10 md:ml-64">
      <div class="grid grid-cols-1 lg:grid-cols-2 p-4 gap-4"></div>
      <div class="relative flex flex-wrap mt-10">
        <div class="w-full mb-12 px-4">
          <Table
            :headers="['NAME', 'HOURS', 'LICENSE', 'LICENSE EXP', 'MEDICAL', 'MED EXPIRY', 'ACTION']"
            title="Pilots"
            v-model:query="query"
            :rows="pilots"
          >
            <template v-slot:actions>
              <SmallButton
                icon="pi pi-plus"
                :action="openAddModal"
              ></SmallButton>
            </template>
            <template v-slot:content>
              <tr v-for="(pilot, index) in pilots" :key="pilot.id">
                <td class="p-2 whitespace-nowrap">{{ pilot.name }}</td>
                <td class="p-2 whitespace-nowrap">{{ pilot.hours }}</td>
                <td class="p-2 whitespace-nowrap">{{ pilot.license }}</td>
                <td class="p-2 whitespace-nowrap">{{ pilot.license_expiry }}</td>
                <td class="p-2 whitespace-nowrap">{{ pilot.medical }}</td>
                <td class="p-2 whitespace-nowrap">{{ pilot.medical_expiry }}</td>
                <td class="p-2 whitespace-nowrap flex justify-end">
                  <SmallButton
                    icon="pi pi-pencil"
                    @click="openEditModal(pilot)"
                  />
                  <SmallButton
                    icon="pi pi-trash"
                    @click="handleDelete(pilot.id)"
                    class="text-red-500"
                  />
                </td>
              </tr>
            </template>
          </Table>
        </div>
      </div>
  
      <!-- Add Modal -->
      <dialog id="addModal" ref="addModal">
        <form method="dialog" class="modal-box">
          <button class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2" @click="closeAddModal">✕</button>
          <div>
            <span class="w-full text-center font-bold">Add New Pilot</span>
            <InputField v-model="pilotVals.name" label="Name" />
            <InputField v-model="pilotVals.hours" label="Total Hours" />
            <FileInput ref="licenseFile" label="License" />
            <InputField v-model="pilotVals.license_expiry" label="License Expiry" type="date" :min="currentDate" />
            <FileInput ref="medicalFile" label="Medical" />
            <InputField v-model="pilotVals.medical_expiry" label="Medical Expiry" type="date" :min="currentDate" />
          </div>
          <div class="modal-action">
            <button class="btn" @click="handleSubmit">Save</button>
          </div>
        </form>
      </dialog>
  
      <!-- Edit Modal -->
      <dialog id="editModal" ref="editModal">
        <form method="dialog" class="modal-box">
          <button class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2" @click="closeEditModal">✕</button>
          <div>
            <span class="w-full text-center font-bold">Edit Pilot Info</span>
            <InputField v-model="pilotVals.name" label="Name" />
            <InputField v-model="pilotVals.hours" label="Total Hours" />
            <FileInput ref="editLicenseFile" label="License" />
            <InputField v-model="pilotVals.license_expiry" label="License Expiry" type="date" :min="currentDate" />
            <FileInput ref="editMedicalFile" label="Medical" />
            <InputField v-model="pilotVals.medical_expiry" label="Medical Expiry" type="date" :min="currentDate" />
          </div>
          <div class="modal-action">
            <button class="btn" @click="handleSubmitEdit(pilot_edit_id)">Save Edits</button>
          </div>
        </form>
      </dialog>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue';
  import axios from 'axios';
  import Swal from 'sweetalert2';
  import Table from "../../components/Tables/mainTable.vue"
  
  const pilots = ref([]);
  const pilotVals = ref({
    name: '',
    hours: '',
    license: '',
    license_expiry: '',
    medical: '',
    medical_expiry: ''
  });
  const query = ref('');
  const pilot_edit_id = ref(null);
  const currentDate = ref(new Date().toISOString().split('T')[0]);
  
  const addModal = ref(null);
  const editModal = ref(null);
  
  const licenseFile = ref(null);
  const medicalFile = ref(null);
  const editLicenseFile = ref(null);
  const editMedicalFile = ref(null);
  
  const getPilots = async () => {
    const { data } = await axios.get('/pilots');
    pilots.value = data;
  };
  
  // Open/close modals
  const openAddModal = () => addModal.value.showModal();
  const closeAddModal = () => addModal.value.close();
  
  const openEditModal = (pilot) => {
    pilotVals.value = { ...pilot };
    pilot_edit_id.value = pilot.id;
    editModal.value.showModal();
  };
  const closeEditModal = () => editModal.value.close();
  
  // Handle submit for new pilot
  const handleSubmit = async () => {
    const formData = new FormData();
    formData.append('name', pilotVals.value.name);
    formData.append('hours', pilotVals.value.hours);
    formData.append('license', licenseFile.value.files[0]);
    formData.append('license_expiry', pilotVals.value.license_expiry);
    formData.append('medical', medicalFile.value.files[0]);
    formData.append('medical_expiry', pilotVals.value.medical_expiry);
  
    try {
      await axios.post('/pilots', formData);
      Swal.fire('Success', 'Pilot added successfully', 'success');
      closeAddModal();
      getPilots();
    } catch (error) {
      console.error(error);
      Swal.fire('Error', 'Failed to add pilot', 'error');
    }
  };
  
  // Handle submit for edit
  const handleSubmitEdit = async (id) => {
    const formData = new FormData();
    formData.append('name', pilotVals.value.name);
    formData.append('hours', pilotVals.value.hours);
    formData.append('license', editLicenseFile.value.files[0]);
    formData.append('license_expiry', pilotVals.value.license_expiry);
    formData.append('medical', editMedicalFile.value.files[0]);
    formData.append('medical_expiry', pilotVals.value.medical_expiry);
  
    try {
      await axios.put(`/pilots/${id}`, formData);
      Swal.fire('Success', 'Pilot updated successfully', 'success');
      closeEditModal();
      getPilots();
    } catch (error) {
      console.error(error);
      Swal.fire('Error', 'Failed to update pilot', 'error');
    }
  };
  
  // Fetch pilots when component is mounted
  onMounted(() => {
    getPilots();
  });
  </script>
  