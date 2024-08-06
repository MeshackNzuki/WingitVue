<template>
    <Table
        :headers="['CLASS/LEVEL', 'DESCRIPTION', 'TOTAL FEE', 'ACTION']"
        title="Manage fees"
        v-model:query="searchQuery"
        :rows="studentData?.length"
    >
        <template v-slot:actions>
            <SmallButton
                icon="pi pi-plus"
                classes="px-4"
                :action="() => showModalFunc('addFeeStructure')"
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
                id="addFeeStructure"
                class="modal modal-lg modal-bottom sm:modal-middle"
            >
                <div
                    class="modal-box dark:text-slate-400 dark:bg-sky-950 w-full max-w-5xl"
                >
                    <h3 class="font-bold">Add New Fee Structure</h3>
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
                                        <div class="col-span-2">
                                            <label
                                                for="class"
                                                class="block text-sm font-medium"
                                                >Class</label
                                            >
                                            <input
                                                v-model="feeStructure.level"
                                                type="text"
                                                id="class"
                                                name="class"
                                                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                                placeholder="Enter class"
                                            />
                                            <span
                                                v-if="errors.level"
                                                class="text-red-500 text-sm"
                                                >{{ errors.level }}</span
                                            >
                                        </div>
                                        <div class="col-span-2">
                                            <label
                                                for="description"
                                                class="block text-sm font-medium"
                                                >Description</label
                                            >
                                            <input
                                                v-model="
                                                    feeStructure.description
                                                "
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
                                <div
                                    class="divider lg:divider-horizontal divider-info"
                                ></div>

                                <div class="grid card p-1 rounded-sm">
                                    <span class="mb-2 font-bold"
                                        >Fee Details</span
                                    >
                                    <div
                                        class="col-span-2"
                                        v-for="(
                                            detail, index
                                        ) in feeStructure.details"
                                        :key="index"
                                    >
                                        <div class="flex justify-between mb-2">
                                            <div class="flex-1 mr-2">
                                                <label
                                                    for="detail_name"
                                                    class="block text-sm font-medium"
                                                    >Detail Name</label
                                                >
                                                <input
                                                    v-model="detail.name"
                                                    type="text"
                                                    id="detail_name"
                                                    name="detail_name"
                                                    class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                                    placeholder="Enter detail name"
                                                />
                                            </div>
                                            <div class="flex-1 ml-2">
                                                <label
                                                    for="amount"
                                                    class="block text-sm font-medium"
                                                    >Amount</label
                                                >
                                                <input
                                                    v-model="detail.amount"
                                                    type="number"
                                                    id="amount"
                                                    name="amount"
                                                    class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                                    placeholder="Enter amount"
                                                />
                                            </div>
                                            <button
                                                type="button"
                                                @click="removeDetail(index)"
                                                class="btn btn-sm btn-circle btn-outline"
                                            >
                                                &times;
                                            </button>
                                        </div>
                                    </div>

                                    <div
                                        class="col-span-2 flex justify-end mt-2"
                                    >
                                        <CommonButton
                                            button-text="Add"
                                            :action="() => addDetail()"
                                        />
                                    </div>
                                </div>
                            </div>

                            <div class="w-full bg-gray-50 p-1 rounded-md">
                                <span>Fee Structure Summary</span>
                                <table class="min-w-full rounded-lg">
                                    <thead>
                                        <tr>
                                            <th
                                                class="py-2 px-2 bg-gray-100 border-b text-left"
                                            >
                                                Description
                                            </th>
                                            <th
                                                class="py-2 px-2 bg-gray-100 border-b text-left"
                                            ></th>
                                            <th
                                                class="py-2 px-2 bg-gray-100 border-b text-right"
                                            >
                                                Amount
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr
                                            v-for="(
                                                detail, index
                                            ) in feeStructure.details"
                                            :key="index"
                                        >
                                            <td class="py-1 px-2 border-b">
                                                {{ detail.name }}
                                            </td>
                                            <td class="py-1 px-2 border-b"></td>
                                            <td
                                                class="py-1 px-2 border-b text-right"
                                            >
                                                ${{ detail.amount }}
                                            </td>
                                        </tr>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th
                                                class="py-2 px-2 border-t text-left"
                                            ></th>
                                            <th
                                                class="py-2 px-2 border-t text-left"
                                            >
                                                Sub Total
                                            </th>
                                            <th
                                                class="py-2 px-2 border-t text-right"
                                            >
                                                ${{ computeTotal() }}
                                            </th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <div class="col-span-2 flex justify-end">
                                <CommonButton
                                    button-text="Save"
                                    :action="() => submitForm()"
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

const feeStructure = ref({
    level: "",
    description: "",
    details: [{ name: "", amount: 0 }],
});

const errors = ref({});
const searchQuery = ref("");

const addDetail = () => {
    feeStructure.value.details.push({ name: "", amount: 0 });
};

const removeDetail = (index) => {
    feeStructure.value.details.splice(index, 1);
};

const computeTotal = () => {
    return feeStructure.value.details.reduce(
        (sum, detail) => sum + parseFloat(detail.amount || 0),
        0,
    );
};

const submitForm = async () => {
    try {
        await axios.post("finance/fee-structures", feeStructure.value);
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
