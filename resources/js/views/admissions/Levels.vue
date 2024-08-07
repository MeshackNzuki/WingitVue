<template>
    <div class="flex justify-around">
        <SmallButton
            icon="pi pi-plus"
            classes="px-4"
            button-text="Add new level"
            :action="() => showModalFunc('addNewClass')"
        ></SmallButton>
        <SmallButton
            icon="pi pi-plus"
            button-text="Add new Stream"
            classes="px-4"
            :action="() => showModalFunc('addStream')"
        ></SmallButton>
    </div>
    <Table
        :headers="['CLASS/LEVEL', 'STREAM', 'DESCRIPTION', 'ACTION']"
        title="Levels / Classes"
        v-model:query="searchQuery"
        :rows="studentData?.length"
    >
        <template v-slot:actions>
            <SmallButton
                icon="pi pi-plus"
                classes="px-4"
                :action="() => showModalFunc('addNewClass')"
            ></SmallButton>

            <Button icon="pi pi-print" class="mr-2" severity="secondary" />
            <Button icon="pi pi-upload" severity="secondary" />
        </template>

        <template v-slot:content>
            <tr v-for="(student, index) in studentData" :key="index">
                <td class="p-2 whitespace-nowrap">
                    <div class="flex items-center">
                        <div class="w-10 h-10 flex-shrink-0 mr-2 sm:mr-3">
                            <img
                                class="rounded-full"
                                src="https://raw.githubusercontent.com/cruip/vuejs-admin-dashboard-template/main/src/images/user-36-05.jpg"
                                width="40"
                                height="40"
                                alt="Student"
                            />
                        </div>
                        <div class="font-medium">
                            {{ student.first_name }}
                        </div>
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-left">{{ student.admission }}</div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-left font-medium text-green-500">
                        {{ student.class?.level }}
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-center">
                        <SmallButton
                            classes="border border-blue-500 border-dotted px-2 text-sm bg-red-500"
                            button-text="Edit"
                            :action="() => showModalFunc(student.id)"
                        />
                    </div>
                </td>
            </tr>

            <!-- Create fee structure -->
            <dialog
                id="addNewClass"
                class="modal modal-lg modal-bottom sm:modal-middle"
            >
                <div
                    class="modal-box dark:text-slate-400 dark:bg-sky-950 w-full max-w-5xl"
                >
                    <h3 class="font-bold">Add New Class</h3>
                    <p class="py-4 text-xs">Press ESC key to close</p>
                    <div class="modal-action">
                        <form method="dialog" class="flex flex-col gap-2">
                            <button
                                class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2"
                            >
                                ✕
                            </button>

                            <div class="flex flex-col w-full lg:flex-row">
                                <div class="grid card rounded-sm p-1">
                                    <span class="mb-2 font-bold"
                                        >Level/Class Information</span
                                    >
                                    <div>
                                        <div class="">
                                            <label
                                                for="class"
                                                class="block text-sm font-medium"
                                                >Class / Level / Year</label
                                            >
                                            <input
                                                v-model="newClass.level"
                                                type="number"
                                                id="class"
                                                name="level"
                                                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                                placeholder="Enter class"
                                            />
                                            <span
                                                v-if="errors.level"
                                                class="text-red-500 text-sm"
                                                >{{ errors.level }}</span
                                            >
                                        </div>
                                        <div class="">
                                            <label
                                                for="description"
                                                class="block text-sm font-medium"
                                                >Description</label
                                            >
                                            <input
                                                v-model="newClass.description"
                                                type="text"
                                                id="description"
                                                name="description"
                                                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                                placeholder="Enter description"
                                            />
                                            <span
                                                v-if="errors.description"
                                                class="text-red-500 text-sm"
                                                >{{ errors.description }}</span
                                            >
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-span-2 flex justify-end">
                                <CommonButton
                                    button-text="Save Class"
                                    :action="() => submitClassForm()"
                                />
                            </div>
                        </form>
                    </div>
                </div>
            </dialog>
        </template>
    </Table>
    <Table
        :headers="[
            'CLASS/LEVEL',
            'STREAM',
            'CAPACITY',
            'CLASS TEACHER',
            'DESCRIPTION',
            'ACTION',
        ]"
        title="Streams"
        v-model:query="searchQuery"
        :rows="studentData?.length"
    >
        <template v-slot:actions>
            <SmallButton
                icon="pi pi-plus"
                classes="px-4"
                :action="() => showModalFunc('addStream')"
            ></SmallButton>

            <Button icon="pi pi-print" class="mr-2" severity="secondary" />
            <Button icon="pi pi-upload" severity="secondary" />
        </template>

        <template v-slot:content>
            <tr v-for="(student, index) in studentData" :key="index">
                <td class="p-2 whitespace-nowrap">
                    <div class="flex items-center">
                        <div class="w-10 h-10 flex-shrink-0 mr-2 sm:mr-3">
                            <img
                                class="rounded-full"
                                src="https://raw.githubusercontent.com/cruip/vuejs-admin-dashboard-template/main/src/images/user-36-05.jpg"
                                width="40"
                                height="40"
                                alt="Student"
                            />
                        </div>
                        <div class="font-medium">
                            {{ student.first_name }}
                        </div>
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-left">{{ student.admission }}</div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-left font-medium text-green-500">
                        {{ student.class?.level }}
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-center">
                        <SmallButton
                            classes="border border-blue-500 border-dotted px-2 text-sm bg-red-500"
                            button-text="Edit"
                            :action="() => showModalFunc(student.id)"
                        />
                    </div>
                </td>
            </tr>

            <!-- Create fee structure -->
            <dialog
                id="addStream"
                class="modal modal-lg modal-bottom sm:modal-middle"
            >
                <div
                    class="modal-box dark:text-slate-400 dark:bg-sky-950 w-full max-w-5xl"
                >
                    <h3 class="font-bold">Add New Stream</h3>
                    <p class="py-4 text-xs">Press ESC key to close</p>
                    <div class="modal-action">
                        <form method="dialog" class="flex flex-col gap-2">
                            <button
                                class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2"
                            >
                                ✕
                            </button>

                            <div class="flex flex-col w-full lg:flex-row">
                                <div class="grid card rounded-sm p-1">
                                    <span class="mb-2 font-bold"
                                        >Stream Information</span
                                    >
                                    <div>
                                        <div class="">
                                            <label
                                                for="class"
                                                class="block text-sm font-medium"
                                                >Stream Name</label
                                            >
                                            <input
                                                v-model="newStream.name"
                                                type="text"
                                                id="class"
                                                name="class"
                                                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                                placeholder="Enter class"
                                            />
                                            <span
                                                v-if="errors.newStreamName"
                                                class="text-red-500 text-sm"
                                                >{{
                                                    errors.newStreamName
                                                }}</span
                                            >
                                        </div>

                                        <div class="">
                                            <label
                                                for="description"
                                                class="block text-sm font-medium"
                                                >Description</label
                                            >
                                            <input
                                                v-model="newStream.description"
                                                type="text"
                                                id="description"
                                                name="description"
                                                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                                placeholder="Enter description"
                                            />
                                            <span
                                                v-if="
                                                    errors.newStreamDescription
                                                "
                                                class="text-red-500 text-sm"
                                                >{{
                                                    errors.newStreamDescription
                                                }}</span
                                            >
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-span-2 flex justify-end">
                                <CommonButton
                                    button-text="Save Stream"
                                    :action="() => submitStreamForm()"
                                />
                            </div>
                        </form>
                    </div>
                </div>
            </dialog>
        </template>
    </Table>
</template>

<script setup>
import Table from "../../components/Tables/MainTable.vue";
import CommonButton from "../../components/Buttons/CommonButton.vue";
import SmallButton from "../../components/Buttons/Small.vue";
import { ref, onMounted, watch } from "vue";
import axios from "axios";

const showModalFunc = (modalId) => {
    document.getElementById(modalId).showModal();
};

const newClass = ref({
    level: "",
    description: "",
});

const newStream = ref({
    name: "",
    description: "",
});

const errors = ref({});

const searchQuery = ref("");

const submitStreamForm = async () => {
    try {
        await axios.post("admissions/streams", newStream.value);
        // handle success (e.g., show a success message or reload data)
    } catch (error) {
        // handle error (e.g., show error messages)
        errors.value = error.response.data.errors || {};
    }
};

const submitClassForm = async () => {
    try {
        await axios.post("admissions/levels", newClass.value);

        // handle success (e.g., show a success message or reload data)
    } catch (error) {
        // handle error (e.g., show error messages)
        errors.value = error.response.data.errors || {};
    }
};

onMounted(async () => {
    // fetch any initial data if necessary
});
</script>

<style scoped>
/* Add your styles here */
</style>
