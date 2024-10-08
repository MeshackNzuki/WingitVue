<template>
    <div>
        <Table
            :headers="[
                'Name',
                'Term',
                'Level',
                'Exam Term',
                'Start Date',
                'End Date',
            ]"
            title="All Exams"
        >
            <template v-slot:actions>
                <Button
                    icon="pi pi-refresh"
                    class="mr-2"
                    severity="secondary"
                    @click="fetchExams"
                />
                <Button icon="pi pi-print" class="mr-2" severity="secondary" />
                <Button
                    icon="pi pi-plus"
                    severity="secondary"
                    @click="showModal('addExam')"
                />
            </template>
            <template v-slot:content>
                <tr v-for="(exam, index) in exams" :key="exam.id">
                    <td class="p-2 whitespace-nowrap">
                        <div class="flex items-center">
                            <div class="text-start">{{ exam.name }}</div>
                        </div>
                    </td>
                    <td class="p-2 whitespace-nowrap">
                        <div class="flex items-center">
                            <div class="text-start">{{ exam.term.name }}</div>
                        </div>
                    </td>
                    <td class="p-2 whitespace-nowrap">
                        <div class="flex items-center">
                            <div class="text-start">{{ exam.level.name }}</div>
                        </div>
                    </td>
                    <td class="p-2 whitespace-nowrap">
                        <div class="flex items-center">
                            <div class="text-start">
                                {{ exam.exam_term_id.name }}
                            </div>
                        </div>
                    </td>
                    <td class="p-2 whitespace-nowrap">
                        <div class="flex items-center">
                            <div class="text-start">{{ exam.start_date }}</div>
                        </div>
                    </td>
                    <td class="p-2 whitespace-nowrap">
                        <div class="flex items-center">
                            <div class="text-start">{{ exam.end_date }}</div>
                        </div>
                    </td>
                </tr>
            </template>
        </Table>

        <!-- Modal for Adding a New Exam -->
        <dialog id="addExam" class="modal">
            <div class="modal-box dark:text-slate-400 dark:bg-sky-950">
                <form method="dialog">
                    <button
                        class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2"
                        @click="hideModal('addExam')"
                    >
                        ✕
                    </button>
                </form>
                <h3 class="text-lg font-bold">Add New Exam</h3>
                <div class="flex flex-col space-y-4">
                    <div class="w-full">
                        <label for="examName" class="block text-sm font-medium"
                            >Exam Name</label
                        >
                        <input
                            v-model="newExam.name"
                            type="text"
                            id="examName"
                            class="input input-bordered w-full mt-1"
                            placeholder="Enter Exam Name"
                        />
                    </div>
                    <div class="w-full">
                        <label for="termId" class="block text-sm font-medium"
                            >Term</label
                        >
                        <select
                            v-model="newExam.term_id"
                            id="termId"
                            class="select select-bordered w-full mt-1"
                        >
                            <option disabled value="">Select Term</option>
                            <option
                                v-for="term in terms"
                                :key="term.id"
                                :value="term.id"
                            >
                                {{ term.name }}
                            </option>
                        </select>
                    </div>
                    <div class="w-full">
                        <label for="levelId" class="block text-sm font-medium"
                            >Level</label
                        >
                        <select
                            v-model="newExam.level_id"
                            id="levelId"
                            class="select select-bordered w-full mt-1"
                        >
                            <option disabled value="">Select Level</option>
                            <option
                                v-for="level in levels"
                                :key="level.id"
                                :value="level.id"
                            >
                                {{ level.name }}
                            </option>
                        </select>
                    </div>
                    <div class="w-full">
                        <label
                            for="examTermId"
                            class="block text-sm font-medium"
                            >Exam Term</label
                        >
                        <select
                            v-model="newExam.exam_term_id"
                            id="examTermId"
                            class="select select-bordered w-full mt-1"
                        >
                            <option disabled value="">Select Exam Term</option>
                            <option
                                v-for="examTerm in examTerms"
                                :key="examTerm.id"
                                :value="examTerm.id"
                            >
                                {{ examTerm.name }}
                            </option>
                        </select>
                    </div>
                    <div class="w-full">
                        <label for="startDate" class="block text-sm font-medium"
                            >Start Date</label
                        >
                        <input
                            v-model="newExam.start_date"
                            type="date"
                            id="startDate"
                            class="input input-bordered w-full mt-1"
                        />
                    </div>
                    <div class="w-full">
                        <label for="endDate" class="block text-sm font-medium"
                            >End Date</label
                        >
                        <input
                            v-model="newExam.end_date"
                            type="date"
                            id="endDate"
                            class="input input-bordered w-full mt-1"
                        />
                    </div>
                </div>
                <div class="col-span-2 flex justify-end mt-3">
                    <CommonButton button-text="Submit" :action="addExam" />
                </div>
            </div>
        </dialog>
    </div>
</template>

<script setup>
import Table from "../../components/Tables/MainTable.vue";
import CommonButton from "../../components/Buttons/CommonButton.vue";
import { ref, onMounted } from "vue";
import axios from "axios";

// State variables
const exams = ref([]);
const newExam = ref({
    name: "",
    term_id: null,
    level_id: null,
    exam_term_id: null,
    start_date: "",
    end_date: "",
});
const terms = ref([]);
const levels = ref([]);
const examTerms = ref([]);

// Fetch data on component mount
onMounted(() => {
    fetchExams();
    fetchTerms();
    fetchLevels();
    fetchExamTerms();
});

// API calls
const fetchExams = async () => {
    try {
        const response = await axios.get("exams/exams");
        exams.value = response.data;
    } catch (error) {
        console.error("Error fetching exams:", error);
    }
};

const fetchTerms = async () => {
    try {
        const response = await axios.get("/terms");
        terms.value = response.data;
    } catch (error) {
        console.error("Error fetching terms:", error);
    }
};

const fetchLevels = async () => {
    try {
        const response = await axios.get("admissions/levels");
        levels.value = response.data;
    } catch (error) {
        console.error("Error fetching levels:", error);
    }
};

const fetchExamTerms = async () => {
    try {
        const response = await axios.get("/exams/exam_terms");
        examTerms.value = response.data;
    } catch (error) {
        console.error("Error fetching exam terms:", error);
    }
};

// Add new exam
const addExam = async () => {
    try {
        await axios.post("/exams", newExam.value);
        await fetchExams(); // Refresh exams list
        hideModal("addExam");
    } catch (error) {
        console.error("Error adding exam:", error);
    }
};

// Modal control
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
