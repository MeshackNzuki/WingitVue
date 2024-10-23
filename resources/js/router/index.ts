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
        path: "/operator",
        name: "Operator",
        component: () => import("../views/operator.vue"),
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
        meta: { role: "aircraft_operator" },
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
                path: "aircrafts",
                name: "Aircrafs",
                component: () =>
                    import("../views/aircraftOperator/Aircrafts.vue"),
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
        meta: { role: "tourism_operator" },
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
    const { user, is_authenticated } = authStore(); // Access auth state and user role
    const userRole = user?.role;

    // If the route is public, allow access
    if (!to.meta.role) {
        console.log("public");
        return next();
    }

    // If the route is protected but the user is not authenticated, redirect to login
    if (to.meta.role && !is_authenticated) {
        return next({ path: "/login" });
    }

    // If authenticated, check if the user has the correct role
    if (is_authenticated && to.meta.role !== userRole) {
        console.log("401");
        return next({ path: "/unauthorized" });
    }
    console.log("ok");
    next();
});

export default router;
