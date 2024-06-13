<template>
    <Table :headers="['ADM', 'NAME', 'CLASS', 'GUARDIAN', 'ACTION']">
        <tr>
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
                    <div class="font-medium">Alex Shatov</div>
                </div>
            </td>
            <td class="p-2 whitespace-nowrap">
                <div class="text-left">alexshatov@gmail.com</div>
            </td>
            <td class="p-2 whitespace-nowrap">
                <div class="text-left font-medium text-green-500">
                    $2,890.66
                </div>
            </td>
            <td class="p-2 whitespace-nowrap">
                <div class="text-lg text-center">🇺🇸</div>
            </td>
        </tr>
        <tr>
            <td class="p-2 whitespace-nowrap">
                <div class="flex items-center">
                    <div class="w-10 h-10 flex-shrink-0 mr-2 sm:mr-3">
                        <img
                            class="rounded-full"
                            src="https://raw.githubusercontent.com/cruip/vuejs-admin-dashboard-template/main/src/images/user-36-06.jpg"
                            width="40"
                            height="40"
                            alt="Philip Harbach"
                        />
                    </div>
                    <div class="font-medium">Philip Harbach</div>
                </div>
            </td>
            <td class="p-2 whitespace-nowrap">
                <div class="text-left">philip.h@gmail.com</div>
            </td>
            <td class="p-2 whitespace-nowrap">
                <div class="text-left font-medium text-green-500">
                    $2,767.04
                </div>
            </td>
            <td class="p-2 whitespace-nowrap">
                <div class="text-lg text-center">🇩🇪</div>
            </td>
            <td>
                <!-- edit row -->
                <!-- Open the modal using ID.showModal() method -->

                <SmallButton
                    classes="border border-blue-500 border-dotted px-2 text-sm bg-red-500"
                    action="showModal(1)"
                />

                <dialog
                    id="my_modal_5"
                    class="modal modal-bottom sm:modal-middle"
                >
                    <div class="modal-box dark:text-slate-400 dark:bg-sky-950">
                        <h3 class="font-bold text-lg">
                            Edit Student ( Student name - Admission)
                        </h3>
                        <p class="py-4">
                            Press ESC key or click the button below to close
                        </p>
                        <div class="modal-action">
                            <form
                                class="flex flex-col gap-2"
                                @submit.prevent="submitForm"
                            >
                                <span>Basic Student information </span>
                                <div class="flex flex-col w-full lg:flex-row">
                                    <div
                                        class="grid flex-grow card rounded-sm p-1 place-items-center"
                                    >
                                        <div>
                                            <div class="col-span-2">
                                                <label
                                                    for="firstName"
                                                    class="block text-sm font-medium"
                                                    >First Name</label
                                                >
                                                <input
                                                    type="text"
                                                    id="firstName"
                                                    name="firstName"
                                                    required
                                                    class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                                    placeholder="Enter first name"
                                                />
                                            </div>
                                            <div class="col-span-2">
                                                <label
                                                    for="secondName"
                                                    class="block text-sm font-medium"
                                                    >Second Name</label
                                                >
                                                <input
                                                    type="text"
                                                    id="secondName"
                                                    name="secondName"
                                                    required
                                                    class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                                    placeholder="Enter second name"
                                                />
                                            </div>
                                            <div class="col-span-2">
                                                <label
                                                    for="admission"
                                                    class="block text-sm font-medium"
                                                    >Admission Number</label
                                                >
                                                <input
                                                    type="text"
                                                    id="admission"
                                                    name="admission"
                                                    required
                                                    class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                                    placeholder="Enter admission number"
                                                />
                                            </div>
                                        </div>
                                    </div>
                                    <div
                                        class="divider lg:divider-horizontal divider-info"
                                    >
                                        >
                                    </div>
                                    <div
                                        class="grid flex-grow card p-1 rounded-sm place-items-center"
                                    >
                                        <div>
                                            <div class="col-span-2">
                                                <label
                                                    for="class"
                                                    class="block text-sm font-medium"
                                                    >Class</label
                                                >
                                                <input
                                                    type="text"
                                                    id="class"
                                                    name="class"
                                                    required
                                                    class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                                    placeholder="Enter class"
                                                />
                                            </div>
                                            <div class="col-span-2">
                                                <label
                                                    for="guardianEmail"
                                                    class="block text-sm font-medium"
                                                    >Guardian Email</label
                                                >
                                                <input
                                                    type="email"
                                                    id="guardianEmail"
                                                    name="guardianEmail"
                                                    required
                                                    class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                                    placeholder="Enter guardian's email"
                                                />
                                            </div>
                                            <div class="col-span-2">
                                                <label
                                                    for="phone"
                                                    class="block text-sm font-medium"
                                                    >Phone Number</label
                                                >
                                                <input
                                                    type="tel"
                                                    id="phone"
                                                    name="phone"
                                                    required
                                                    class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                                    placeholder="Enter phone number"
                                                />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="w-full">
                                    <label
                                        for="guardianEmail"
                                        class="block text-sm font-medium"
                                        >Select Hostel/Dormitory</label
                                    >
                                    <input
                                        type="email"
                                        id="Dormitory /Hostel"
                                        name="D"
                                        required
                                        class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                        placeholder="Enter guardian's email"
                                    />
                                </div>
                                <div class="w-full">
                                    <label
                                        for="photo"
                                        class="block text-sm font-medium"
                                        >Student Photo (Drag drop)</label
                                    >
                                    <input
                                        type="file"
                                        id="photo"
                                        name="photo"
                                        accept="image/*"
                                        class="mt-1 block w-full px-6 py-6 border border-dashed border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                    />
                                </div>
                                <div class="col-span-2 flex justify-end">
                                    <CommonButton />
                                </div>
                            </form>
                        </div>
                    </div>
                </dialog>
                <!-- end edit row -->
            </td>
        </tr>
        <!-- create student -->
        <!-- Open the modal using ID.showModal() method -->
        <button class="btn" onclick="addstudent.showModal()">open modal</button>
        <dialog id="addstudent" class="modal modal-bottom sm:modal-middle">
            <div class="modal-box dark:text-slate-400 dark:bg-sky-950">
                <h3 class="font-bold text-lg">Admit Student (Add new)</h3>
                <p class="py-4">
                    Press ESC key or click the button below to close
                </p>
                <div class="modal-action">
                    <form
                        class="flex flex-col gap-2"
                        @submit.prevent="submitForm"
                    >
                        <span>Basic Student information </span>
                        <div class="flex flex-col w-full lg:flex-row">
                            <div
                                class="grid flex-grow card rounded-sm p-1 place-items-center"
                            >
                                <div>
                                    <div class="col-span-2">
                                        <label
                                            for="firstName"
                                            class="block text-sm font-medium"
                                            >First Name</label
                                        >
                                        <input
                                            type="text"
                                            id="firstName"
                                            name="firstName"
                                            required
                                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                            placeholder="Enter first name"
                                        />
                                    </div>
                                    <div class="col-span-2">
                                        <label
                                            for="secondName"
                                            class="block text-sm font-medium"
                                            >Second Name</label
                                        >
                                        <input
                                            type="text"
                                            id="secondName"
                                            name="secondName"
                                            required
                                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                            placeholder="Enter second name"
                                        />
                                    </div>
                                    <div class="col-span-2">
                                        <label
                                            for="admission"
                                            class="block text-sm font-medium"
                                            >Admission Number</label
                                        >
                                        <input
                                            type="text"
                                            id="admission"
                                            name="admission"
                                            required
                                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                            placeholder="Enter admission number"
                                        />
                                    </div>
                                </div>
                            </div>
                            <div
                                class="divider lg:divider-horizontal divider-info"
                            >
                                >
                            </div>
                            <div
                                class="grid flex-grow card p-1 rounded-sm place-items-center"
                            >
                                <div>
                                    <div class="col-span-2">
                                        <label
                                            for="class"
                                            class="block text-sm font-medium"
                                            >Class</label
                                        >
                                        <input
                                            type="text"
                                            id="class"
                                            name="class"
                                            required
                                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                            placeholder="Enter class"
                                        />
                                    </div>
                                    <div class="col-span-2">
                                        <label
                                            for="guardianEmail"
                                            class="block text-sm font-medium"
                                            >Guardian Email</label
                                        >
                                        <input
                                            type="email"
                                            id="guardianEmail"
                                            name="guardianEmail"
                                            required
                                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                            placeholder="Enter guardian's email"
                                        />
                                    </div>
                                    <div class="col-span-2">
                                        <label
                                            for="phone"
                                            class="block text-sm font-medium"
                                            >Phone Number</label
                                        >
                                        <input
                                            type="tel"
                                            id="phone"
                                            name="phone"
                                            required
                                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                            placeholder="Enter phone number"
                                        />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="w-full">
                            <label
                                for="guardianEmail"
                                class="block text-sm font-medium"
                                >Select Hostel/Dormitory</label
                            >
                            <input
                                type="email"
                                id="Dormitory /Hostel"
                                name="D"
                                required
                                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                placeholder="Enter guardian's email"
                            />
                        </div>
                        <div class="w-full">
                            <label for="photo" class="block text-sm font-medium"
                                >Student Photo (Drag drop)</label
                            >
                            <input
                                type="file"
                                id="photo"
                                name="photo"
                                accept="image/*"
                                class="mt-1 block w-full px-6 py-6 border border-dashed border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                            />
                        </div>
                        <div class="col-span-2 flex justify-end">
                            <CommonButton />
                        </div>
                    </form>
                </div>
            </div>
        </dialog>
        <!-- end create student -->
    </Table>
</template>
<script setup>
import Table from "../../components/Tables/MainTable.vue";
import CommonButton from "../../components/CommonButton.vue";
import SmallButton from "../../components/Buttons/Small.vue";

import { useConfirm } from "primevue/useconfirm";

const confirm = useConfirm();

const handleDelete = () => {
    confirm.require({
        message: "Are you sure you want to delete?",
        header: "Delete Confirmation",
        icon: "pi pi-exclamation-triangle", // PrimeVue icon for warning
        acceptLabel: "Delete",
        rejectLabel: "Cancel",
        acceptClass: "p-button-danger", // 스타일 클래스 설정 (optional)
        accept: () => {
            // Code to perform deletion logic
        },
    });
};
</script>
