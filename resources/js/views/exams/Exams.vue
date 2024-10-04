<template>
    <div class="flex justify-center">
        Select paper , select class,(Should be advanced for easy manipulation of
        marks)
    </div>
    <div>
        <Table
            :headers="[
                'Class',
                'Student Name',
                'Admission No.',
                'Subject',
                'Marks',
                'Comments',
            ]"
            title="All Exams"
        >
            <template v-slot:actions>
                <SmallButton
                    icon="pi pi-plus"
                    :action="() => showModal('addMarks')"
                ></SmallButton>

                <Button icon="pi pi-print" class="mr-2" severity="secondary" />
                <Button icon="pi pi-upload" severity="secondary"
            /></template>
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
        <dialog id="addMarks" class="modal">
            <div class="modal-box dark:text-slate-400 dark:bg-sky-950">
                <form method="dialog">
                    <button
                        class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2"
                    >
                        ✕
                    </button>
                </form>
                <h3 class="text-lg font-bold">Add a New Mark!</h3>
                <div class="flex flex-col justify-center items-start space-y-4">
                    <div class="w-full">
                        <label
                            for="examsSelect"
                            class="block text-sm font-medium text-gray-700 dark:text-slate-300"
                            >Student Admission</label
                        >
                        <select
                            v-model="newMark.admission_no"
                            id="examsSelect"
                            class="select select-bordered w-full mt-1"
                        >
                            <option disabled value="">Select ADM</option>
                            <option
                                v-for="student in students"
                                :key="student.id"
                                :value="student.id"
                            >
                                {{ student.name }}
                            </option>
                        </select>
                    </div>

                    <div class="w-full">
                        <label
                            for="subjectSelect"
                            class="block text-sm font-medium text-gray-700 dark:text-slate-300"
                            >Select paper</label
                        >
                        <select
                            v-model="newMark.paper_id"
                            id="subjectSelect"
                            class="select select-bordered w-full mt-1"
                        >
                            <option disabled value="">Select Paper</option>
                            <option
                                v-for="paper in papers"
                                :key="paper.id"
                                :value="paper.id"
                            >
                                {{ paper.name }}
                            </option>
                        </select>
                    </div>

                    <div class="w-full">
                        <label
                            for="comments"
                            class="block text-sm font-medium text-gray-700 dark:text-slate-300"
                            >Comments</label
                        >
                        <input
                            v-model="newMark.comments"
                            type="text"
                            id="comments"
                            class="input input-bordered w-full mt-1"
                            placeholder="Add Comments"
                        />
                    </div>
                </div>
                <div class="col-span-2 flex justify-end mt-3">
                    <CommonButton
                        button-text="Submit"
                        :action="() => addPaper()"
                    />
                </div>
            </div>
        </dialog>
    </div>
</template>

<script setup>
import Table from "../../components/Tables/MainTable.vue";
import SmallButton from "../../components/Buttons/Small.vue";

import { ref, onMounted } from "vue";
import axios from "axios";

const newMark = ref([
    { mark: "", paper_id: null, admission_no: null, comments: "" },
]);

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
const fetchStudents = async () => {
    const response = await axios.get("/api/subjects");
    subjects.value = response.data;
};

// Save marks function
const saveMarks = async () => {
    try {
        await axios.post("/api/marks", {});
    } catch (error) {}
};

const showModal = (modalId) => {
    document.getElementById(modalId).showModal();
};

const hideModal = (modalId) => {
    document.getElementById(modalId).close();
};
</script>

<style scoped>
/* Add custom styling as needed */
</style>
