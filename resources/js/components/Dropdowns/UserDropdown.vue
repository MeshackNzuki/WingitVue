<template>
    <div>
        <a
            class="text-blueGray-500 block"
            href="#pablo"
            ref="btnDropdownRef"
            v-on:click="toggleDropdown($event)"
        >
            <div class="items-center flex">
                <span
                    class="w-12 h-12 text-sm text-white bg-blueGray-200 inline-flex items-center justify-center rounded-full"
                >
                    <img
                        alt="..."
                        class="w-full rounded-full align-middle border-none shadow-lg"
                        src="https://img.freepik.com/free-vector/isolated-young-handsome-man-different-poses-white-background-illustration_632498-859.jpg?w=740&t=st=1717503262~exp=1717503862~hmac=b6ff59ecc7a7a1d78196f35a24f8709ef1ec0941d48fdb7a31deff6746a6fd5d"
                    />
                </span>
            </div>
        </a>
        <div
            ref="popoverDropdownRef"
            class="bg-white text-base z-50 float-left py-2 list-none text-left rounded shadow-lg min-w-48"
            v-bind:class="{
                hidden: !dropdownPopoverShow,
                block: dropdownPopoverShow,
            }"
        >
            <a
                href="javascript:void(0);"
                class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent text-blueGray-700"
            >
                Action
            </a>
            <a
                href="javascript:void(0);"
                class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent text-blueGray-700"
            >
                Another action
            </a>
            <a
                href="javascript:void(0);"
                class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent text-blueGray-700"
            >
                Something else here
            </a>
            <div class="h-0 my-2 border border-solid border-blueGray-100" />
            <a
                href="javascript:void(0);"
                class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent text-blueGray-700"
            >
                Seprated link
            </a>
        </div>
    </div>
</template>

<script setup>
import { ref } from "vue";
import { createPopper } from "@popperjs/core";

const dropdownPopoverShow = ref(false);

const toggleDropdown = (event) => {
    event.preventDefault();
    dropdownPopoverShow.value = !dropdownPopoverShow.value;
    if (dropdownPopoverShow.value) {
        createPopper($refs.btnDropdownRef, $refs.popoverDropdownRef, {
            placement: "bottom-start",
        });
    }
};
</script>
