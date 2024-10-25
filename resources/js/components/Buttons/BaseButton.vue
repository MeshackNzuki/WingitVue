<script setup>
const props = defineProps({
    attrib: { type: String, default: "" },
    label: { type: String, default: "Button Comp" },
    action: { type: Function, default: () => {} },
    icon: { type: String, default: "" },
    type: { type: String, default: "button" },
});

const handleClick = () => {
    props.action();
};
</script>

<template>
    <button
        class="flex-1 group rounded-full py-1 px-4 bg-gradient-to-tr from-teal-600 to-base font-normal shadow-sm shadow-black/20 relative overflow-hidden transition-transform duration-250 transform hover:scale-110"
        @click="handleClick"
        :type="type"
        :attrib="attrib"
    >
        <span class="relative font-light leading-5 text-gray-50">
            {{ label }}
            <slot name="icon">
                <i :class="icon" v-if="icon"></i>
            </slot>
        </span>
        <div
            class="absolute inset-0 w-full h-full transition-all duration-300 scale-0 group-hover:scale-100 group-hover:bg-white/30 rounded-md"
        ></div>
    </button>
</template>
