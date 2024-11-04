<template>
    <div class="h-full">
        <div class="w-full flex justify-center items-center">
            <div class="min-h-screen">
                <div class="w-full flex justify-end"></div>
                <div
                    class="p-6 rounded-3xl flex flex-col justify-center items-center w-full text-center"
                >
                    <div class="flex items-center mb-6">
                        <form @submit.prevent="handleSubmit" class="space-y-4">
                            <span
                                class="w-full flex justify-center text-center"
                            >
                                <div
                                    class="avatar w-24 h-24 rounded-full ring ring-base ring-offset-base-100 ring-offset-2"
                                >
                                    <img
                                        :src="`https://api.wingit.co.ke/core/storage/app/public/uploads/avatars/${formData.avatar}`"
                                    />
                                </div>
                            </span>
                            <div>
                                <input
                                    type="file"
                                    @change="handleFileChange"
                                    class="file-input file-input-ghost w-full max-w-xs"
                                />
                            </div>
                            <div>
                                {{ JSON.stringify(auth.user?.user) }}
                                <label class="block mb-1 font-medium"
                                    >Name</label
                                >
                                <input
                                    type="text"
                                    v-model="formData.name"
                                    class="w-full border border-gray-300 rounded-lg py-1 px-3"
                                />
                            </div>
                            <div>
                                <label class="block mb-1 font-medium"
                                    >Email</label
                                >
                                <input
                                    type="email"
                                    v-model="formData.email"
                                    class="w-full border border-gray-300 rounded-lg py-1 px-3"
                                />
                            </div>
                            <div>
                                <label class="block mb-1 font-medium"
                                    >Phone Number</label
                                >
                                <input
                                    type="text"
                                    v-model="formData.phone"
                                    class="w-full border border-gray-300 rounded-lg py-1 px-3"
                                />
                            </div>
                            <div>
                                <label class="block mb-1 font-medium"
                                    >Nationality</label
                                >
                                <input
                                    type="text"
                                    v-model="formData.nationality"
                                    class="w-full border border-gray-300 rounded-lg py-1 px-3"
                                />
                            </div>

                            <div>
                                <label class="block mb-1 font-medium"
                                    >ID Number / Passport Number</label
                                >
                                <input
                                    type="number"
                                    v-model="formData.id_number"
                                    class="w-full border border-gray-300 rounded-lg py-1 px-3"
                                />
                            </div>
                            <div>
                                <label class="block mb-1 font-medium"
                                    >Update Password</label
                                >
                                <input
                                    type="password"
                                    v-model="formData.password"
                                    class="w-full border border-gray-300 rounded-lg py-1 px-3"
                                />
                            </div>
                            <button
                                type="submit"
                                class="bg-base hover:bg-second text-gray-50 py-1 px-4 rounded-full"
                            >
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
const auth = authStore;
const reload = ref(false);
const formData = ref({
    email: auth.user?.email || "",
    phone: auth.user?.phone || "",
    passport_no: auth.user?.passport_no || "",
    avatar: auth.user?.avatar || "",
    id_number: auth.user?.id_number || "",
    password: null,
    nationality: auth.user?.nationality || "",
    name: auth.user?.name || "",
});

const fetchUserData = async () => {
    try {
        const response = await axios.get("/settings/profile-customer");
        Object.assign(formData.value, response.data);
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
