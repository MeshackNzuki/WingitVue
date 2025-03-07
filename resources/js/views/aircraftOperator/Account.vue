<template>
    <div class="h-full flex justify-center items-center min-h-screen bg-gray-100 p-6">
        <div class="w-full  bg-white  rounded-3xl p-6">
            <h3 class="font-bold text-lg">Company Profile</h3>
            <div class="flex flex-col items-center text-center">
                <div class="avatar mb-6">
                    <div class="ring-base ring-offset-base w-24 rounded-full ring ring-offset-2">
                        <img v-if="fileUrl != ''" :src="fileUrl" class="w-full" />
                        <img v-else :src="user?.avatar != null
                            ? `https://api.wingit.co.ke/core/storage/app/public/uploads/avatars/${user?.avatar}`
                            : `https://cdn.vectorstock.com/i/2000v/95/56/user-profile-icon-avatar-or-person-vector-45089556.avif`
                            " />
                    </div>
                </div>
                <label for="avatar" class="block mb-3 font-medium">Change Avatar</label>
                <input type="file" @change="handleFileChange" class="file-input file-input-bordered w-full max-w-xs" />
            </div>
            <form @submit.prevent="handleSubmit" class="space-y-4 mt-4">
                <div class="grid grid-cols-2 gap-4">
                    <div>
                        <label for="email" class="block  font-medium mb-1">Email</label>
                        <input type="email" v-model="formData.email"
                            class="w-full border border-gray-300 rounded-lg py-2 px-3 focus:outline-none focus:ring-2 focus:ring-blue-500" />
                    </div>
                    <div>
                        <label for="phone" class="block  font-medium mb-1">Phone Number</label>
                        <input type="text" v-model="formData.phone"
                            class="w-full border border-gray-300 rounded-lg py-2 px-3 focus:outline-none focus:ring-2 focus:ring-blue-500" />
                    </div>
                    <div>
                        <label for="password" class="block  font-medium mb-1">Update Password</label>
                        <input type="password" v-model="formData.password"
                            class="w-full border border-gray-300 rounded-lg py-2 px-3 focus:outline-none focus:ring-2 focus:ring-blue-500" />
                    </div>
                    <div>
                        <label for="username" class="block  font-medium mb-1">Username</label>
                        <input type="text" v-model="formData.username"
                            class="w-full border border-gray-300 rounded-lg py-2 px-3 focus:outline-none focus:ring-2 focus:ring-blue-500" />
                    </div>
                    <div>
                        <label for="first_name" class="block  font-medium mb-1">First Name</label>
                        <input type="text" v-model="formData.first_name"
                            class="w-full border border-gray-300 rounded-lg py-2 px-3 focus:outline-none focus:ring-2 focus:ring-blue-500" />
                    </div>
                    <div>
                        <label for="last_name" class="block  font-medium mb-1">Last Name</label>
                        <input type="text" v-model="formData.last_name"
                            class="w-full border border-gray-300 rounded-lg py-2 px-3 focus:outline-none focus:ring-2 focus:ring-blue-500" />
                    </div>
                    <div>
                        <label for="address" class="block  font-medium mb-1">Address</label>
                        <input type="text" v-model="formData.address"
                            class="w-full border border-gray-300 rounded-lg py-2 px-3 focus:outline-none focus:ring-2 focus:ring-blue-500" />
                    </div>
                    <div>
                        <label for="city" class="block  font-medium mb-1">City</label>
                        <input type="text" v-model="formData.city"
                            class="w-full border border-gray-300 rounded-lg py-2 px-3 focus:outline-none focus:ring-2 focus:ring-blue-500" />
                    </div>
                    <div>
                        <label for="country" class="block  font-medium mb-1">Country</label>
                        <input type="text" v-model="formData.country"
                            class="w-full border border-gray-300 rounded-lg py-2 px-3 focus:outline-none focus:ring-2 focus:ring-blue-500" />
                    </div>
                    <div>
                        <label for="postal_code" class="block  font-medium mb-1">Postal Code</label>
                        <input type="text" v-model="formData.postal_code"
                            class="w-full border border-gray-300 rounded-lg py-2 px-3 focus:outline-none focus:ring-2 focus:ring-blue-500" />
                    </div>
                </div>
                <div>
                    <label for="about" class="block  font-medium mb-1">About {{ formData.username }}</label>
                    <textarea v-model="formData.about"
                        class="w-full border border-gray-300 rounded-lg py-2 px-3 focus:outline-none focus:ring-2 focus:ring-blue-500"
                        rows="4"></textarea>
                </div>
                <button type="submit"
                    class="bg-base hover:base text-white font-semibold py-2 px-6 rounded-lg transition-all">
                    Save Changes
                </button>
            </form>
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
const fileUrl = ref([])

const formData = ref({
    email: user?.email || "",
    phone: user?.phone || "",
    avatar: user?.avatar || "",
    password: "",
    username: user?.username || "",
    first_name: user?.first_name || "",
    last_name: user?.last_name || "",
    address: user?.address || "",
    city: user?.city || "",
    country: user?.country || "",
    postal_code: user?.postal_code || "",
    about: user?.about || "",
});

const navigateToClient = () => {
    router.push("/client");
};

const handleFileChange = (e) => {
    formData.value.avatar = e.target.files[0];
    if (formData.value.avatar) {
        fileUrl.value = URL.createObjectURL(formData.value.avatar);
        console.log('fileurl', fileUrl.value);
    }
};

const fetchUserData = async () => {
    try {
        const response = await axios.get("/settings/profile-airop");
        console.log("user data from server", response.data);
        updateUserData(response.data);
    } catch (error) {
        console.error("Error fetching user data:", error);
    }
};

const handleSubmit = async () => {
    const form = new FormData();
    form.append("email", formData.value.email);
    form.append("phone", formData.value.phone);
    form.append("avatar", formData.value.avatar);
    form.append("password", formData.value.password);
    form.append("username", formData.value.username);
    form.append("first_name", formData.value.first_name);
    form.append("last_name", formData.value.last_name);
    form.append("address", formData.value.address);
    form.append("city", formData.value.city);
    form.append("country", formData.value.country);
    form.append("postal_code", formData.value.postal_code);
    form.append("about", formData.value.about);
    try {
        await axios.post("/settings/profile-airop", form, {
            headers: { "Content-Type": "multipart/form-data" },
        });
        toast.info("Information updated");
        fetchUserData();
        URL.revokeObjectURL(fileUrl.value);
    } catch (error) {
        console.error("Error updating profile:", error);
    }
};
</script>

<style scoped>
/* Add any custom styles here if needed */
</style>
