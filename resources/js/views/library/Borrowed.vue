<template>
    <Table
        :headers="[
            'ADM',
            'STUDENT NAME',
            'TITLE',
            'BOOK NUMBER',
            'ISSUED ON',
            'RETURN DATE',
            'ACTION',
        ]"
        title="Borrowed books"
        v-model:query="searchQuery"
        :rows="books?.length"
    >
        <template v-slot:actions>
            <SmallButton
                icon="pi pi-plus"
                :action="() => showModalFunc('addbook')"
            ></SmallButton>

            <Button icon="pi pi-print" class="mr-2" severity="secondary" />
            <Button icon="pi pi-upload" severity="secondary"
        /></template>
        <template v-slot:content>
            <tr v-for="(book, index) in books" :key="index">
                <td class="p-2 whitespace-nowrap">
                    <div class="text-left">{{ book.student?.admission }}</div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-left">
                        {{
                            book.student?.first_name +
                            " " +
                            book.student?.first_name
                        }}
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="flex items-center">
                        <div class="text-start">
                            {{ book.book.title }}
                        </div>
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-left">{{ book.book?.number }}</div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="ttext-start text-green-500">
                        {{ book.issue_date }}
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="ttext-start text-green-500">
                        {{ book.return_date }}
                    </div>
                </td>

                <td class="p-2 whitespace-nowrap">
                    <div class="text-lg text-center">
                        <SmallButton
                            classes="border border-blue-500 border-dotted px-2 text-sm bg-emerald-500"
                            button-text="Receive"
                            :action="() => showModalFunc(book.id)"
                        />
                    </div>
                </td>

                <dialog :id="book.id" class="modal">
                    <div class="modal-box">
                        <form method="dialog">
                            <button
                                class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2"
                            >
                                ✕
                            </button>
                        </form>
                        <h3 class="text-lg font-bold">Receive this Book</h3>
                        <div class="flex flex-col">
                            <div class="-m-1.5 overflow-x-auto">
                                <div
                                    class="p-1.5 min-w-full inline-block align-middle"
                                >
                                    <div class="overflow-hidden">
                                        <table
                                            class="min-w-full divide-y divide-gray-200 dark:divide-neutral-700"
                                        >
                                            <thead>
                                                <tr>
                                                    <th
                                                        scope="col"
                                                        class="px-6 py-3 text-start text-xstext-left text-gray-500 uppercase dark:text-neutral-500"
                                                    >
                                                        Student Name
                                                    </th>

                                                    <th
                                                        scope="col"
                                                        class="px-6 py-3 text-end text-xstext-left text-gray-500 uppercase dark:text-neutral-500"
                                                    >
                                                        {{
                                                            book.student
                                                                .first_name +
                                                            " " +
                                                            book.student
                                                                .second_name
                                                        }}
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th
                                                        scope="col"
                                                        class="px-6 py-3 text-start text-xstext-left text-gray-500 uppercase dark:text-neutral-500"
                                                    >
                                                        Student Adm
                                                    </th>

                                                    <th
                                                        scope="col"
                                                        class="px-6 py-3 text-end text-xstext-left text-gray-500 uppercase dark:text-neutral-500"
                                                    >
                                                        {{
                                                            book.student
                                                                .admission
                                                        }}
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th
                                                        scope="col"
                                                        class="px-6 py-3 text-start text-xstext-left text-gray-500 uppercase dark:text-neutral-500"
                                                    >
                                                        Issued On
                                                    </th>

                                                    <th
                                                        scope="col"
                                                        class="px-6 py-3 text-end text-xstext-left text-gray-500 uppercase dark:text-neutral-500"
                                                    >
                                                        {{ book.issue_date }}
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th
                                                        scope="col"
                                                        class="px-6 py-3 text-start text-xstext-left text-gray-500 uppercase dark:text-neutral-500"
                                                    >
                                                        Issued On
                                                    </th>

                                                    <th
                                                        scope="col"
                                                        class="px-6 py-3 text-end text-xstext-left text-gray-500 uppercase dark:text-neutral-500"
                                                    >
                                                        {{ book.return_date }}
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th
                                                        scope="col"
                                                        class="px-6 py-3 text-start text-xstext-left text-gray-500 uppercase dark:text-neutral-500"
                                                    >
                                                        Days Over Due
                                                    </th>

                                                    <th
                                                        scope="col"
                                                        class="px-6 py-3 text-end text-xstext-left text-gray-500 uppercase dark:text-neutral-500"
                                                    >
                                                        {{
                                                            daysBetween(
                                                                book.return_date,
                                                                book.issue_date,
                                                            )
                                                        }}
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th
                                                        scope="col"
                                                        class="px-6 py-3 text-start text-xstext-left text-gray-500 uppercase dark:text-neutral-500"
                                                    >
                                                        Accumulated Fine
                                                    </th>

                                                    <th
                                                        scope="col"
                                                        class="px-6 py-3 text-end text-xstext-left text-gray-500 uppercase dark:text-neutral-500"
                                                    >
                                                        {{
                                                            daysBetween(
                                                                book.return_date,
                                                                book.issue_date,
                                                                book.return_days_limit,
                                                            )
                                                        }}
                                                    </th>
                                                </tr>
                                            </thead>
                                        </table>
                                        <div class="flex justify-center mt-3">
                                            <CommonButton
                                                button-text="Receive and Clear"
                                                :action="
                                                    () => {
                                                        ReceiveBook(book.id);
                                                    }
                                                "
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <form method="dialog" class="modal-backdrop">
                        <button>close</button>
                    </form>
                </dialog>
            </tr>
            <!-- create book -->
        </template>
        <!-- end create book -->
    </Table>
