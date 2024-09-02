/** @type {import('tailwindcss').Config} */
import daisyui from "daisyui";
export default {
    purge: [
        "./vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php",
        "./storage/framework/views/*.php",
        "./resources/views/**/*.blade.php",
        "./resources/js/**/*.vue",
        "./resources/js/*/*.vue",
        "./node_modules/flowbite/**/*.js",
        "./app/Filament/**/*.php",
        "./resources/views/filament/**/*.blade.php",
        "./vendor/filament/**/*.blade.php",
    ],
    darkMode: "class",
    content: [
        "./vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php",
        "./storage/framework/views/*.php",
        "./resources/views/**/*.blade.php",
        "./resources/js/**/*.vue",
        "./resources/js/*/*.vue",
        "./node_modules/flowbite/**/*.js",
        "./app/Filament/**/*.php",
        "./resources/views/filament/**/*.blade.php",
        "./vendor/filament/**/*.blade.php",
    ],
    theme: {
        extend: {
            colors: {
                gold: "#FBD0A0",
                yellow: "#FF9900",
            },
            "confirmation-button": {
                padding: ".5rem 1rem",
                borderRadius: "0.5rem",
            },
        },
    },
    plugins: [require("daisyui")],
    darkMode: "class",
    daisyui: {
        darkTheme: true,
    },
};
