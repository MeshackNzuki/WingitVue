<script setup lang="ts">
import { RouterLink, RouterView } from "vue-router";
import Vue3Toastify, { toast } from "vue3-toastify";
import "../../node_modules/vue3-marquee-slider/dist/style.css";
import "vue3-toastify/dist/index.css";
import Header from "./components/Header.vue";
import Footer from "./components/Footer.vue";
import MobileNav from "./components/MobileNav.vue";
</script>
<template>
    <Header />
    <router-view v-slot="{ Component }">
        <transition name="page">
            <component :is="Component" />
        </transition>
    </router-view>
    <MobileNav />
</template>
