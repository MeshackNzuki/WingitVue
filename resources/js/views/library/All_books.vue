<template>
    <Table
        :headers="[
            'TITLE',
            'BOOK NUMBER',
            'SUBJECT',
            'AUTHOR',
            'ISBN',
            'STATUS',
            'ACTION',
        ]"
        title="All books"
        v-model:query="searchQuery"
        :rows="books?.length"
    >
        <template v-slot:actions>
            <SmallButton
                icon="pi pi-plus"
                :action="() => showModalFunc('addbook')"
            ></SmallButton>

            <Button icon="pi pi-print" class="mr-2" severity="secondary" />
            <Button icon="pi pi-upload" severity="secondary"
        /></template>
        <template v-slot:content>
            <tr v-for="(book, index) in books" :key="index">
                <td class="p-2 whitespace-nowrap">
                    <div class="flex items-center">
                        <div class="font-medium">
                            {{ book.title }}
                        </div>
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-left">{{ book.number }}</div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-left font-medium text-green-500">
                        {{ book.subject?.name }}-
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-left font-medium text-green-500">
                        {{ book.author?.name }}-
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-left font-medium text-green-500">
                        {{ book.isbn }}-
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
                <td class="p-2 whitespace-nowrap flex flex-row gap-1">
                    <div class="text-lg text-center">
                        <SmallButton
                            classes="border border-blue-500 border-dotted px-2 text-sm bg-emerald-500"
                            button-text="Issue"
                            :action="() => showModalFunc(book.id)"
                        />
                    </div>
                    <div class="text-lg text-center">
                        <SmallButton
                            classes="border border-blue-500 border-dotted px-2 text-sm bg-yellow"
                            button-text="Edit"
                            :action="() => showModalFunc(book.id)"
                        />
                    </div>
                    <div class="text-lg text-center">
                        <SmallButton
                            classes="border border-blue-500 border-dotted px-2 text-sm bg-red-500"
                            button-text="Del"
                            :action="() => showModalFunc(book.id)"
                        />
                    </div>
                </td>

                <dialog :id="book.id" class="modal">
                    <div class="modal-box dark:bg-slate-800">
                        <Error :msg="ErrorObjectMessange" />
                        <form method="dialog" class="modal-backdrop">
                            <button
                                class="btn btn-sm btn-circle btn-gray-600 absolute right-2 top-2"
                            >
                                ✕
                            </button>
                        </form>
                        <h3 class="text-lg font-bold">Issue Book</h3>
                        <p class="py-4">
                            <span
                                >Book Title : {{ book.title }} / Number
                                {{ book.number }}</span
                            >
                        </p>
                        <hr />
                        <div class="flex gap-4 mt-2">
                            <label
                                class="flex items-center gap-2 cursor-pointer"
                            >
                                <input
                                    type="radio"
                                    name="status"
                                    value="student"
                                    class="hidden peer"
                                    v-model="status"
                                />
                                <div
                                    class="w-4 h-4 border-2 border-gray-400 rounded-full peer-checked:bg-blue-500 peer-checked:border-transparent"
                                ></div>
                                <span
                                    :class="
                                        status === 'student'
                                            ? 'bg-green-300 px-2 text-gray-900 rounded-full'
                                            : ''
                                    "
                                    >Student</span
                                >
                            </label>
                            <label
                                class="flex items-center gap-2 cursor-pointer"
                            >
                                <input
                                    type="radio"
                                    name="status"
                                    value="other"
                                    class="hidden peer"
                                    v-model="status"
                                />
                                <div
                                    class="w-4 h-4 border-2 border-gray-400 rounded-full peer-checked:bg-blue-500 peer-checked:border-transparent"
                                ></div>
                                <span
                                    :class="
                                        status === 'other'
                                            ? 'bg-green-300 px-2 text-gray-900 rounded-full'
                                            : ''
                                    "
                                    >Other</span
                                >
                            </label>
                        </div>
                        <div class="modal-action mb-2">
                            <div class="flex flex-col w-full lg:flex-row">
                                <div>
                                    <div v-if="status === 'student'">
                                        <label
                                            for="student_number"
                                            class="block text-sm font-medium"
                                            >Student Admission Number</label
                                        >
                                        <input
                                            v-model="student_issue_admission"
                                            type="text"
                                            id="student_number"
                                            name="student_number"
                                            required
                                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                            placeholder="Enter student admission number"
                                        />
                                    </div>
                                    <div v-if="status === 'other'">
                                        <label
                                            for="employee_number"
                                            class="block text-sm font-medium"
                                            >Staff/Employee Number</label
                                        >
                                        <input
                                            v-model="staff_issue_admission"
                                            type="text"
                                            id="employee_number"
                                            name="employee_number"
                                            required
                                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                            placeholder="Enter staff/employee number"
                                        />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <CommonButton
                            button-text="Issue Book"
                            :action="
                                () => {
                                    student = !null
                                        ? issueBook(book.id)
                                        : issueBookStaff(book.id);
                                }
                            "
                        />
                    </div>
                </dialog>
            </tr>

            <!-- create book -->

            <dialog id="addbook" class="modal modal-bottom sm:modal-middle">
                <div class="modal-box dark:text-slate-400 dark:bg-sky-950">
                    <h3 class="font-bold text-lg">Admit book (Add new)</h3>
                    <p class="py-4">
                        Press ESC key or click the button below to close
                    </p>
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
import Error from "../../components/Flash/Error.vue";
import Success from "../../components/Flash/Success.vue";
import axios from "axios";
import { toast } from "vue3-toastify";
import { useToast } from "primevue/usetoast";
import { ref, onMounted, watch } from "vue";
//start issue selector
const status = ref("student");
//end issue selector
const toastPrime = useToast();
//issue ID
const student_issue_admission = ref();
const staff_issue_admission = ref();
//end Issue ID

