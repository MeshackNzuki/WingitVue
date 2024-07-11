<template>
    <div :class="'p-3 text-3xl transition-all duration-300' + fs">
        <div :class="'overflow-x-auto rounded-md shadow-md ' + fs">
            <div
                class="bg-lime-200 h-10 p-1 flex flex-row justify-between px-4 items-center"
            >
                <span class="font-bold">{{ title }}</span>
                <span class="font-light">
                    {{ rows > 0 ? "Showing : " + rows + " rows" : "" }}</span
                >
                <span class="font-bold"
                    ><i
                        @click="zoomOut"
                        class="pi pi-minus cursor-pointer bg-sky-500 rounded-badge p-1 text-white hover:scale-105"
                    ></i
                    ><span class="mx-1 font-light">Zoom</span
                    ><i
                        @click="zoomIn"
                        class="pi pi-plus cursor-pointer bg-sky-500 rounded-badge p-1 text-white hover:scale-105"
                    ></i
                ></span>
                <span>
                    <div class="form-control">
                        <input
                            :value="query"
                            @input="updateValue"
                            type="text"
                            placeholder="Search this table"
                            class="input-bordered md:w-auto mx-1 w-full rounded-full px-2 font-light"
                        />
                    </div>
                </span>
                <span class="flex flex-row gap-2">
                    <slot name="actions"></slot>
                </span>
                <i class="pi pi-spin pi-cog"></i>
            </div>
            <table
                :class="
                    'table-auto w-full bg-slate-50 dark:bg-sky-950 text-sm' + fs
                "
            >
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
                    class="divide-y divide-gray-100 dark:divide-slate-400 dark:text-slate-300"
                >
                    <slot name="content"></slot>
                </tbody>
            </table>
        </div>
    </div>
</template>

<script setup>
import { defineProps, defineEmits, ref } from "vue";

const fs = ref("text-base");
var counter = ref(1);

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
    rows: {
        type: Number,
        default: 0,
    },
});

// Define emits
const emit = defineEmits(["update:query"]);

// Update value and emit change event
const updateValue = (event) => {
    emit("update:query", event.target.value);
};

const zoomIn = () => {
    if (counter.value < 3) {
        counter.value++;
        fs.value = ["text-xs", "text-base", "text-lg", "text-xl"][
            counter.value
        ];
    }
};

const zoomOut = () => {
    if (counter.value > 0) {
        counter.value--;
        fs.value = ["text-xs", "text-base", "text-lg", "text-xl"][
            counter.value
        ];
    }
};
</script>
