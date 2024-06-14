<template>
    <Table
        :headers="['ADM', 'NAME', 'CLASS', 'GUARDIAN', 'ACTION']"
        title="All Students"
    >
        <template v-slot:actions>
            <SmallButton
                icon="pi pi-plus"
                :action="() => showModalFunc('addstudent')"
            ></SmallButton>

            <Button icon="pi pi-print" class="mr-2" severity="secondary" />
            <Button icon="pi pi-upload" severity="secondary"
        /></template>
        <template v-slot:content>
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
                        :action="() => showModalFunc('my_modal_5')"
                    />

                    <button @click="() => showModalFunc('my_modal_5')">
                        try
                    </button>

                    <dialog
                        id="my_modal_5"
                        class="modal modal-bottom sm:modal-middle"
                    >
                        <div
                            class="modal-box dark:text-slate-400 dark:bg-sky-950"
                        >
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
                                    <div
                                        class="flex flex-col w-full lg:flex-row"
                                    >
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

            <dialog id="addstudent" class="modal modal-bottom sm:modal-middle">
                <div class="modal-box dark:text-slate-400 dark:bg-sky-950">
                    <h3 class="font-bold text-lg">Admit Student (Add new)</h3>
                    <p class="py-4">
                        Press ESC key or click the button below to close
                    </p>
                    <div class="modal-action">
                        <form method="dialog" class="flex flex-col gap-2">
                            <span>Basic Student Information</span>
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
                                                v-model="student.firstName"
                                                type="text"
                                                id="firstName"
                                                name="firstName"
                                                required
                                                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                                placeholder="Enter first name"
                                            />
                                            <span
                                                v-if="errors.firstName"
                                                class="text-red-500 text-sm"
                                                >{{ errors.firstName }}</span
                                            >
                                        </div>
                                        <div class="col-span-2">
                                            <label
                                                for="secondName"
                                                class="block text-sm font-medium"
                                                >Second Name</label
                                            >
                                            <input
                                                v-model="student.secondName"
                                                type="text"
                                                id="secondName"
                                                name="secondName"
                                                required
                                                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                                placeholder="Enter second name"
                                            />
                                            <span
                                                v-if="errors.secondName"
                                                class="text-red-500 text-sm"
                                                >{{ errors.secondName }}</span
                                            >
                                        </div>
                                        <div class="col-span-2">
                                            <label
                                                for="dob"
                                                class="block text-sm font-medium"
                                                >Date of Birth</label
                                            >
                                            <input
                                                v-model="student.dob"
                                                type="date"
                                                id="dob"
                                                name="dob"
                                                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                            />
                                            <span
                                                v-if="errors.dob"
                                                class="text-red-500 text-sm"
                                                >{{ errors.dob }}</span
                                            >
                                        </div>
                                        <div class="col-span-2">
                                            <label
                                                for="admission"
                                                class="block text-sm font-medium"
                                                >Admission Number</label
                                            >
                                            <input
                                                v-model="student.admission"
                                                type="text"
                                                id="admission"
                                                name="admission"
                                                required
                                                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                                placeholder="Enter admission number"
                                            />
                                            <span
                                                v-if="errors.admission"
                                                class="text-red-500 text-sm"
                                                >{{ errors.admission }}</span
                                            >
                                        </div>
                                    </div>
                                </div>
                                <div
                                    class="divider lg:divider-horizontal divider-info"
                                ></div>
                                <div
                                    class="grid flex-grow card p-1 rounded-sm place-items-center"
                                >
                                    <div>
                                        <!-- Gender -->
                                        <div class="col-span-2">
                                            <label
                                                for="gender"
                                                class="block text-sm font-medium"
                                                >Gender</label
                                            >
                                            <select
                                                v-model="student.gender"
                                                id="gender"
                                                name="gender"
                                                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                            >
                                                <option value="">
                                                    Select Gender
                                                </option>
                                                <option value="male">
                                                    Male
                                                </option>
                                                <option value="female">
                                                    Female
                                                </option>
                                                <option value="other">
                                                    Other
                                                </option>
                                            </select>
                                            <span
                                                v-if="errors.gender"
                                                class="text-red-500 text-sm"
                                                >{{ errors.gender }}</span
                                            >
                                        </div>
                                        <div class="col-span-2">
                                            <label
                                                for="class"
                                                class="block text-sm font-medium"
                                                >Class</label
                                            >
                                            <input
                                                v-model="student.class_id"
                                                type="text"
                                                id="class"
                                                name="class"
                                                required
                                                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                                placeholder="Enter class"
                                            />
                                            <span
                                                v-if="errors.class_id"
                                                class="text-red-500 text-sm"
                                                >{{ errors.class_id }}</span
                                            >
                                        </div>
                                        <div class="col-span-2">
                                            <label
                                                for="guardianEmail"
                                                class="block text-sm font-medium"
                                                >Guardian Email</label
                                            >
                                            <input
                                                v-model="student.guardianEmail"
                                                type="email"
                                                id="guardianEmail"
                                                name="guardianEmail"
                                                required
                                                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                                placeholder="Enter guardian's email"
                                            />
                                            <span
                                                v-if="errors.guardianEmail"
                                                class="text-red-500 text-sm"
                                                >{{
                                                    errors.guardianEmail
                                                }}</span
                                            >
                                        </div>
                                        <div class="col-span-2">
                                            <label
                                                for="phone"
                                                class="block text-sm font-medium"
                                                >Phone Number</label
                                            >
                                            <input
                                                v-model="student.phone"
                                                type="tel"
                                                id="phone"
                                                name="phone"
                                                required
                                                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                                placeholder="Enter phone number"
                                            />
                                            <span
                                                v-if="errors.phone"
                                                class="text-red-500 text-sm"
                                                >{{ errors.phone }}</span
                                            >
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="w-full">
                                <label
                                    for="dormitory"
                                    class="block text-sm font-medium"
                                    >Select Hostel/Dormitory</label
                                >
                                <input
                                    v-model="student.dormitory"
                                    type="text"
                                    id="dormitory"
                                    name="dormitory"
                                    required
                                    class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                    placeholder="Enter dormitory/hostel name"
                                />
                                <span
                                    v-if="errors.dormitory"
                                    class="text-red-500 text-sm"
                                    >{{ errors.dormitory }}</span
                                >
                            </div>
                            <div class="w-full">
                                <label
                                    for="photo"
                                    class="block text-sm font-medium"
                                    >Student Photo (Drag drop)</label
                                >
                                <input
                                    ref="photoInput"
                                    type="file"
                                    id="photo"
                                    name="photo"
                                    accept="image/*"
                                    @change="onFileChange"
                                    class="mt-1 block w-full px-6 py-6 border border-dashed border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                />
                                <span
                                    v-if="errors.photo"
                                    class="text-red-500 text-sm"
                                    >{{ errors.photo }}</span
                                >
                            </div>
                            <div class="col-span-2 flex justify-end">
                                <CommonButton
                                    button-text="Submit"
                                    :action="() => submitForm()"
                                />
                            </div>
                        </form>
                    </div>
                </div>
            </dialog>
        </template>
        <!-- end create student -->
    </Table>
