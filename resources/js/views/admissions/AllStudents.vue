<template>
    <Table
        :headers="['NAME', 'ADM', 'CLASS', 'GUARDIAN', 'ACTION']"
        title="All Students"
        v-model:query="searchQuery"
        :rows="studentData?.length"
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
            <tr v-for="(student, index) in studentData" :key="index">
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
                        <div class="font-medium">
                            {{ student.first_name }}
                            {{ student.second_name }}
                        </div>
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-left">{{ student.admission }}</div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-left font-medium text-green-500">
                        {{ student.class?.level }}-
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-center">
                        {{ student.guardian_email }}
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-center">
                        <SmallButton
                            classes="border border-blue-500 border-dotted px-2 text-sm bg-red-500"
                            button-text="Edit"
                            :action="() => showModalFunc(student.id)"
                        />
                    </div>
                </td>
                <dialog
                    :id="student.id"
                    class="modal modal-bottom sm:modal-middle"
                >
                    <div class="modal-box dark:text-slate-400 dark:bg-sky-950">
                        <h3 class="font-bold">Edit Student Information</h3>
                        <p class="py-4">
                            Press ESC key or click the button below to close
                        </p>
                        <div class="modal-action">
                            <form
                                @submit.prevent="submitForm(student.id)"
                                class="flex flex-col gap-2"
                            >
                                <span>Basic Student Information</span>
                                <div class="flex flex-col w-full lg:flex-row">
                                    <div
                                        class="grid flex-grow card rounded-sm p-1 place-items-center"
                                    >
                                        <div>
                                            <div class="col-span-2">
                                                <label
                                                    for="first_name"
                                                    class="block text-sm font-medium"
                                                    >First Name</label
                                                >
                                                <input
                                                    v-model="student.first_name"
                                                    type="text"
                                                    id="first_name"
                                                    name="first_name"
                                                    required
                                                    class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                                    placeholder="Enter first name"
                                                />
                                                <span
                                                    v-if="errors.first_name"
                                                    class="text-red-500 text-sm"
                                                    >{{
                                                        errors.first_name
                                                    }}</span
                                                >
                                            </div>
                                            <div class="col-span-2">
                                                <label
                                                    for="second_name"
                                                    class="block text-sm font-medium"
                                                    >Second Name</label
                                                >
                                                <input
                                                    v-model="
                                                        student.second_name
                                                    "
                                                    type="text"
                                                    id="second_name"
                                                    name="second_name"
                                                    required
                                                    class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                                    placeholder="Enter second name"
                                                />
                                                <span
                                                    v-if="errors.second_name"
                                                    class="text-red-500 text-sm"
                                                    >{{
                                                        errors.second_name
                                                    }}</span
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
                                                    >{{
                                                        errors.admission
                                                    }}</span
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
                                                    for="guardian_email"
                                                    class="block text-sm font-medium"
                                                    >Guardian Email</label
                                                >
                                                <input
                                                    v-model="
                                                        student.guardian_email
                                                    "
                                                    type="email"
                                                    id="guardian_email"
                                                    name="guardian_email"
                                                    required
                                                    class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                                    placeholder="Enter guardian's email"
                                                />
                                                <span
                                                    v-if="errors.guardian_email"
                                                    class="text-red-500 text-sm"
                                                    >{{
                                                        errors.guardian_email
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
                                        :action="() => submitForm(student.id)"
                                    />
                                </div>
                            </form>
                        </div>
                    </div>
                </dialog>
            </tr>

            <!-- create student -->

            <dialog id="addstudent" class="modal modal-bottom sm:modal-middle">
                <div class="modal-box dark:text-slate-400 dark:bg-sky-950">
                    <h3 class="font-bold">Admit Student (Add new)</h3>
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
                                                for="first_name"
                                                class="block text-sm font-medium"
                                                >First Name</label
                                            >
                                            <input
                                                v-model="student.first_name"
                                                type="text"
                                                id="first_name"
                                                name="first_name"
                                                required
                                                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                                placeholder="Enter first name"
                                            />
                                            <span
                                                v-if="errors.first_name"
                                                class="text-red-500 text-sm"
                                                >{{ errors.first_name }}</span
                                            >
                                        </div>
                                        <div class="col-span-2">
                                            <label
                                                for="second_name"
                                                class="block text-sm font-medium"
                                                >Second Name</label
                                            >
                                            <input
                                                v-model="student.second_name"
                                                type="text"
                                                id="second_name"
                                                name="second_name"
                                                required
                                                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                                placeholder="Enter second name"
                                            />
                                            <span
                                                v-if="errors.second_name"
                                                class="text-red-500 text-sm"
                                                >{{ errors.second_name }}</span
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
                                                for="guardian_email"
                                                class="block text-sm font-medium"
                                                >Guardian Email</label
                                            >
                                            <input
                                                v-model="student.guardian_email"
                                                type="email"
                                                id="guardian_email"
                                                name="guardian_email"
                                                required
                                                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                                placeholder="Enter guardian's email"
                                            />
                                            <span
                                                v-if="errors.guardian_email"
                                                class="text-red-500 text-sm"
                                                >{{
                                                    errors.guardian_email
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
import { ref, onMounted, watch } from "vue";
import axios from "axios";

const showModalFunc = (modalId) => {
    document.getElementById(modalId).showModal();
};

const studentData = ref();
const reload = ref();
const pagination = ref({});
const links = ref([]);
const searchQuery = ref("");
const student = ref({
    first_name: "",
    second_name: "",
    admission: "",
    class_id: "",
    guardian_email: "",
    phone: "",
    dormitory: "",
    photo: null,
    gender: "",
});

const errors = ref({
    first_name: "",
    second_name: "",
    admission: "",
    class_id: "",
    guardian_email: "",
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

const fetchData = () => {
    const showLoader = searchQuery.value.trim() === "";
    console.log("the query is", searchQuery.value);

    axios
        .get(`/students/${searchQuery.value}`, { showLoader: showLoader })
        .then((response) => {
            console.log("res", response.data.data.data);
            pagination.value = response.data;
            links.value = response.data.links;
            studentData.value = response.data.data.data;
        })
        .catch((error) => {
            console.log(error);
        });
};
onMounted(async () => {
    fetchData();
});

watch([searchQuery, reload], () => {
    fetchData();
});

const submitForm = async () => {
    try {
        // validateForm();
        // Prepare form data
        const formData = new FormData();
        formData.append("first_name", student.value.first_name);
        formData.append("second_name", student.value.second_name);
        formData.append("admission", student.value.admission);
        formData.append("class_id", student.value.class_id);
        formData.append("guardian_email", student.value.guardian_email);
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
    if (!student.value.first_name) {
        errors.value.first_name = "First name is required";
    }

    // Validate second name
    if (!student.value.second_name) {
        errors.value.second_name = "Second name is required";
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
    if (!student.value.guardian_email) {
        errors.value.guardian_email = "Guardian email is required";
    } else if (!validateEmail(student.value.guardian_email)) {
        errors.value.guardian_email = "Invalid email format";
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