</template>
<script setup>
import Table from "../../components/Tables/MainTable.vue";
import CommonButton from "../../components/Buttons/CommonButton.vue";
import SmallButton from "../../components/Buttons/Small.vue";
import { toast } from "vue3-toastify";
import axios from "axios";
import { useToast } from "primevue/usetoast";
import { ref, onMounted, watch } from "vue";

const books = ref([]);
const searchQuery = ref("");
const reload = ref(false);
const toastPrime = useToast();

onMounted(() => {
    fetchData();
});

watch([searchQuery, reload], () => {
    fetchData();
});

const showModalFunc = (modalId) => {
    document.getElementById(modalId).showModal();
};

const hideModalFunc = (modalId) => {
    document.getElementById(modalId).close();
};

const fetchData = (id) => {
    const showLoader = searchQuery.value.trim() === "";
    axios
        .get("library/book_issue/" + searchQuery.value, {
            showLoader: showLoader,
        })
        .then((response) => {
            books.value = response.data.data.data;
        });
};

const daysBetween = (returnDate, issueDate, returnDaysLimit) => {
    const oneDay = 24 * 60 * 60 * 1000; // milliseconds in a day
    const diffInTime = new Date(returnDate) - new Date(issueDate);
    const daysOverdue = Math.round(diffInTime / oneDay) - returnDaysLimit;

    return daysOverdue > 0 ? daysOverdue * dailyFine : 0;
};

const handleView = (id) => {
    axios
        .get("library/book-issue/edit/" + id)
        .then((response) => {
            console.log(response.data);
            setViewBook(response.data);
            reload ? setReload(false) : setReload(true);
        })
        .catch((error) => {
            console.log(error.message);
        });
};

const ReceiveBook = (id) => {
    axios
        .post("library/book-issue/update/" + id)
        .then((response) => {
            console.log(response);
            axios
                .post("library/book-issue/delete/" + id)
                .then((response) => {})
                .catch((error) => {
                    console.log(error);
                });

            hideModalFunc(id);

            toastPrime.add({
                severity: "success",
                summary: "Success Message",
                detail: "Received and Cleared!",
                life: 3000,
            });

            searchQuery.value = "";

            reload.value = !reload.value;
            console.log("reload", reload.value);
        })
        .catch((error) => {
            console.log(error);
        });
};
</script>