</template>
<script setup>
import Table from "../../components/Tables/MainTable.vue";
import CommonButton from "../../components/CommonButton.vue";
import SmallButton from "../../components/Buttons/Small.vue";
import { ref, onMounted } from "vue";
import axios from "axios";

const showModalFunc = (modalId) => {
    document.getElementById(modalId).showModal();
};

const student = ref({
    firstName: "",
    secondName: "",
    admission: "",
    class_id: "",
    guardianEmail: "",
    phone: "",
    dormitory: "",
    photo: null,
    gender: "",
});

const errors = ref({
    firstName: "",
    secondName: "",
    admission: "",
    class_id: "",
    guardianEmail: "",
    phone: "",
    dormitory: "",
    photo: "",
    dob: "",
    gender: "",
});
//handle file
const onFileChange = (event) => {
    student.value.photo = event.target.files[0];
};

onMounted(async () => {
    const response = await axios.get("students/");

    console.log("students", response.data.data);
});

const submitForm = async () => {
    try {
        // validateForm();
        // Prepare form data
        const formData = new FormData();
        formData.append("firstName", student.value.firstName);
        formData.append("secondName", student.value.secondName);
        formData.append("admission", student.value.admission);
        formData.append("class_id", student.value.class_id);
        formData.append("guardianEmail", student.value.guardianEmail);
        formData.append("phone", student.value.phone);
        formData.append("dormitory", student.value.dormitory);
        formData.append("photo", student.value.photo);
        formData.append("dateofbirth", student.value.dob);
        formData.append("gender", student.value.gender);

        const response = await axios.post("students/", formData, {
            headers: {
                "Content-Type": "multipart/form-data",
            },
        });

        console.log("Student added successfully:", response.data);

        clearForm();
    } catch (error) {
        console.log("first", error);
    }
};

const validateForm = () => {
    // Reset all error messages
    Object.keys(errors.value).forEach((key) => {
        errors.value[key] = "";
    });

    // Validate first name
    if (!student.value.firstName) {
        errors.value.firstName = "First name is required";
    }

    // Validate second name
    if (!student.value.secondName) {
        errors.value.secondName = "Second name is required";
    }

    // Validate admission number
    if (!student.value.admission) {
        errors.value.admission = "Admission number is required";
    }

    // Validate class
    if (!student.value.class_id) {
        errors.value.class_id = "Class is required";
    }

    // Validate guardian email
    if (!student.value.guardianEmail) {
        errors.value.guardianEmail = "Guardian email is required";
    } else if (!validateEmail(student.value.guardianEmail)) {
        errors.value.guardianEmail = "Invalid email format";
    }

    // Validate phone number
    if (!student.value.phone) {
        errors.value.phone = "Phone number is required";
    } else if (!validatePhone(student.value.phone)) {
        errors.value.phone = "Invalid phone number format";
    }

    // Validate dormitory
    if (!student.value.dormitory) {
        errors.value.dormitory = "Dormitory is required";
    }

    // Validate photo
    if (!student.value.photo) {
        errors.value.photo = "Student photo is required";
    }
    if (!student.value.dob) {
        errors.value.dob = "Date of Birth is required";
    }
    if (!student.value.gender) {
        errors.value.gender = "Gender is required";
    }
};

const validateEmail = (email) => {
    // Simple email validation regex
    const re =
        /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@(([^<>()[\]\.,;:\s@"]+\.)+[^<>()[\]\.,;:\s@"]{2,})$/i;
    return re.test(email);
};

const validatePhone = (phone) => {
    // Kenyan phone number validation regex
    const re = /^(?:\+254|0)?(7|1)\d{8}$/;
    return re.test(phone);
};
</script>
