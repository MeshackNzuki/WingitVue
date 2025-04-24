<template>
    <div>
        <div className="min-h-screen flex flex-col items-center justify-ceter bg-[url('../assets/searchpg.jpg')] p-2">
            <div v-motion="motionPresets.fadeDown()"
                className="w-full flex justify-center mt-24 mb-6  md:mt-32 text-gray-50 font-medium text-lg md:mb-10 uppercase">
                Tourism operator
            </div>
            <div v-motion="motionPresets.fadeUp()"
                className="relative flex flex-col bg-white bg-opacity-85 shadow-md px-4 sm:px-6 md:px-4 lg:px-4 py-2 md:py-4 rounded-md w-full  max-w-[400px]">
                <div className="font-bold self-center text-xl sm:text-2xl uppercase text-basemt-5">
                    signup
                </div>
                <div>
                    <div v-if="currentStep === 1">
                        <form action="#" @submit.prevent="">
                            <div class="flex flex-col mb-3 md:mb-6">
                                <label for="name" class="mb-1 text-xs sm:text-sm tracking-wide  font-semibold">
                                    Full Company Name
                                </label>
                                <div class="relative">
                                    <div
                                        class="inline-flex items-center justify-center absolute left-0 top-0 h-full w-10 ">
                                        <i class="pi pi-users text-xl"></i>
                                    </div>
                                    <input id="name" type="text" v-model="formVals.company_name"
                                        class="text-sm sm:text-base placeholder-gray-500 pl-10 pr-4 rounded-full border border-gray-400 w-full py-2 focus:outline-none focus:border-green-800"
                                        placeholder="Registered Company Name" />
                                </div>
                                <Error v-if="errors.step1.company_name" :message="errors.step1.company_name" />
                            </div>

                            <div class="flex flex-col mb-3 md:mb-6">
                                <label for="email" class="mb-1 text-xs sm:text-sm tracking-wide  font-semibold">
                                    E-Mail Address
                                </label>
                                <div class="relative">
                                    <div
                                        class="inline-flex items-center justify-center absolute left-0 top-0 h-full w-10 ">
                                        <i class="pi pi-envelope text-xl"></i>
                                    </div>
                                    <input id="email" type="email" v-model="formVals.email"
                                        class="text-sm sm:text-base placeholder-gray-500 pl-10 pr-4 rounded-full border border-gray-400 w-full py-2 focus:outline-none focus:border-green-800"
                                        placeholder="E-Mail Address" />
                                </div>
                                <Error v-if="errors.step1.email" :message="errors.step1.email" />
                            </div>

                            <div class="flex flex-col mb-3 md:mb-6">
                                <label for="contact_number"
                                    class="mb-1 text-xs sm:text-sm tracking-wide  font-semibold">
                                    Contact Number
                                </label>
                                <div class="relative">
                                    <div
                                        class="inline-flex items-center justify-center absolute left-0 top-0 h-full w-10 ">
                                        <i class="pi pi-phone text-xl"></i>
                                    </div>
                                    <input id="contact_number" type="tel" v-model="formVals.contact_number"
                                        class="text-sm sm:text-base placeholder-gray-500 pl-10 pr-4 rounded-full border border-gray-400 w-full py-2 focus:outline-none focus:border-green-800"
                                        placeholder="Contact Number" />
                                </div>
                                <Error v-if="errors.step1.contact_number" :message="errors.step1.contact_number" />
                            </div>

                            <div class="flex justify-between space-x-4 w-full mt-4">
                                <BaseButton label="Next" class="p-8" :action="() => handleNext()" />
                            </div>
                        </form>
                    </div>

                    <div v-if="currentStep === 2">
                        <ul class="steps w-full">
                            <li data-content="✓" class="step step-success"></li>
                            <li data-content="✓" class="step"></li>
                            <li data-content="✓" class="step"></li>
                        </ul>

                        <!-- Password Field -->
                        <div class="flex flex-col mb-3 md:mb-6">
                            <label for="password" class="mb-1 text-xs sm:text-sm tracking-wide  font-semibold">
                                Password:
                            </label>
                            <div class="relative">
                                <div class="inline-flex items-center justify-center absolute left-0 top-0 h-full w-10 ">
                                    <i class="pi pi-lock text-xl"></i>
                                </div>
                                <input id="password" type="password" v-model="formVals.password"
                                    class="text-sm sm:text-base placeholder-gray-500 pl-10 pr-4 rounded-full border border-gray-400 w-full py-2 focus:outline-none focus:border-green-800"
                                    placeholder="Password" />
                            </div>
                            <Error v-if="errors.step2.password" :message="errors.step2.password" />
                        </div>

                        <!-- Confirm Password Field -->
                        <div class="flex flex-col mb-3 md:mb-6">
                            <label for="password_confirmation"
                                class="mb-1 text-xs sm:text-sm tracking-wide  font-semibold">
                                Confirm Password:
                            </label>
                            <div class="relative">
                                <div class="inline-flex items-center justify-center absolute left-0 top-0 h-full w-10 ">
                                    <i class="pi pi-check-circle text-xl"></i>
                                </div>
                                <input id="password_confirmation" type="password"
                                    v-model="formVals.password_confirmation"
                                    class="text-sm sm:text-base placeholder-gray-500 pl-10 pr-4 rounded-full border border-gray-400 w-full py-2 focus:outline-none focus:border-green-800"
                                    placeholder="Confirm Password" />
                            </div>
                            <Error v-if="errors.step2.password_confirmation"
                                :message="errors.step2.password_confirmation" />
                        </div>

                        <!-- Navigation BaseButtons -->
                        <div class="flex justify-between space-x-4 w-full mt-4">
                            <BaseButton label="Previous" class="p-8" :action="() => handlePrev()" />
                            <BaseButton label="Next" class="p-8" :action="() => handleNext()" />
                        </div>
                    </div>

                    <div v-if="currentStep === 3">
                        <div>
                            <!-- Step Indicator -->
                            <ul class="steps w-full">
                                <li data-content="✓" class="step step-success"></li>
                                <li data-content="✓" class="step step-success"></li>
                                <li data-content="✓" class="step"></li>
                            </ul>

                            <!-- File Upload Section -->
                            <div class="mb-6 pt-4">
                                <label class="mb-5 block text-xl font-semibold ">
                                    Certificate of incorporation (upload copy)
                                </label>
                                <div class="mb-8">
                                    <input type="file" name="coi" id="file1" class="sr-only"
                                        @change="handleFileChange" />
                                    <label for="file1"
                                        class="relative flex min-h-[200px] items-center justify-center rounded-md border border-dashed border-[#e0e0e0] p-12 text-center">
                                        <div>
                                            <span class="mb-2 block ">
                                                <i class="pi pi-paperclip"></i>
                                                Drop files here
                                            </span>
                                            <span class="mb-2 block text-base font-medium text-[#6B7280]">
                                                Or
                                            </span>
                                            <span
                                                class="inline-flex rounded border border-[#e0e0e0] py-2 px-7 text-base font-medium ">
                                                Browse
                                            </span>
                                            <p v-if="formVals.coi">
                                                Selected File:
                                                {{ formVals.coi.name }}
                                            </p>
                                        </div>
                                    </label>
                                    <Error v-if="errors.step3.coi" :message="errors.step3.coi" />
                                </div>
                            </div>

                            <!-- Navigation BaseButtons -->
                            <div class="flex justify-between space-x-4 w-full mt-4">
                                <BaseButton label="Previous" class="p-8" :action="() => handlePrev()" />
                                <BaseButton label="Next" class="p-8" :action="() => handleNext()" />
                            </div>
                        </div>
                    </div>

                    <div v-if="currentStep === 4">
                        <div>
                            <!-- Step Indicator -->
                            <ul class="steps w-full">
                                <li data-content="✓" class="step step-success"></li>
                                <li data-content="✓" class="step step-success"></li>
                                <li data-content="✓" class="step step-success"></li>
                            </ul>

                            <!-- File Upload Section -->
                            <div class="mb-6 pt-4">
                                <label class="mb-5 block text-xl font-semibold ">
                                    Company PIN certificate (upload copy)
                                </label>
                                <div class="mb-8">
                                    <input type="file" name="company_pin" id="file3" class="sr-only"
                                        @change="handleFileChange" />
                                    <label for="file3"
                                        class="relative flex min-h-[200px] items-center justify-center rounded-md border border-dashed border-[#e0e0e0] p-12 text-center">
                                        <div>
                                            <span class="mb-2 block ">
                                                <i class="pi pi-paperclip"></i>
                                                Drop files here
                                            </span>
                                            <span class="mb-2 block text-base font-medium text-[#6B7280]">
                                                Or
                                            </span>
                                            <span
                                                class="inline-flex rounded border border-[#e0e0e0] py-2 px-7 text-base font-medium ">
                                                Browse
                                            </span>
                                            <p v-if="formVals.company_pin">
                                                Selected File:
                                                {{ formVals.company_pin.name }}
                                            </p>
                                        </div>
                                    </label>
                                    <Error v-if="errors.step4.company_pin" :message="errors.step4.company_pin" />
                                </div>
                            </div>

                            <!-- Navigation BaseButtons -->
                            <div class="flex justify-between space-x-4 w-full mt-4">
                                <BaseButton label="Previous" class="p-8" :action="() => handlePrev()" />
                                <BaseButton label="Next" class="p-8" :action="() => handleNext()" />
                            </div>
                        </div>
                    </div>
                </div>
                <div className="flex justify-center items-center mt-6">
                    <Link href="/tourism-operator/auth/login" target="_blank"
                        className="inline-flex items-center font-bold  hover:text-[#EF434A] text-xs text-center">
                    </Link>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref, inject } from "vue";
