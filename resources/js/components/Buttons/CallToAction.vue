<template>
    <button
        class="relative group overflow-hidden px-6 h-10 rounded-full flex space-x-2 items-center bg-gold shadow-lg shadow-gold/25 transition-transform duration-400 ease-in-out transform hover:scale-105"
    >
        <span class="relative font-normal leading-5 text-black">
            {{ label }}
            <slot name="action" />
        </span>
        <div class="flex items-center -space-x-4 translate-x-3">
            <div
                class="w-2.5 h-[1.6px] rounded bg-black origin-left scale-x-0 transition duration-300 group-hover:scale-x-100"
            ></div>
            <svg
                xmlns="http://www.w3.org/2000/svg"
                class="h-5 w-5 stroke-black -translate-x-4 transition duration-300 group-hover:translate-x-1"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
                stroke-width="2"
            >
                <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M9 5l7 7-7 7"
                />
            </svg>
        </div>
    </button>
</template>

<script>
export default {
    props: {
        label: {
            type: String,
            required: true,
        },
    },
};
</script>

<style scoped>
/* You can add any additional CSS or SCSS styles here */
</style>
