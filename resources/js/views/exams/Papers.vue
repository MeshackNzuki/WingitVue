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
            <div class="modal-box">
                <form method="dialog">
                    <button
                        class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2"
                    >
                        ✕
                    </button>
                </form>
                <h3 class="text-lg font-bold space-y-2">Add a New Paper!</h3>
                <div class="flex flex-col justify-center items-center">
                    <div class="flex items-center">
                        <input
                            v-model="newPaper.name"
                            type="text"
                            class="form-input"
                            placeholder="Enter Paper Name"
                        />
                    </div>

                    <select v-model="newPaper.subject_id" class="form-select">
                        <option disabled value="">Select Subject</option>
                        <option
                            v-for="subject in subjects"
                            :key="subject.id"
                            :value="subject.id"
                        >
                            {{ subject.name }}
                        </option>
                    </select>

                    <input
                        v-model="newPaper.comments"
                        type="text"
                        class="form-input"
                        placeholder="Add Comments"
                    />
                </div>
            </div>
        </dialog>
        <div class="mt-4">
            <SmallButton @click="addPaper" label="Add Paper" />
            <SmallButton @click="savePapers" label="Save Papers" />
        </div>
    </div>
</template>

<script setup>
import Table from "../../components/Tables/MainTable.vue";
import SmallButton from "../../components/Buttons/Small.vue";
import { ref, onMounted } from "vue";
import axios from "axios";

const selectedExam = ref(null);
const papers = ref([{ name: "", subject_id: null, comments: "" }]);
const subjects = ref([]);
const newPaper = ref([
    { name: "", subject_id: null, subject_id: null, comments: "" },
]);

// Fetch subjects on mount
onMounted(async () => {
    await fetchSubjects();
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
    subjects.value = response.data;
};

// Add a new paper row
const addPaper = () => {
    papers.value.push({ name: "", subject_id: null, comments: "" });
};

// Save papers function
const savePapers = async () => {
    try {
        await axios.post("/papers", {
            newPaper,
        });
        alert("Papers saved successfully!");
    } catch (error) {
        alert("Error saving papers.");
    }
};
</script>

<style scoped>
/* Add custom styling as needed */
</style>
