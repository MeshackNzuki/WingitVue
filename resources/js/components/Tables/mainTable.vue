<template>
    <div class="p-3">
        <div class="overflow-x-auto rounded-md shadow-md">
            <div
                class="bg-lime-200 h-10 p-1 flex flex-row justify-between px-4 items-center"
            >
                <span class="font-bold">{{ title }}</span>
                <span class="font-light">Rows : 249</span>
                <span>
                    <div class="form-control">
                        <input
                            :value="query"
                            @input="updateValue"
                            type="text"
                            placeholder="Search this table"
                            class="input-bordered md:w-auto mx-1 w-full rounded-full px-2 text-base font-light"
                        />
                    </div>
                </span>
                <span class="flex flex-row gap-2">
                    <slot name="actions"></slot>
                </span>
                <i class="pi pi-spin pi-cog"></i>
            </div>
            <table class="table-auto w-full bg-slate-50 dark:bg-sky-950">
                <thead
                    class="text-xs font-semibold uppercase text-gray-400 bg-gray-50"
                >
                    <tr>
                        <th
                            v-for="(header, index) in headers"
                            :key="index"
                            class="p-2 whitespace-nowrap"
                        >
                            <div class="font-semibold text-left">
                                {{ header }}
                            </div>
                        </th>
                    </tr>
                </thead>
                <tbody
                    class="text-sm divide-y divide-gray-100 dark:divide-slate-400 dark:text-slate-300"
                >
                    <slot name="content"></slot>
                </tbody>
            </table>
        </div>
    </div>
</template>

<script setup>
import { defineProps, defineEmits } from "vue";

// Define props
const props = defineProps({
    tableTitle: {
        type: String,
        required: true,
    },
    headers: {
        type: Array,
        required: true,
    },
    title: {
        type: String,
        required: true,
    },
    query: {
        type: String,
        default: "",
    },
});

// Define emits
const emit = defineEmits(["update:query"]);

// Update value and emit change event
const updateValue = (event) => {
    emit("update:query", event.target.value);
};
</script>
