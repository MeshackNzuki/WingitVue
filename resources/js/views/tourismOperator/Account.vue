<template>
    <div class="h-full">
        <div class="grid grid-cols-1 lg:grid-cols-2 p-4 gap-4">
            <!-- Recent Activities Placeholder -->
        </div>
        <div class="w-full flex justify-center items-center">
            <div class="min-h-screen mt-20 md:mt-40 md:w-1/2 max-w-screen-2xl">
                <div class="w-full flex justify-end">
                    <span @click="navigateToClient" class="bg-white p-1 rounded-full">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                            stroke="currentColor" class="w-6 h-6">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                        </svg>
                    </span>
                </div>
                <div
                    class="bg-white p-6 rounded-3xl flex flex-col justify-center items-center shadow-md w-full text-center">
                    <form @submit.prevent="handleSubmit" class="space-y-4">
                        <span class="w-full flex justify-center">
                            <div class="avatar w-24 rounded-full ring ring-base ring-offset-base-100 ring-offset-2">
                                <img
                                    :src="`https://api.wingit.co.ke/core/storage/app/public/uploads/avatars/${formData.avatar}`" />
                            </div>
                        </span>
                        <div>
                            <label for="avatar" class="block mb-1 font-medium">Avatar</label>
                            <input type="file" @change="handleFileChange"
                                class="file-input file-input-ghost w-full max-w-xs" />
                        </div>
                        <div>
                            <label for="email" class="block mb-1 font-medium">Email</label>
                            <input type="email" v-model="formData.email"
                                class="w-full border border-gray-300 rounded-lg py-1 px-3" />
                        </div>
                        <div>
                            <label for="phone" class="block mb-1 font-medium">Phone number</label>
                            <input type="phone" v-model="formData.phone"
                                class="w-full border border-gray-300 rounded-lg py-1 px-3" />
                        </div>
                        <div>
                            <label for="password" class="block mb-1 font-medium">Update Password</label>
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
        <ToastContainer position="bottom-center" autoClose="2000" transition="Zoom" hideProgressBar limit="1" />
    </div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import { useRouter } from "vue-router";
import axios from "axios";
import { ToastContainer, toast } from "vue-toastification";

const router = useRouter();
const fileUrl = ref([])
const formData = ref({
    email: "",
    phone: "",
    avatar: null,
    password: "",
});

const fetchUserData = async () => {
    try {
        const response = await axios.get("/settings/profile-airop");
        const userData = response.data;
        formData.value = {
            email: userData.email || "",
            phone: userData.phone || "",
            avatar: userData.avatar || "",
            password: "",
        };
    } catch (error) {
        console.error("Error fetching user data:", error);
    }
};

onMounted(fetchUserData);

const navigateToClient = () => {
    router.push("/client");
};

const handleFileChange = (e) => {
    formData.value.avatar = e.target.files[0];
    const handleFileChange = (e) => {
        formData.value.avatar = e.target.files[0];
        if (formData.value.avatar) {
            fileUrl.value = URL.createObjectURL(formData.value.avatar);
            console.log('fileurl', fileUrl.value);
        }
    };

};

const handleSubmit = async () => {
    const form = new FormData();
    form.append("email", formData.value.email);
    form.append("phone", formData.value.phone);
    form.append("avatar", formData.value.avatar);
    form.append("password", formData.value.password);

    try {
        await axios.post("/settings/profile-airop", form, {
            headers: { "Content-Type": "multipart/form-data" },
        });
        toast.info("Information updated");
        URL.revokeObjectURL(fileUrl.value);
        fetchUserData(); // Reload the data
    } catch (error) {
        console.error("Error updating profile:", error);
    }
};
</script>

<style scoped>
/* Add any custom styles here if needed */
</style>
