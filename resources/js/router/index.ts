import { createRouter, createWebHistory } from "vue-router";
import { authStore } from "../stores/authStore";

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),

    routes: [
        {
            path: "/login",
            name: "Login",
            component: () => import("../views/Auth/Login.vue"),
        },
        {
            path: "/404",
            name: "404",
            component: () => import("../views/404.vue"),
        },
        {
            path: "/admin",
            name: "Admin",
            component: () => import("../views/admin/Dashboard.vue"),
            meta: { role: "admin" },
            children: [
                {
                    path: "/admin/dashboard",
                    component: () => import("../views/library/Dashboard.vue"),
                },
                {
                    path: "/admin/settings",
                    component: () => import("../views/library/Dashboard.vue"),
                },
                {
                    path: "/admin/tables",
                    component: () => import("../views/library/Dashboard.vue"),
                },
                {
                    path: "/admin/maps",
                    component: () => import("../views/library/Dashboard.vue"),
                },
            ],
        },
        {
            path: "/lib",
            name: "Library",
            component: () => import("../views/library/Dashboard.vue"),
            meta: { role: "library" },
            children: [
                {
                    path: "/admin/dashboard",
                    component: () => import("../views/library/Dashboard.vue"),
                },
                {
                    path: "/admin/settings",
                    component: () => import("../views/library/Dashboard.vue"),
                },
                {
                    path: "/admin/tables",
                    component: () => import("../views/library/Dashboard.vue"),
                },
                {
                    path: "/admin/maps",
                    component: () => import("../views/library/Dashboard.vue"),
                },
            ],
        },
        {
            path: "/finance",
            name: "Finance",
            component: () => import("../views/finance/Dashboard.vue"),
            meta: { role: "finance" },
            children: [
                {
                    path: "/finance/dashboard",
                    component: () => import("../views/finance/Dashboard.vue"),
                },
                {
                    path: "/finance/dashboard",
                    component: () => import("../views/finance/Settings.vue"),
                },
                {
                    path: "/finance/collection",
                    component: () => import("../views/finance/Tables.vue"),
                },
                // {
                //     path: "/finance/collection",
                //     component: () => import("../views/fees/collection.vue"),
                // },
            ],
        },
        {
            path: "/guardian",
            name: "Guardian",
            component: () => import("../views/guardian/Dashboard.vue"),
            meta: { role: "guardian" },
            children: [
                {
                    path: "/guardian/fees",
                    component: () => import("../views/guardian/Dashboard.vue"),
                },
                {
                    path: "/guardian/exams",
                    component: () => import("../views/guardian/Settings.vue"),
                },
                {
                    path: "/guardian/exams",
                    component: () => import("../views/guardian/Settings.vue"),
                },
                {
                    path: "/guardian/activity",
                    component: () => import("../views/guardian/Settings.vue"),
                },
            ],
        },
        {
            path: "/student",
            name: "Student",
            component: () => import("../views/student/Dashboard.vue"),
            meta: { role: "student" },
            children: [
                {
                    path: "/student/timetable",
                    component: () => import("../views/student/Dashboard.vue"),
                },
                {
                    path: "/student/exams",
                    component: () => import("../views/student/Dashboard.vue"),
                },
                {
                    path: "/student/fees",
                    component: () => import("../views/student/Dashboard.vue"),
                },
                {
                    path: "/student/attendance",
                    component: () => import("../views/student/Dashboard.vue"),
                },
            ],
        },
        {
            path: "/instructor",
            name: "Instructor",
            meta: { role: "instructor" },
            component: () => import("../views/instructor/Dashboard.vue"),
            children: [
                {
                    path: "/instractor/timetable",
                    component: () =>
                        import("../views/instructor/Timetable.vue"),
                },
                {
                    path: "/instractor/calendar",
                    component: () =>
                        import("../views/instructor/Timetable.vue"),
                },
                {
                    path: "/instractor/classes",
                    component: () =>
                        import("../views/instructor/Timetable.vue"),
                },
                {
                    path: "/instractor/planner",
                    component: () =>
                        import("../views/instructor/Timetable.vue"),
                },
            ],
        },
        {
            path: "/unauthorized",
            component: () => import("../views/Unauthorized.vue"),
        },

        { path: "/:pathMatch(.*)*", redirect: "/404" },
    ],
});

router.beforeEach((to, from, next) => {
    const { user, is_authenticated } = authStore();
    console.log("Checking access...");

    if (is_authenticated) {
        const userRole = user?.roles[0];

        if (userRole === "admin") {
            return next();
        }

        if (to.meta.role) {
            const requiredRoles = Array.isArray(to.meta.role)
                ? to.meta.role
                : [to.meta.role];

            if (requiredRoles.includes(userRole)) {
                return next();
            } else {
                return next({ path: "/unauthorized" });
            }
        } else {
            return next();
        }
    } else {
        return next();
    }
});

export default router;
