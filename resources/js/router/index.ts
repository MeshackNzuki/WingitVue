import { createRouter, createWebHistory } from "vue-router";
import { authStore } from "../stores/authStore";

const routes = [
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
        component: () => import("../views/admin/Layout.vue"),
        meta: { role: "admin" },
        children: [
            {
                path: "",
                name: "AdminDashboard",
                component: () => import("../views/admin/Dashboard.vue"),
            },
            {
                path: "users",
                name: "AdminUsers",
                component: () => import("../views/admin/Users.vue"),
            },
            {
                path: "settings",
                name: "AdminSettings",
                component: () => import("../views/admin/Settings.vue"),
            },
            {
                path: "tables",
                name: "AdminTables",
                component: () => import("../views/admin/Tables.vue"),
            },
            {
                path: "profile",
                name: "AdminProfile",
                component: () => import("../views/admin/Profile.vue"),
            },
        ],
    },
    {
        path: "/admissions",
        name: "Admissions",
        component: () => import("../views/admissions/Layout.vue"),
        meta: { role: "admissions" },
        children: [
            {
                path: "",
                name: "AdmissionsDashboard",
                component: () => import("../views/admissions/Dashboard.vue"),
            },
            {
                path: "all",
                name: "AdmissionsAllStudents",
                component: () => import("../views/admissions/AllStudents.vue"),
            },
            {
                path: "alumni",
                name: "AdmissionsAlumniStudents",
                component: () => import("../views/admissions/Alumni.vue"),
            },
            {
                path: "settings",
                name: "AdmissionsSettings",
                component: () => import("../views/admissions/Settings.vue"),
            },

            {
                path: "profile",
                name: "AdmissionsProfile",
                component: () => import("../views/admissions/Profile.vue"),
            },
        ],
    },
    {
        path: "/library",
        name: "Library",
        component: () => import("../views/library/Layout.vue"),
        meta: { role: "library" },
        children: [
            {
                path: "",
                name: "LibraryDashboard",
                component: () => import("../views/library/Dashboard.vue"),
            },
            {
                path: "dashboard",
                name: "LibraryDashboard",
                component: () => import("../views/library/Dashboard.vue"),
            },
            {
                path: "settings",
                name: "LibrarySettings",
                component: () => import("../views/library/Settings.vue"),
            },
            {
                path: "tables",
                name: "LibraryTables",
                component: () => import("../views/library/Tables.vue"),
            },
            {
                path: "profile",
                name: "LibraryProfile",
                component: () => import("../views/library/Profile.vue"),
            },
        ],
    },
    {
        path: "/finance",
        name: "Finance",
        component: () => import("../views/finance/Layout.vue"),
        meta: { role: "finance" },
        children: [
            {
                path: "",
                name: "FinanceDashboard",
                component: () => import("../views/finance/Dashboard.vue"),
            },
            {
                path: "settings",
                name: "FinanceSettings",
                component: () => import("../views/finance/Settings.vue"),
            },
            {
                path: "fees",
                name: "Fees",
                component: () => import("../views/finance/Fees.vue"),
            },
        ],
    },
    {
        path: "/guardian",
        name: "Guardian",
        component: () => import("../views/guardian/Layout.vue"),
        meta: { role: "guardian" },
        children: [
            {
                path: "fees",
                name: "GuardianFees",
                component: () => import("../views/guardian/Fees.vue"),
            },
            {
                path: "exams",
                name: "GuardianExams",
                component: () => import("../views/guardian/Exams.vue"),
            },
            {
                path: "profile",
                name: "GuardianProfile",
                component: () => import("../views/guardian/Profile.vue"),
            },
        ],
    },
    {
        path: "/student",
        name: "Student",
        component: () => import("../views/student/Layout.vue"),
        meta: { role: "student" },
        children: [
            {
                path: "timetable",
                name: "StudentTimetable",
                component: () => import("../views/student/Timetable.vue"),
            },
            {
                path: "exams",
                name: "StudentExams",
                component: () => import("../views/student/Exams.vue"),
            },
            {
                path: "fees",
                name: "StudentFees",
                component: () => import("../views/student/Fees.vue"),
            },
            {
                path: "attendance",
                name: "StudentAttendance",
                component: () => import("../views/student/Attendance.vue"),
            },
        ],
    },
    {
        path: "/instructor",
        name: "Instructor",
        meta: { role: "instructor" },
        component: () => import("../views/instructor/Layout.vue"),
        children: [
            {
                path: "",
                name: "InstructorDashboard",
                component: () => import("../views/instructor/Dashboard.vue"),
            },
            {
                path: "timetable",
                name: "InstructorTimetable",
                component: () => import("../views/instructor/Timetable.vue"),
            },
            {
                path: "calendar",
                name: "InstructorCalendar",
                component: () => import("../views/instructor/Calendar.vue"),
            },
            {
                path: "classes",
                name: "InstructorClasses",
                component: () => import("../views/instructor/Classes.vue"),
            },
            {
                path: "planner",
                name: "InstructorPlanner",
                component: () => import("../views/instructor/Planner.vue"),
            },
        ],
    },
    {
        path: "/unauthorized",
        name: "Unauthorized",
        component: () => import("../views/Unauthorized.vue"),
    },
    { path: "/:pathMatch(.*)*", redirect: "/404" },
];

const router = createRouter({
    linkActiveClass: "border-indigo-500",
    linkExactActiveClass: "border-indigo-700",
    history: createWebHistory(import.meta.env.BASE_URL),
    routes,
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
