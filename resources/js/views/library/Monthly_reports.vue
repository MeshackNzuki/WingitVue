<template>
    <Table
        :headers="[
            'ADM',
            'STUDENT NAME',
            'TITLE',
            'BOOK NUMBER',
            'ISSUED ON',
            'RETURN DATE',
        ]"
        title="Daily reports"
        v-model:query="searchQuery"
        search_placeholder="Enter date"
        search_type="month"
        :rows="books?.length"
    >
        <template v-slot:actions>
            <SmallButton
                icon="pi pi-plus"
                :action="() => showModal('addbook')"
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

const showModal = (modalId) => {
    document.getElementById(modalId).showModal();
};

const hideModal = (modalId) => {
    document.getElementById(modalId).close();
};

const fetchData = (id) => {
    axios
        .post("library/reports/month-wise/", { month: searchQuery.value })
        .then((response) => {
            console.log("first", response);
            books.value = response.data.data.data;
        });
};
</script>
