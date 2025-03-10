<template>

    <div class="w-full lg:w-8/12 px-4">
        <div class="flex flex-col md:flex-row md:space-x-4 justify-center items-center ">
            <div class="flex-1">
                <div class="bg-white shadow-md rounded-md p-4 mb-4">
                    <h3 class="text-lg font-semibold mb-4">Notifications</h3>
                    <div class="flex items-center space-x-4 mb-4">
                        <input type="checkbox" id="email-notifications" class="toggle">
                        <label for="email-notifications" class="text-sm">Email Notifications</label>
                    </div>
                    <div class="flex items-center space-x-4 mb-4">
                        <input type="checkbox" id="push-notifications" class="toggle">
                        <label for="push-notifications" class="text-sm">Push Notifications</label>
                    </div>
                    <!-- Add more notification options as needed -->
                </div>
                <div class="bg-white shadow-md rounded-md p-4">
                    <h3 class="text-lg font-semibold mb-4">Cookies Settings</h3>
                    <div class="flex items-center space-x-4 mb-4">
                        <input type="checkbox" id="essential-cookies" class="toggle" checked disabled>
                        <label for="essential-cookies" class="text-sm">Essential Cookies</label>
                    </div>
                    <div class="flex items-center space-x-4 mb-4">
                        <input type="checkbox" id="analytics-cookies" class="toggle">
                        <label for="analytics-cookies" class="text-sm">Analytics Cookies</label>
                    </div>
                    <div class="flex items-center space-x-4 mb-4">
                        <input type="checkbox" id="marketing-cookies" class="toggle">
                        <label for="marketing-cookies" class="text-sm">Marketing Cookies</label>
                    </div>
                    <CommonButton button-text="Save Preferences" :action="savePreferences" />
                </div>
            </div>
        </div>
    </div>

</template>
<script setup>
import CommonButton from '../../components/Buttons/CommonButton.vue';

import Swal from 'sweetalert2';

function savePreferences() {
    // Logic to save preferences goes here

    // Show success message
    Swal.fire({
        icon: 'success',
        title: 'Success',
        text: 'Preferences updated successfully!',
        confirmButtonColor: "#0f6566",
    });
}
</script>
