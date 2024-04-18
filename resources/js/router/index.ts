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
        {
            path: "/admin",
            name: "Admin",
            component: () => import("../views/admin/Dashboard.vue"),
            children: [
                {
                    path: "/admin/dashboard",
                    component: Dashboard,
                },
                {
                    path: "/admin/settings",
                    component: Settings,
                },
                {
                    path: "/admin/tables",
                    component: Tables,
                },
                {
                    path: "/admin/maps",
                    component: Maps,
                },
            ],
        },
        {
            path: "/lib",
            name: "Library",
            component: () => import("../views/library/Dashboard.vue"),
            children: [
                {
                    path: "/admin/dashboard",
                    component: Dashboard,
                },
                {
                    path: "/admin/settings",
                    component: Settings,
                },
                {
                    path: "/admin/tables",
                    component: Tables,
                },
                {
                    path: "/admin/maps",
                    component: Maps,
                },
            ],
        },
        {
            path: "/finance",
            name: "Finance",
            component: () => import("../views/finance/Dashboard.vue"),
            children: [
                {
                    path: "/finance/dashboard",
                    component: Dashboard,
                },
                {
                    path: "/finance/settings",
                    component: Settings,
                },
                {
                    path: "/finance/tables",
                    component: Tables,
                },
                {
                    path: "/finance/maps",
                    component: Maps,
                },
            ],
        },
        {
            path: "/guardian",
            name: "Guardian",
            component: () => import("../views/guardian/Dashboard.vue"),
            children: [
                {
                    path: "/guardian/dashboard",
                    component: Dashboard,
                },
                {
                    path: "/guardian/settings",
                    component: Settings,
                },
                {
                    path: "/guardian/tables",
                    component: Tables,
                },
                {
                    path: "/guardian/maps",
                    component: Maps,
                },
            ],
        },
        {
            path: "/student",
            name: "Student",
            component: () => import("../views/student/Dashboard.vue"),
            children: [
                {
                    path: "/student/dashboard",
                    component: Dashboard,
                },
                {
                    path: "/student/settings",
                    component: Settings,
                },
                {
                    path: "/student/tables",
                    component: Tables,
                },
                {
                    path: "/student/maps",
                    component: Maps,
                },
            ],
        },
        {
            path: "/instructor",
            name: "Instructor",
            component: () => import("../views/student/instructor.vue"),
            children: [
                {
                    path: "/instractor/dashboard",
                    component: Dashboard,
                },
                {
                    path: "/instractor/settings",
                    component: Settings,
                },
                {
                    path: "/instractor/tables",
                    component: Tables,
                },
                {
                    path: "/instractor/maps",
                    component: Maps,
                },
            ],
        },
        { path: "/:pathMatch(.*)*", redirect: "/" },
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
