<template>
    <div>
        <Table
            :headers="['Paper Name', 'Subject', '', 'Comments']"
            title="Papers"
        >
            <template v-slot:actions>
                <SmallButton
                    icon="pi pi-plus"
                    :action="() => showModalFunc('addPaper')"
                ></SmallButton>

                <Button icon="pi pi-print" class="mr-2" severity="secondary" />
                <Button icon="pi pi-upload" severity="secondary"
            /></template>
            <template v-slot:content>
                <tr v-for="(paper, index) in papers" :key="index"></tr>
            </template>
        </Table>
        <dialog id="addPaper" class="modal">
            <div class="modal-box dark:text-slate-400 dark:bg-sky-950">
                <form method="dialog">
                    <button
                        class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2"
                    >
                        ✕
                    </button>
                </form>
                <h3 class="text-lg font-bold">Add a New Paper!</h3>
                <div class="flex flex-col justify-center items-start space-y-4">
                    <div class="w-full">
                        <label
                            for="paperName"
                            class="block text-sm font-medium text-gray-700 dark:text-slate-300"
                            >Paper Name</label
                        >
                        <input
                            v-model="newPaper.name"
                            type="text"
                            id="paperName"
                            class="input input-bordered w-full mt-1"
                            placeholder="Enter Paper Name"
                        />
                    </div>
                    <div class="w-full">
                        <label
                            for="examsSelect"
                            class="block text-sm font-medium text-gray-700 dark:text-slate-300"
                            >Select Exam</label
                        >
                        <select
                            v-model="newPaper.exam_id"
                            id="examsSelect"
                            class="select select-bordered w-full mt-1"
                        >
                            <option disabled value="">Select Exams</option>
                            <option
                                v-for="exam in exams"
                                :key="exam.id"
                                :value="exam.id"
                            >
                                {{ exam.name }}
                            </option>
                        </select>
                    </div>

                    <div class="w-full">
                        <label
                            for="subjectSelect"
                            class="block text-sm font-medium text-gray-700 dark:text-slate-300"
                            >Select Subject</label
                        >
                        <select
                            v-model="newPaper.subject_id"
                            id="subjectSelect"
                            class="select select-bordered w-full mt-1"
                        >
                            <option disabled value="">Select Subject</option>
                            <option
                                v-for="subject in subjects"
                                :key="subject.id"
                                :value="subject.id"
                            >
                                {{ subject.name }}
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
                            v-model="newPaper.comments"
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
import CommonButton from "../../components/Buttons/CommonButton.vue";
import { ref, onMounted } from "vue";
import axios from "axios";

const papers = ref([{ name: "", subject_id: null, comments: "" }]);
const subjects = ref([]);
const exams = ref([]);
const newPaper = ref([
    { name: "", subject_id: null, subject_id: null, comments: "" },
]);

// Fetch subjects on mount
onMounted(async () => {
    await fetchSubjects();
    await fetchExams();
});

const showModalFunc = (modalId) => {
    document.getElementById(modalId).showModal();
};

const hideModalFunc = (modalId) => {
    document.getElementById(modalId).close();
};
// Fetch subjects
const fetchSubjects = async () => {
    const response = await axios.get("/subjects");
    subjects.value = response.data.data;
};
const fetchExams = async () => {
    const response = await axios.get("/exams");
    exams.value = response.data.data;
    console.log("first", response.data);
};

// Save papers function
const addPaper = async () => {
    try {
        await axios.post("/papers", {
            newPaper,
        });
        alert("Papers saved successfully!");
    } catch (error) {
        console.log("error", error);
        alert("Error saving papers.");
    }
};
</script>

<style scoped>
/* Add custom styling as needed */
</style>
