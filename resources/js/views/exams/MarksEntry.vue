<template>
    <div>
        <!-- Marks Entry Header -->
        <div class="flex justify-around my-4">
            <h2 class="text-xl font-bold">Marks Entry</h2>
            <SmallButton
                icon="pi pi-save"
                button-text="Save Marks"
                :action="saveMarks"
                classes="px-4"
            />
            <SmallButton
                icon="pi pi-refresh"
                button-text="Reset Form"
                :action="resetForm"
                classes="px-4"
            />
        </div>

        <!-- Select Class and Subject -->
        <div class="grid grid-cols-2 gap-4">
            <div>
                <label for="class" class="block text-sm font-medium"
                    >Select Class</label
                >
                <select
                    v-model="selectedClass"
                    id="class"
                    class="form-select mt-1 block w-full"
                >
                    <option
                        v-for="classItem in classes"
                        :key="classItem.id"
                        :value="classItem.id"
                    >
                        {{ classItem.name }}
                    </option>
                </select>
            </div>

            <div>
                <label for="subject" class="block text-sm font-medium"
                    >Select Subject</label
                >
                <select
                    v-model="selectedSubject"
                    id="subject"
                    class="form-select mt-1 block w-full"
                >
                    <option
                        v-for="subjectItem in subjects"
                        :key="subjectItem.id"
                        :value="subjectItem.id"
                    >
                        {{ subjectItem.name }}
                    </option>
                </select>
            </div>
        </div>

        <!-- Marks Entry Table -->
        <Table
            :headers="['Student Name', 'Admission No.', 'Marks', 'Comments']"
            title="Enter Marks"
        >
            <template v-slot:content>
                <tr v-for="(student, index) in students" :key="student.id">
                    <td class="p-2">
                        <div class="flex items-center">
                            <div class="font-medium">{{ student.name }}</div>
                        </div>
                    </td>
                    <td class="p-2">
                        <div class="text-left">{{ student.admission_no }}</div>
                    </td>
                    <td class="p-2">
                        <input
                            v-model="student.marks"
                            type="number"
                            class="form-input"
                            placeholder="Enter Marks"
                        />
                    </td>
                    <td class="p-2">
                        <input
                            v-model="student.comments"
                            type="text"
                            class="form-input"
                            placeholder="Add Comments"
                        />
                    </td>
                </tr>
            </template>
        </Table>
    </div>
</template>

<script setup>
import Table from "../../components/Tables/MainTable.vue";
import SmallButton from "../../components/Buttons/SmallButton.vue";

import { ref, onMounted } from "vue";
import axios from "axios";

// Data for dropdowns and form
const selectedClass = ref(null);
const selectedSubject = ref(null);
const students = ref([]);
const classes = ref([]);
const subjects = ref([]);

// Fetch students based on class and subject selection
onMounted(async () => {
    await fetchClasses();
    await fetchSubjects();
});

// Fetch classes
const fetchClasses = async () => {
    const response = await axios.get("/api/classes");
    classes.value = response.data;
};

// Fetch subjects
const fetchSubjects = async () => {
    const response = await axios.get("/api/subjects");
    subjects.value = response.data;
};

// Save marks function
const saveMarks = async () => {
    try {
        await axios.post("/api/marks", {
            class_id: selectedClass.value,
            subject_id: selectedSubject.value,
            students: students.value,
        });
        showSuccessModal.value = true;
    } catch (error) {
        showErrorModal.value = true;
    }
};

// Reset form function
const resetForm = () => {
    students.value.forEach((student) => {
        student.marks = "";
        student.comments = "";
    });
};
</script>

<style scoped>
/* Add custom styling as needed */
</style>
