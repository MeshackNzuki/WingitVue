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
            path: "/fees",
            name: "Fees",
            component: () => import("../views/fees/Dashboard.vue"),
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
                    path: "/finance/collection",
                    component: Tables,
                },
                {
                    path: "/finance/balances",
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
                    path: "/guardian/fees",
                    component: Dashboard,
                },
                {
                    path: "/guardian/exams",
                    component: Settings,
                },
                {
                    path: "/guardian/appointmets",
                    component: Tables,
                },
                {
                    path: "/guardian/activity",
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
                    path: "/student/timetable",
                    component: Dashboard,
                },
                {
                    path: "/student/exams",
                    component: Settings,
                },
                {
                    path: "/student/fees",
                    component: Tables,
                },
                {
                    path: "/student/attendance",
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
                    path: "/instractor/timetable",
                    component: Dashboard,
                },
                {
                    path: "/instractor/calendar",
                    component: Settings,
                },
                {
                    path: "/instractor/classes",
                    component: Tables,
                },
                {
                    path: "/instractor/planner",
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
