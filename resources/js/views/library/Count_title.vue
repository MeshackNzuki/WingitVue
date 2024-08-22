<template>
    <Table :headers="['TITLE', 'COUNT']" title="Book count per title">
        <template v-slot:actions>
            <SmallButton
                icon="pi pi-plus"
                :action="() => showModalFunc('addstudent')"
            ></SmallButton>

            <Button icon="pi pi-print" class="mr-2" severity="secondary" />
            <Button icon="pi pi-upload" severity="secondary"
        /></template>
        <template v-slot:content>
            <tr v-for="(subject, index) in subjectdata" :key="index">
                <td class="p-2 whitespace-nowrap">
                    <div class="text-left">{{ subject.title }}</div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-left font-medium text-green-500">
                        {{ subject.total }}
                    </div>
                </td>
            </tr>
            <!-- create student -->
        </template>
        <!-- end create student -->
    </Table>
</template>
<script setup>
import Table from "../../components/Tables/MainTable.vue";
import CommonButton from "../../components/Buttons/CommonButton.vue";
import SmallButton from "../../components/Buttons/Small.vue";
import { ref, onMounted } from "vue";
import axios from "axios";

const showModalFunc = (modalId) => {
    document.getElementById(modalId).showModal();
};

const subjectdata = ref();

onMounted(async () => {
    const response = await axios.get("library/count_title");
    subjectdata.value = response.data.data.data;
});
</script>
