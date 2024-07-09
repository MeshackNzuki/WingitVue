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
