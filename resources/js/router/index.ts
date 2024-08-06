import { createRouter, createWebHistory } from "vue-router";
import { authStore } from "../stores/authStore";

const routes = [
    {
        path: "/login",
        name: "Login",
        component: () => import("../views/Auth/Login.vue"),
    },
    {
        path: "/",
        name: "Usher",
        component: () => import("../views/Usher.vue"),
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
                path: "continuing",
                name: "AdmissionsContinuingStudents",
                component: () => import("../views/admissions/Alumni.vue"),
            },
            {
                path: "settings",
                name: "AdmissionsSettings",
                component: () => import("../views/admissions/Settings.vue"),
            },
            {
                path: "levels",
                name: "AdmissionsLevels",
                component: () => import("../views/admissions/Levels.vue"),
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
                path: "all_books",
                name: "LibraryAllBooks",
                component: () => import("../views/library/All_books.vue"),
            },
            {
                path: "issued",
                name: "LibraryIssued",
                component: () => import("../views/library/Borrowed.vue"),
            },
            {
                path: "lost",
                name: "LibraryLostBooks",
                component: () => import("../views/library/Lost.vue"),
            },
            {
                path: "count_subject",
                name: "LibraryCountSubject",
                component: () => import("../views/library/Count_subject.vue"),
            },
            {
                path: "count_title",
                name: "LibraryCountTitle",
                component: () => import("../views/library/Count_title.vue"),
            },

            {
                path: "settings",
                name: "LibrarySettings",
                component: () => import("../views/library/Settings.vue"),
            },
            {
                path: "daily_reports",
                name: "Daily_reports",
                component: () => import("../views/library/Daily_reports.vue"),
            },
            {
                path: "weekly_reports",
                name: "Weekly_reports",
                component: () => import("../views/library/Weekly_reports.vue"),
            },
            {
                path: "alumni",
                name: "LibraryAlumni",
                component: () => import("../views/library/Alumni.vue"),
            },
            {
                path: "all_students",
                name: "LibraryStudents",
                component: () => import("../views/library/All_students.vue"),
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
                path: "fee-manager",
                name: "FeeManager",
                component: () => import("../views/finance/FeeManager.vue"),
            },
            {
                path: "student-fees",
                name: "StudentsFees",
                component: () => import("../views/finance/StudentsFees.vue"),
            },
            {
                path: "fee-payments",
                name: "FeePayments",
                component: () => import("../views/finance/FeePayments.vue"),
            },
            {
                path: "payments-report",
                name: "PaymentsReport",
                component: () => import("../views/finance/PaymentsReport.vue"),
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
        path: "/inventory",
        name: "Inventory",
        meta: { role: "inventory-manager" },
        component: () => import("../views/inventory/Layout.vue"),
        children: [
            {
                path: "",
                name: "InventoryDashboard",
                component: () => import("../views/inventory/Dashboard.vue"),
            },
            {
                path: "items",
                name: "InventoryItems",
                component: () => import("../views/inventory/Items.vue"),
            },
            {
                path: "suppliers",
                name: "InventorySuppliers",
                component: () => import("../views/inventory/Suppliers.vue"),
            },
            {
                path: "orders",
                name: "InventoryOrders",
                component: () => import("../views/inventory/Orders.vue"),
            },
            {
                path: "reports",
                name: "InventoryReports",
                component: () => import("../views/inventory/Reports.vue"),
            },
            {
                path: "transport",
                name: "InventoryTransport",
                component: () => import("../views/inventory/Transport.vue"),
            },
            {
                path: "routes",
                name: "TransportRoutes",
                component: () => import("../views/inventory/Routes.vue"),
            },
            {
                path: "vehicles",
                name: "TransportVehicles",
                component: () => import("../views/inventory/Vehicles.vue"),
            },
            {
                path: "drivers",
                name: "TransportDrivers",
                component: () => import("../views/inventory/Drivers.vue"),
            },
        ],
    },

    {
        path: "/hostel",
        name: "Hostels",
        meta: { role: "hostel-manager" },
        component: () => import("../views/hostel/Layout.vue"),
        children: [
            {
                path: "",
                name: "HostelsDashboard",
                component: () => import("../views/hostel/Dashboard.vue"),
            },
            {
                path: "all",
                name: "HostelAll",
                component: () => import("../views/hostel/Hostels.vue"),
            },
            {
                path: "rooms",
                name: "HostelRooms",
                component: () => import("../views/hostel/Rooms.vue"),
            },
            {
                path: "students",
                name: "HostelStudents",
                component: () => import("../views/hostel/Students.vue"),
            },
            {
                path: "staff",
                name: "HostelStaff",
                component: () => import("../views/hostel/Staff.vue"),
            },
            {
                path: "maintenance",
                name: "HostelMaintenance",
                component: () => import("../views/hostel/Maintenance.vue"),
            },
        ],
    },
    {
        path: "/user/profile",
        name: "Profile",
        component: () => import("../views/Profile.vue"),
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
    console.log("Checking access...", user?.token);

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