const books = ref([]);
const pagination = ref({});
const links = ref([]);
const searchQuery = ref("");
const reload = ref(false);
const subject = ref([]);
const book_issue_identity = ref("");
const book_edit_id = ref(null);
const book_edit_name = ref("");
const book_issue_id = ref(null);
const book_issue_name = ref("");
const createInputs = ref({
    category_id: "",
    name: "",
    cost: "",
    isbn: "",
    number: "",
    auther_id: "",
    publisher_id: "",
});
const authorData = ref([]);
const publisherData = ref([]);
const ErrorObjectMessange = ref("");

const showModalFunc = (modalId) => {
    document.getElementById(modalId).showModal();
};

const hideModalFunc = (modalId) => {
    document.getElementById(modalId).close();
};

const fetchData = () => {
    const showLoader = searchQuery.value.trim() === "";
    axios
        .get(`/library/books/${searchQuery.value}`, { showLoader: showLoader })
        .then((response) => {
            console.log("first", response);
            pagination.value = response.data;
            links.value = response.data.links;
            books.value = response.data.data.data;
        })
        .catch((error) => {
            console.log(error);
        });
};

onMounted(() => {
    handleLoadOptions();
    fetchData();
});

watch([searchQuery, reload], () => {
    fetchData();
});

const issueBookStaff = (book_id) => {
    axios
        .post("library/book-issue-staff/create", {
            id_number: book_issue_identity.value,
            book_id: book_id,
        })
        .then((response) => {
            console.log(response);
            toast.info(response.data);
            reload.value = !reload.value;
        });
};

const issueBook = (book_id) => {
    axios
        .post("library/book-issue/create", {
            adm: book_issue_identity.value,
            book_id: book_id,
        })
        .then((response) => {
            hideModalFunc(book_id);
            toast.add({
                severity: "success",
                summary: "Success Message",
                detail: "Your operation was successful.",
                life: 3000,
            });
            reload.value = !reload.value;
        })
        .catch((err) => {
            console.log("err", err);
            ErrorObjectMessange.value = err.response.data.error;
            const intervalId = setInterval(() => {
                ErrorObjectMessange.value = "";
                clearInterval(intervalId);
            }, 3000);
            toastPrime.add({
                severity: "error",
                summary: "Data Error",
                detail: err.response.data.error,
                life: 3000,
            });
        });
};

const handleBookEdit = (bookname, book_id) => {
    showModal5.value = true;
    book_edit_id.value = book_id;
    book_edit_name.value = bookname;
    axios.get("book_issue_staff/view/").then((response) => {});
};

const handleIssue = (bookname, book_id) => {
    showModal3.value = true;
    book_issue_id.value = book_id;
    book_issue_name.value = bookname;
    showModal3.value = true;
    axios.get("book_issue/view/").then((response) => {});
};

const handleSubmitEdit = () => {
    console.log(createInputs.value);
    axios
        .post("library/book/update/" + book_edit_id.value, createInputs.value)
        .then((response) => {
            console.log(response);
            showModal5.value = false;
            toast.success("success");
            reload.value = !reload.value;
        })
        .catch((error) => {
            console.log(error);
            toast.error(error.message);
        });
};

const handleChange = (event) => {
    const name = event.target.name;
    const value = event.target.value;
    createInputs.value[name] = value;
};

const handleSubmit = () => {
    if (
        !createInputs.value.category_id ||
        !createInputs.value.name ||
        !createInputs.value.cost ||
        !createInputs.value.isbn ||
        !createInputs.value.number ||
        !createInputs.value.auther_id ||
        !createInputs.value.publisher_id
    ) {
        console.log(createInputs.value);
        toast.error("Please fill all the fields");
        return;
    }
    console.log(createInputs.value);
    axios
        .post("library/book/create", createInputs.value)
        .then((response) => {
            toast.success("success");
            reload.value = !reload.value;
        })
        .catch((error) => {
            toast.error(error.message);
        });
    createInputs.value = {
        category_id: "",
        name: "",
        cost: "",
        isbn: "",
        number: "",
        auther_id: "",
        publisher_id: "",
    };
};

const handleLoadOptions = () => {
    axios.get("library/categories").then((response) => {
        subject.value = response.data;
    });
    axios.get("library/uthors").then((response) => {
        authorData.value = response.data;
    });

    axios.get("library/publishers").then((response) => {
        publisherData.value = response.data;
    });
};
</script>
