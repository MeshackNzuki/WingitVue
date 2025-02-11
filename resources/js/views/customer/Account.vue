<template>
    <div class="h-full">
        <div class="w-full flex justify-center items-center">
            <div class="min-h-screen">
                <div class="w-full flex justify-end"></div>
                <div class="p-6 rounded-3xl flex flex-col justify-center items-center w-full text-center">
                    <div class="flex items-center mb-6">
                        <form @submit.prevent="handleSubmit" class="space-y-4">
                            <span class="w-full flex justify-center text-center">
                                <div class="avatar">
                                    <div class="ring-base ring-offset-base w-24 rounded-full ring ring-offset-2">
                                        <img v-if="fileUrl != ''" :src="fileUrl" class="w-full" />
                                        <img v-else :src="user?.avatar != null
                                            ? `https://api.wingit.co.ke/core/storage/app/public/uploads/avatars/${user?.avatar}`
                                            : `https://cdn.vectorstock.com/i/2000v/95/56/user-profile-icon-avatar-or-person-vector-45089556.avif`
                                            " />
                                    </div>
                                </div>
                            </span>
                            <div>
                                <input type="file" @change="handleFileChange"
                                    class="file-input file-input-ghost w-full max-w-xs" />
                            </div>
                            <div>
                                {{ JSON.stringify(user?.user) }}
                                <label class="block mb-1 font-medium">Name</label>
                                <input type="text" v-model="formData.name"
                                    class="w-full border border-gray-300 rounded-lg py-1 px-3" />
                            </div>
                            <div>
                                <label class="block mb-1 font-medium">Email</label>
                                <input type="email" v-model="formData.email"
                                    class="w-full border border-gray-300 rounded-lg py-1 px-3" />
                            </div>
                            <div>
                                <label class="block mb-1 font-medium">Phone Number</label>
                                <input type="text" v-model="formData.phone"
                                    class="w-full border border-gray-300 rounded-lg py-1 px-3" />
                            </div>
                            <div>
                                <label class="block mb-1 font-medium">Nationality</label>
                                <input type="text" v-model="formData.nationality"
                                    class="w-full border border-gray-300 rounded-lg py-1 px-3" />
                            </div>

                            <div>
                                <label class="block mb-1 font-medium">ID Number / Passport Number</label>
                                <input type="number" v-model="formData.id_number"
                                    class="w-full border border-gray-300 rounded-lg py-1 px-3" />
                            </div>
                            <div>
                                <label class="block mb-1 font-medium">Update Password</label>
                                <input type="password" v-model="formData.password"
                                    class="w-full border border-gray-300 rounded-lg py-1 px-3" />
                            </div>
                            <button type="submit" class="bg-base hover:bg-second text-gray-50 py-1 px-4 rounded-full">
                                Save Changes
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import { useRouter } from "vue-router";
import axios from "axios";
import { toast } from "vue3-toastify";
import { authStore } from "../../stores/authStore";

const router = useRouter();
const { user, updateUserData } = authStore();
const reload = ref(false);
const fileUrl = ref([])
const formData = ref({
    email: user?.email || "",
    phone: user?.phone || "",
    passport_no: user?.passport_no || "",
    avatar: user?.avatar || "",
    id_number: user?.id_number || "",
    password: null,
    nationality: user?.nationality || "",
    name: user?.name || "",
});

const fetchUserData = async () => {
    try {
        const response = await axios.get("/settings/profile-customer");
        console.log("user data from server", response.data);
        updateUserData(response.data);
    } catch (error) {
        console.error("Error fetching user data:", error);
    }
};

const navigateToClient = () => {
    router.push("/client");
};

const handleFileChange = (e) => {
    formData.value.avatar = e.target.files[0];
    if (formData.value.avatar) {
        fileUrl.value = URL.createObjectURL(formData.value.avatar);
        console.log('fileurl on customer', fileUrl.value);
    }
};

const handleSubmit = async () => {
    const form = new FormData();
    for (const key in formData.value) {
        form.append(key, formData.value[key]);
    }
    try {
        await axios.post("/settings/profile-customer", form, {
            headers: { "Content-Type": "multipart/form-data" },
        });
        URL.revokeObjectURL(fileUrl.value);
        toast.info("Information updated");
        fetchUserData();
    } catch (error) {
        console.error("Error updating profile:", error);
    }
};
</script>

<style scoped>
/* Add any custom styles here if needed */
</style>
