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
        v-model:query="searchQuery"
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

                <td class="p-2 whitespace-nowrap">
                    <div class="text-lg text-center">
                        <SmallButton
                            classes="border border-blue-500 border-dotted px-2 text-sm bg-red-500"
                            button-text="Edit"
                            :action="() => showModalFunc(book.id)"
                        />
                    </div>
                </td>
                <dialog
                    :id="book.id"
                    class="modal modal-bottom sm:modal-middle"
                >
                    <div class="modal-box dark:text-slate-400 dark:bg-sky-950">
                        <h3 class="font-bold text-lg">Edit book Information</h3>
                        <p class="py-4">
                            Press ESC key or click the button below to close
                        </p>
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
import CommonButton from "../../components/CommonButton.vue";
import SmallButton from "../../components/Buttons/Small.vue";
import axios from "axios";
import { ref, onMounted, watch } from "vue";

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

const fetchData = () => {
    const showLoader = searchQuery.value.trim() === "";

    axios
        .get(`/library/books/${searchQuery.value}`, { showLoader: showLoader })
        .then((response) => {
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
    showModal4.value = false;
};

const issueBook = (book_id) => {
    axios
        .post("library/book-issue/create", {
            adm: book_issue_identity.value,
            book_id: book_id,
        })
        .then((response) => {
            console.log(response);
            toast.info(response.data);
            reload.value = !reload.value;
        });
    showModal3.value = false;
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

const handleDelete = (id) => {
    confirmAlert({
        title: "Confirm to Delete item",
        message: "Action is irreversible",
        buttons: [
            {
                label: "Yes",
                onClick: () => {
                    axios
                        .post("library//book/delete/" + id)
                        .then((response) => {
                            console.log(response);
                            toast.success("Done");
                            reload.value = !reload.value;
                        })
                        .catch((err) => {
                            console.log(err);
                            toast.error("seems this data is in use");
                        });
                },
            },
            {
                label: "No",
            },
        ],
    });
};
</script>
