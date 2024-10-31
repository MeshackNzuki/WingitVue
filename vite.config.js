import { defineConfig } from "vite";
import vue from "@vitejs/plugin-vue";
import laravel from "laravel-vite-plugin";

export default defineConfig({
    plugins: [
        vue(),
        laravel({
            input: ["resources/css/app.css", "resources/js/main.ts"],
            refresh: true,
        }),
    ],
    define: {
        "process.env": {},
    },
    build: {
        outDir: "./public/build",
    },
});
