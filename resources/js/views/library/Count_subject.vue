<template>
    <Table :headers="['SUBJECT', 'COUNT']" title="BooK count per subject">
        <template v-slot:actions>
            <SmallButton
                icon="pi pi-plus"
                :action="() => showModal('addstudent')"
            ></SmallButton>

            <Button icon="pi pi-print" class="mr-2" severity="secondary" />
            <Button icon="pi pi-upload" severity="secondary"
        /></template>
        <template v-slot:content>
            <tr v-for="(subject, key, index) in subjectdata" :key="index">
                <td class="p-2 whitespace-nowrap">
                    <div class="text-left">{{ key }}</div>
                    <!-- Displaying the subject name -->
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="ttext-start text-green-500">
                        {{ subject }}
                        <!-- Displaying the subject value/score -->
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

const showModal = (modalId) => {
    document.getElementById(modalId).showModal();
};

const subjectdata = ref();

onMounted(async () => {
    const response = await axios.get("library/count_subject");
    subjectdata.value = response.data.data;
});
</script>
