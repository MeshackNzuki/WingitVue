<template>
    <div>
        <Table
            :headers="[
                'name',
                'EMAIL',
                'DETAILS',
                'ROLE',
                'PHONE',
                'STAFF NUMBER',
                'ACTIONS',
            ]"
            title="User Management"
        >
            <template v-slot:actions>
                <SmallButton
                    icon="pi pi-plus"
                    :action="() => showModal('addUser')"
                ></SmallButton>
            </template>
            <template v-slot:content>
                <tr v-for="(user, index) in userData" :key="index">
                    <td class="p-2 whitespace-nowrap">
                        <div class="text-start">{{ user.name }}</div>
                    </td>
                    <td class="p-2 whitespace-nowrap">
                        <div class="text-start">{{ user.email }}</div>
                    </td>
                    <td class="p-2 whitespace-nowrap">
                        <div>{{ user.deatails ? user.deatails : "-" }}</div>
                    </td>
                    <td class="p-2 whitespace-nowrap">
                        <div>
                            {{
                                user.roles.length > 0
                                    ? user.roles
                                          .map((role) => role.name)
                                          .join(", ")
                                    : "-"
                            }}
                        </div>
                    </td>
                    <td class="p-2 whitespace-nowrap">
                        <div>{{ user.phone }}</div>
                    </td>
                    <td class="p-2 whitespace-nowrap">
                        <div>{{ user.staff_number }}</div>
                    </td>
                    <td class="p-2 whitespace-nowrap">
                        <div class="flex justify-center space-x-2">
                            <SmallButton
                                classes="border border-blue-500 border-dotted px-2 text-sm bg-yellow-500"
                                button-text="Edit"
                                :action="() => showModal('editUser', user.id)"
                            />
                            <SmallButton
                                classes="border border-red-500 border-dotted px-2 text-sm bg-red-500"
                                button-text="Delete"
                                :action="() => deleteUser(user.id)"
                            />
                        </div>
                    </td>
                    <!-- Edit User Modal -->
                    <dialog
                        :id="'editUser' + user.id"
                        class="modal modal-bottom sm:modal-middle"
                    >
                        <div
                            class="modal-box dark:text-slate-400 dark:bg-sky-950"
                        >
                            <h3 class="font-bold text-lg">Edit User</h3>
                            <p class="py-4 text-xs">Press ESC key to close</p>
                            <div class="modal-action">
                                <form
                                    @submit.prevent="editUser(editingUserId)"
                                    class="flex flex-col gap-2"
                                >
                                    <div>
                                        <label
                                            for="edit_name"
                                            class="block text-smtext-left"
                                            >name</label
                                        >
                                        <input
                                            v-model="editedUser.name"
                                            type="text"
                                            id="edit_name"
                                            name="edit_name"
                                            required
                                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                            placeholder="Enter name"
                                        />
                                    </div>
                                    <div>
                                        <label
                                            for="edit_name"
                                            class="block text-smtext-left"
                                            >Email</label
                                        >
                                        <input
                                            v-model="editedUser.email"
                                            type="text"
                                            id="edit_email"
                                            name="edit_email"
                                            required
                                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                            placeholder="Enter email"
                                        />
                                    </div>
                                    <div>
                                        <label
                                            for="edit_details"
                                            class="block text-smtext-left"
                                            >Details</label
                                        >
                                        <input
                                            v-model="editedUser.details"
                                            type="text"
                                            id="edit_details"
                                            name="edit_details"
                                            required
                                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                            placeholder="Enter user details"
                                        />
                                    </div>
                                    <div>
                                        <label
                                            for="edit_role"
                                            class="block text-smtext-left"
                                            >Role</label
                                        >
                                        <input
                                            v-model="editedUser.role"
                                            type="text"
                                            id="edit_role"
                                            name="edit_role"
                                            required
                                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                            placeholder="Enter user role"
                                        />
                                    </div>
                                    <div>
                                        <label
                                            for="edit_phone"
                                            class="block text-smtext-left"
                                            >Phone Number</label
                                        >
                                        <input
                                            v-model="editedUser.phone"
                                            type="tel"
                                            id="edit_phone"
                                            name="edit_phone"
                                            required
                                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                            placeholder="Enter phone number"
                                        />
                                    </div>
                                    <div>
                                        <label
                                            for="edit_staff_number"
                                            class="block text-smtext-left"
                                            >Staff Number</label
                                        >
                                        <input
                                            v-model="editedUser.staff_number"
                                            type="text"
                                            id="edit_staff_number"
                                            name="edit_staff_number"
                                            required
                                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                            placeholder="Enter staff number"
                                        />
                                    </div>
                                    <div
                                        class="col-span-2 flex justify-end mt-2"
                                    >
                                        <CommonButton
                                            button-text="Submit"
                                            :action="
                                                () => editUser(editingUserId)
                                            "
                                        />
                                    </div>
                                </form>
                            </div>
                        </div>
                    </dialog>
                </tr>
            </template>
        </Table>

        <!-- Add User Modal -->
        <dialog id="addUser" class="modal modal-bottom sm:modal-middle">
            <div class="modal-box dark:text-slate-400 dark:bg-sky-950">
                <h3 class="font-bold text-lg">Add New User</h3>
                <p class="py-4 text-xs">Press ESC key to close</p>
                <div class="modal-action">
                    <form
                        @submit.prevent="addUser"
                        class="flex-1 flex-col justify-center gap-2"
                    >
                        <div>
                            <label for="name" class="block text-smtext-left"
                                >name</label
                            >
                            <input
                                v-model="newUser.name"
                                type="text"
                                id="name"
                                name="name"
                                required
                                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                placeholder="Enter name"
                            />
                        </div>
                        <div>
                            <label
                                for="edit_name"
                                class="block text-smtext-left"
                                >Email</label
                            >
                            <input
                                v-model="newUser.email"
                                type="text"
                                id="edit_email"
                                name="edit_email"
                                required
                                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                placeholder="Enter Email"
                            />
                        </div>
                        <div>
                            <label for="details" class="block text-smtext-left"
                                >Details</label
                            >
                            <input
                                v-model="newUser.details"
                                type="text"
                                id="details"
                                name="details"
                                required
                                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                placeholder="Enter user details"
                            />
                        </div>
                        <div>
                            <label for="role" class="block text-smtext-left"
                                >Role</label
                            >
                            <input
                                v-model="newUser.role"
                                type="text"
                                id="role"
                                name="role"
                                required
                                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                placeholder="Enter user role"
                            />
                        </div>
                        <div>
                            <label for="phone" class="block text-smtext-left"
                                >Phone Number</label
                            >
                            <input
                                v-model="newUser.phone"
                                type="tel"
                                id="phone"
                                name="phone"
                                required
                                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                placeholder="Enter phone number"
                            />
                        </div>
                        <div>
                            <label
                                for="staff_number"
                                class="block text-smtext-left"
                                >Staff Number</label
                            >
                            <input
                                v-model="newUser.staff_number"
                                type="text"
                                id="staff_number"
                                name="staff_number"
                                required
                                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-slate-500 focus:border-slate-500 sm:text-sm"
                                placeholder="Enter staff number"
                            />
                        </div>
                        <div class="col-span-2 flex justify-end mt-2">
                            <CommonButton
                                button-text="Submit"
                                :action="addUser"
                            />
                        </div>
                    </form>
                </div>
            </div>
        </dialog>
    </div>
