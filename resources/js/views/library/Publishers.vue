<template>
    <Table
        :headers="[
            'TITLE',
            'BOOK NUMBER',
            'SUBJECT',
            'AUTHOR',
            'ISBN',
            'STATUS',
        ]"
        title="All books"
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
                    <div class="flex items-center">
                        <div class="w-10 h-10 flex-shrink-0 mr-2 sm:mr-3">
                            <img
                                class="rounded-full"
                                src="https://raw.githubusercontent.com/cruip/vuejs-admin-dashboard-template/main/src/images/user-36-05.jpg"
                                width="40"
                                height="40"
                                alt="Alex Shatov"
                            />
                        </div>
                        <div class="text-start">
                            {{ book.title }}
                        </div>
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-left">{{ book.number }}</div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="ttext-start text-green-500">
                        {{ book.subject?.name }}-
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-lg text-center">
                        <p class="text-center">
                            <i
                                :class="[
                                    'pi',
                                    book.status === 'Y'
                                        ? 'pi-check-circle text-green-500'
                                        : 'pi-times-circle text-red-400',
                                ]"
                            ></i>
                        </p>
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-lg text-center">
                        <SmallButton
                            classes="border border-blue-500 border-dotted px-2 text-sm bg-red-500"
                            button-text="Edit"
                            :action="() => showModal(book.id)"
                        />
                    </div>
                </td>
                <dialog
                    :id="book.id"
                    class="modal modal-bottom sm:modal-middle"
                >
                    <div class="modal-box dark:text-slate-400 dark:bg-sky-950">
                        <h3 class="font-bold text-lg">Edit book Information</h3>
                        <p class="py-4 text-xs">Press ESC key to close</p>
                    </div>
                </dialog>
            </tr>

            <!-- create book -->

            <dialog id="addbook" class="modal modal-bottom sm:modal-middle">
                <div class="modal-box dark:text-slate-400 dark:bg-sky-950">
                    <h3 class="font-bold text-lg">Admit book (Add new)</h3>
                    <p class="py-4 text-xs">Press ESC key to close</p>
                </div>
            </dialog>
        </template>
        <!-- end create book -->
    </Table>
</template>
<script setup>
import Table from "../../components/Tables/MainTable.vue";
import CommonButton from "../../components/Buttons/CommonButton.vue";
import SmallButton from "../../components/Buttons/Small.vue";
import axios from "axios";
import { ref, onMounted, watch } from "vue";
</script>
