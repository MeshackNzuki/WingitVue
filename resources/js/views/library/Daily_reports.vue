<template>
    <Table
        :headers="[
            'ADM',
            'STUDENT NAME',
            'BOOK NAME',
            'ISBN',
            'ISSUED DATE',
            'RETURN DATE',
        ]"
        title="All Books"
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
                    <div class="text-lg text-center">
                        {{ student.guardian_email }}
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-lg text-center">
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
                        <h3 class="font-bold text-lg">
                            Edit Student Information
                        </h3>
                        <p class="py-4 text-xs">Press ESC key to close</p>
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
                    <h3 class="font-bold text-lg">Admit Student (Add new)</h3>
                    <p class="py-4 text-xs">Press ESC key to close</p>
                    <div class="modal-action">
                        <form method="dialog" class="flex flex-col gap-2">
                            <button
                                class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2"
                            >
                                ✕
                            </button>
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
<script>
import { ref, onMounted, watch } from "vue";
import axios from "axios";

const books = ref([]);
const pagination = ref({});
const links = ref([]);
const query = ref("");
const reload = ref(false);

const fetchData = () => {
    console.log("the query is", query.value);
    axios
        .get(`/books/${query.value}`)
        .then((response) => {
            console.log(response.data.data);
            pagination.value = response.data;
            links.value = response.data.links;
            books.value = response.data.data;
        })
        .catch((error) => {
            console.log(error);
        });
};

onMounted(() => {
    handleLoadOptions();
    fetchData();
});

watch([query, reload], () => {
    fetchData();
});

const issueBookStaff = (book_id) => {
    axios
        .post("/book-issue-staff/create", {
            id_number: book_issue_identity,
            book_id: book_id,
        })
        .then((response) => {
            console.log(response);
            toast.info(response.data);
            reload ? setReload(false) : setReload(true);
        });
    setShowModal4(false);
};

const issueBook = (book_id) => {
    axios
        .post("/book-issue/create", {
            adm: book_issue_identity,
            book_id: book_id,
        })
        .then((response) => {
            console.log(response);
            toast.info(response.data);
            reload ? setReload(false) : setReload(true);
        });
    setShowModal3(false);
};

const handleBookEdit = (bookname, book_id) => {
    setShowModal5(true);
    setBook_edit_id(book_id);
    setBook_edit_name(bookname);
    axios.get("book_issue_staff/view/").then((response) => {});
};

const handleIssue = (bookname, book_id) => {
    setShowModal3(true);
    setBook_issue_id(book_id);
    setBook_issue_name(bookname);
    setShowModal3(true);
    axios.get("book_issue/view/").then((response) => {});
};

//edit book
const handleSubmitEdit = () => {
    console.log(createInputs);

    axios
        .post("book/update/" + book_edit_id, createInputs)
        .then((response) => {
            console.log(response);
            setShowModal(false);
            toast.success("success");
            reload ? setReload(false) : setReload(true);
        })
        .catch((error) => {
            console.log(error);
            toast.error(error.message);
        });
};

//create book
const handleChange = (event) => {
    const name = event.target.name;
    const value = event.target.value;
    setCreateInputs((values) => ({ ...values, [name]: value }));
};

const handleSubmit = () => {
    if (
        !createInputs.category_id ||
        !createInputs.name ||
        !createInputs.cost ||
        !createInputs.isbn ||
        !createInputs.number ||
        !createInputs.auther_id ||
        !createInputs.publisher_id
    ) {
        console.log(createInputs);
        toast.error("Please fill all the fields");
        return 0;
    }

    console.log(createInputs);
    axios
        .post("book/create", createInputs)
        .then((response) => {
            console.log(response);
            setShowModal(false);
            toast.success("success");
            reload ? setReload(false) : setReload(true);
        })
        .catch((error) => {
            toast.error(error.message);
        });
    setCreateInputs([]);
};

//dropdown options
const handleLoadOptions = () => {
    axios.get("categories").then((response) => {
        setCategoryData(response.data);
    });
    axios.get("authors").then((response) => {
        setAuthorData(response.data);
    });

    axios.get("publishers").then((response) => {
        setPublisherData(response.data);
    });
};

//delete book
const handleDelete = (id) => {
    confirmAlert({
        title: "Confirm to Delete item",
        message: "Action is irreversible",
        buttons: [
            {
                label: "Yes",
                onClick: () => {
                    axios
                        .post("/book/delete/" + id)
                        .then((response) => {
                            console.log(response);
                            toast.success("Done");
                        })
                        .catch((err) => {
                            console.log(err);
                            toast.error("seems this data is in use");
                        });
                    reload ? setReload(false) : setReload(true);
                },
            },
            {
                label: "No",
            },
        ],
    });
};
</script>
