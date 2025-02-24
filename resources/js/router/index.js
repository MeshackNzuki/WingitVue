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
        path: "/password-reset",
        name: "PasswordReset",
        component: () => import("../views/auth/PasswordReset.vue"),
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
        path: "/faq",
        name: "FAQ",
        component: () => import("../views/Faq.vue"),
    },
    {
        path: "/help",
        name: "Help",
        component: () => import("../views/Help.vue"),
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
                path: "account",
                name: "aircraftOperatorAccount",
                component: () =>
                    import("../views/aircraftOperator/Account.vue"),
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
        path: "/customer",
        name: "Customer",
        component: () => import("../views/customer/Layout.vue"),
        meta: { role: "customer" },
        children: [
            {
                path: "",
                name: "CustomerDashboard",
                component: () => import("../views/customer/Dashboard.vue"),
            },
            {
                path: "bookings",
                name: "CustomerBookings",
                component: () => import("../views/customer/Bookings.vue"),
            },
            {
                path: "statements",
                name: "CustomerStatements",
                component: () => import("../views/customer/Statements.vue"),
            },
            {
                path: "trips",
                name: "CustomerTrips",
                component: () => import("../views/customer/Trips.vue"),
            },
            {
                path: "trips",
                name: "CustomerTrips",
                component: () => import("../views/customer/Trips.vue"),
            },
            {
                path: "fun-things",
                name: "CustomerFunthings",
                component: () => import("../views/customer/Funthings.vue"),
            },
            {
                path: "places",
                name: "CustomerPlaces",
                component: () => import("../views/customer/Places.vue"),
            },
            {
                path: "previous-bookings",
                name: "CustomerPreviousBookings",
                component: () =>
                    import("../views/customer/PreviousBookings.vue"),
            },
            {
                path: "messages",
                name: "CustomerMessages",
                component: () => import("../views/customer/Messages.vue"),
            },
            {
                path: "account",
                name: "CustomerAccount",
                component: () => import("../views/customer/Account.vue"),
            },
            {
                path: "settings",
                name: "CustomerSettings",
                component: () => import("../views/customer/Settings.vue"),
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
    history: createWebHistory("/"),
    routes,
});

router.beforeEach((to, from, next) => {
    const { user, is_authenticated } = authStore(); // Access auth state and user role
    const userRole = user?.role;

    // If the route is public, allow access
    if (!to.meta.role) {
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
    next();
});

export default router;
