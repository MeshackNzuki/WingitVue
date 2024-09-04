<template>
    <Table
        :headers="[
            'ADM',
            'STUDENT NAME',
            'TITLE',
            'BOOK NUMBER',
            'ISSUED ON',
            'RETURN DATE',
            'OVERDUE',
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
                        {{ book.issue_date }}-
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="ttext-start text-green-500">
                        {{ book.return_date }}
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="ttext-start text-green-500">
                        {{ daysBetween(book.return_date, book.issue_date) }}
                    </div>
                </td>
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

const fetchData = (id) => {
    const showLoader = searchQuery.value.trim() === "";
    axios
        .get("library/reports/not-returned/" + searchQuery.value, {
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
</script>