</template>
<script setup>
import Table from "../../components/Tables/MainTable.vue";
import CommonButton from "../../components/Buttons/CommonButton.vue";
import SmallButton from "../../components/Buttons/Small.vue";
import { ref, onMounted } from "vue";
import axios from "axios";

const showModal = (modalId) => {
    document.getElementById(modalId).showModal();
};

const userData = ref([]);
const newUser = ref({
    name: "",
    email: "",
    details: "",
    role: "",
    phone: "",
    staff_number: "",
});

const editedUser = ref({
    name: "",
    details: "",
    role: "",
    email: "",
    phone: "",
    staff_number: "",
});

// Fetch initial user data on component mount
onMounted(async () => {
    await fetchUsers();
});

// Function to fetch all users
const fetchUsers = async () => {
    try {
        const response = await axios.get("admin/users/");
        userData.value = response.data.data.user;
    } catch (error) {
        console.error("Error fetching users:", error);
    }
};

// Function to add a new user
const addUser = async () => {
    try {
        // Validate form data (if needed)
        // Prepare form data
        const formData = {
            name: newUser.value.name,
            details: newUser.value.details,
            role: newUser.value.role,
            email: newUser.value.email,
            phone: newUser.value.phone,
            staff_number: newUser.value.staff_number,
        };

        // Send POST request to create user
        const response = await axios.post("admin/users/", formData);
        console.log("User added successfully:", response.data);

        // Clear form and close modal
        clearForm();
        closeModal("addUser"); // Implement closeModal function if necessary
    } catch (error) {
        console.error("Error adding user:", error);
    }
};

// Function to edit an existing user
const editUser = async (userId) => {
    try {
        // Validate form data (if needed)
        // Prepare form data
        const formData = {
            name: editedUser.value.name,
            details: editedUser.value.details,
            role: editedUser.value.role,
            email: editedUser.value.email,
            phone: editedUser.value.phone,
            staff_number: editedUser.value.staff_number,
        };

        // Send PUT request to update user
        const response = await axios.put(`users/${userId}`, formData);
        console.log("User updated successfully:", response.data);

        // Clear form and close modal
        clearForm();
        closeModal(`editUser${userId}`); // Implement closeModal function if necessary
    } catch (error) {
        console.error("Error updating user:", error);
    }
};

// Function to delete a user
const deleteUser = async (userId) => {
    try {
        // Send DELETE request to delete user
        const response = await axios.delete(`users/${userId}`);
        console.log("User deleted successfully:", response.data);

        // Update user data after deletion
        userData.value = userData.value.filter((user) => user.id !== userId);
    } catch (error) {
        console.error("Error deleting user:", error);
    }
};

// Function to clear form data
const clearForm = () => {
    newUser.value = {
        name: "",
        details: "",
        role: "",
        phone: "",
        staff_number: "",
        email: "",
    };
    editedUser.value = {
        name: "",
        details: "",
        role: "",
        phone: "",
        staff_number: "",
        email: "",
    };
};
</script>