import { useRouter } from "vue-router";
import axios from "axios";

import Swal from "sweetalert2";

import Error from "../../components/Errors/Error.vue";
import BaseButton from "../../components/Buttons/BaseButton.vue";
const motionPresets = inject("motionPresets")

const router = useRouter();
const formValInit = {
    company_name: "",
    contact_number: "",
    email: "",
    password: "",
    password_confirmation: "",
    coi: null,
    company_pin: null,
};

const currentStep = ref(1);
const formVals = ref(formValInit);
const errors = ref({
    step1: {},
    step2: {},
    step3: {},
    step4: {},
});

const validateStep = (step, formValues) => {
    let stepErrors = {};
    switch (step) {
        case 1:
            stepErrors = validateStep1Fields(formValues);
            break;
        case 2:
            stepErrors = validateStep2Fields(formValues);
            break;
        case 3:
            stepErrors = validateStep3Fields(formValues);
            break;
        case 4:
            stepErrors = validateStep4Fields(formValues);
            break;
        default:
    }
    return stepErrors;
};

const handleNext = (e) => {
    if (currentStep.value === 4) {
        submit();
        return;
    }
    const currentStepErrors = validateStep(currentStep.value, formVals.value);
    if (Object.keys(currentStepErrors).length === 0) {
        currentStep.value++;
    } else {
        errors.value[`step${currentStep.value}`] = currentStepErrors;
    }
};

