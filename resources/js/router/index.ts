import { createRouter, createWebHistory } from "vue-router";
import { authStore } from "../stores/authStore";

const routes = [
    // Public routes
    { path: "", name: "Home", component: () => import("../views/Home.vue") },
    {
        path: "/login",
        name: "Login",
        component: () => import("../views/auth/Login.vue"),
    },
    {
        path: "/client-register",
        name: "ClientRegister",
        component: () => import("../views/auth/ClientRegister.vue"),
    },
    {
        path: "/aircraft-operator-register",
        name: "AircraftOperatorRegister",
        component: () => import("../views/auth/AircraftOperatorRegister.vue"),
    },
    {
        path: "/tourism-operator-register",
        name: "TourismOperatorRegister",
        component: () => import("../views/auth/TourismOperatorRegister.vue"),
    },
    {
        path: "/flight-booking",
        name: "FlightBooking",
        component: () => import("../views/FlightBooking.vue"),
    },
    {
        path: "/about",
        name: "About",
        component: () => import("../views/About.vue"),
    },
    {
        path: "/listed-flights",
        name: "ListedFlights",
        component: () => import("../views/ListedFlights.vue"),
    },
    {
        path: "/principle",
        name: "Principle",
        component: () => import("../views/Principle.vue"),
    },
    {
        path: "/privacy",
        name: "Privacy",
        component: () => import("../views/Privacy.vue"),
    },
    {
        path: "/flight-search",
        name: "FlightSearch",
        component: () => import("../views/FlightSearch.vue"),
    },
    {
        path: "/terms",
        name: "Terms",
        component: () => import("../views/Terms.vue"),
    },

    // Protected dashboard routes
    {
        path: "/aircraft-operator",
        name: "AircraftOperator",
        component: () => import("../views/aircraftOperator/Layout.vue"),
        meta: { role: "aircraftOperator" },
        children: [
            {
                path: "",
                name: "AircraftsDashboard",
                component: () =>
                    import("../views/aircraftOperator/Dashboard.vue"),
            },
            {
                path: "all-flights",
                name: "AircraftAllFlights",
                component: () =>
                    import("../views/aircraftOperator/AllFlights.vue"),
            },
            {
                path: "listed-flights",
                name: "AircraftListedFlights",
                component: () =>
                    import("../views/aircraftOperator/ListedFlights.vue"),
            },
            {
                path: "messages",
                name: "AircraftMessages",
                component: () =>
                    import("../views/aircraftOperator/Messages.vue"),
            },
            {
                path: "notifications",
                name: "AircraftNotifications",
                component: () =>
                    import("../views/aircraftOperator/Notifications.vue"),
            },
            {
                path: "pilots",
                name: "AircraftPilots",
                component: () => import("../views/aircraftOperator/Pilots.vue"),
            },
            {
                path: "settings",
                name: "AircraftSettings",
                component: () =>
                    import("../views/aircraftOperator/Settings.vue"),
            },
            {
                path: "statements",
                name: "AircraftStatements",
                component: () =>
                    import("../views/aircraftOperator/Statements.vue"),
            },
            {
                path: "trips",
                name: "AircraftTrips",
                component: () => import("../views/aircraftOperator/Trips.vue"),
            },
        ],
    },
    {
        path: "/client",
        name: "Client",
        component: () => import("../views/client/Layout.vue"),
        meta: { role: "client" },
        children: [
            {
                path: "",
                name: "ClientDashboard",
                component: () => import("../views/client/Dashboard.vue"),
            },
            {
                path: "bookings",
                name: "ClientBookings",
                component: () => import("../views/client/Bookings.vue"),
            },
            {
                path: "statements",
                name: "ClientStatements",
                component: () => import("../views/client/Statements.vue"),
            },
            {
                path: "trips",
                name: "ClientTrips",
                component: () => import("../views/client/Trips.vue"),
            },
            {
                path: "messages",
                name: "ClientMessages",
                component: () => import("../views/client/Messages.vue"),
            },
            {
                path: "settings",
                name: "ClientSettings",
                component: () => import("../views/client/Settings.vue"),
            },
        ],
    },
    {
        path: "/tourism-operator",
        name: "TourismOperator",
        component: () => import("../views/tourismOperator/Layout.vue"),
        meta: { role: "tourismOperator" },
        children: [
            {
                path: "incoming-bookings",
                name: "IncomingBookings",
                component: () =>
                    import("../views/tourismOperator/IncomingBookings.vue"),
            },
            {
                path: "messages",
                name: "TourismMessages",
                component: () =>
                    import("../views/tourismOperator/Messages.vue"),
            },
            {
                path: "notifications",
                name: "TourismNotifications",
                component: () =>
                    import("../views/tourismOperator/Notifications.vue"),
            },
            {
                path: "all-bookings",
                name: "AllBookings",
                component: () =>
                    import("../views/tourismOperator/AllBookings.vue"),
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
    const userRole = user?.roles[0];
    return next();

    // Allow access to public pages
    if (!to.meta.role) {
        return next();
    }

    // For authenticated users, check if they have the correct role
    if (is_authenticated) {
        if (userRole === "admin" || to.meta.role === userRole) {
            return next();
        }
        return next({ path: "/unauthorized" });
    }

    // Redirect unauthenticated users trying to access protected routes
    // next({ path: "/login" });
    return next();
});

export default router;
