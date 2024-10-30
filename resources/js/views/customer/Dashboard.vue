<template>
    <div class="bg-slate-100 dark:bg-transparent min-h-screen">
        {{
            mainStore.greetings +
            ","(auth.user?.name || auth.user?.company_name)
        }}
    </div>
    {{ auth.user?.name }}
</template>
<script setup>
import CommonButton from "../../components/Buttons/CommonButton.vue";
import { useMainStore } from "../../stores";
import { authStore } from "../../stores/authStore";

const auth = authStore;

const mainStore = useMainStore();
</script>