const handlePrev = (e) => {
    currentStep.value--;
};

const handleFormChange = (e) => {
    const { name, value } = e.target;
    formVals.value[name] = value;
};

const handleFileChange = (e) => {
    formVals.value[e.target.name] = e.target.files[0];
};

const submit = async (e) => {
    const formDataToSend = new FormData();
    Object.keys(formVals.value).forEach((key) => {
        formDataToSend.append(key, formVals.value[key]);
    });

    try {
        const response = await axios.post(
            "/register/tourism-operator",
            formDataToSend,
            {
                headers: {
                    "Content-Type": "multipart/form-data",
                },
            },
        );
        Swal.fire({
            text: "Your account has been created. You will receive a review update via email.",
            icon: "success",
            confirmBaseButtonText: "Close",
            confirmBaseButtonColor: "#0f6566",
        });
        router.push("/");
    } catch (error) {
        Swal.fire({
            text: error.response.data.message || "Error creating account",
            icon: "error",
            confirmBaseButtonText: "Close",
            confirmBaseButtonColor: "#425C59",
        });
    }
};

const validateStep1Fields = (values) => {
    const step1Errors = {};
    const mailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    const contactNumberRegex = /^\+?[0-9]{1,3}-?[0-9]{3,14}$/;

    if (!values.company_name) {
        step1Errors.company_name = "Company is required";
    }
    if (!values.email) {
        step1Errors.email = "Email is required";
    } else if (!mailRegex.test(values.email)) {
        step1Errors.email = "Email is invalid";
    }
    if (!values.contact_number) {
        step1Errors.contact_number = "Contact number required";
    } else if (!contactNumberRegex.test(values.contact_number)) {
        step1Errors.contact_number = "Number is invalid";
    }
    return step1Errors;
};

const validateStep2Fields = (values) => {
    const step2Errors = {};
    if (!values.password) {
        step2Errors.password = "Please set a password";
    } else if (values.password !== values.password_confirmation) {
        step2Errors.password_confirmation = "Passwords don't match";
    } else if (values.password.length < 8) {
        step2Errors.password = "Please use at least 8 characters";
    }
    return step2Errors;
};

const validateStep3Fields = (values) => {
    const step3Errors = {};
    if (!values.coi) {
        step3Errors.coi = "Please upload COI";
    }
    return step3Errors;
};

const validateStep4Fields = (values) => {
    const step4Errors = {};
    if (!values.company_pin) {
        step4Errors.company_pin = "Please upload PIN";
    }
    return step4Errors;
};
</script>

<style scoped></style>
