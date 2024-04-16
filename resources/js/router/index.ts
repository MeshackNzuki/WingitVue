import { createRouter, createWebHistory } from "vue-router";

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),

    routes: [
        {
            path: "/",
            name: "Login",
            component: () => import("../views/Auth/Login.vue"),
        },

        {
            path: "/signup",
            name: "Register",
            component: () => import("../views/Auth/Register.vue"),
        },
        // {
        //     path: "/shop/cart",
        //     name: "cart",
        //     component: () => import("../views/.vue"),
        // },
        // {
        //     path: "/shop/all",
        //     name: "all",
        //     component: () => import("../views/.vue"),
        // },
        // {
        //     path: "/shop/order-tracker",
        //     name: "tracker",
        //     component: () => import("../views/.vue"),
        // },
        // {
        //     path: "/shop/find/:id?",
        //     name: "about",
        //     component: () => import("../views.vue"),
        // },
    ],
});

export default router;
