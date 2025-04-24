<template>
    <div>
        <div
            className="min-h-screen flex flex-col items-center justify-ceter bg-base bg-[url('../assets/searchpg.jpg')] p-2">
            <div v-motion="motionPresets.fadeDown()"
                className="w-full flex justify-center mt-24 mb-6 md:mt-32 text-gray-50 font-medium text-lg md:mb-10 uppercase">
                AIRCRAFT OPERATOR
            </div>
            <div v-motion="motionPresets.fadeUp()"
                className="relative flex flex-col bg-white bg-opacity-85 shadow-md px-4 sm:px-6 md:px-4 lg:px-4 py-2 md:py-4 rounded-md w-full  max-w-[400px]">
                <div className="font-bold self-center text-xl sm:text-2xl uppercase text-base">
                    signup
                </div>
                <div>
                    <div v-if="currentStep === 1">
                        <div class="flex flex-col mb-3 md:mb-6">
                            <label for="name" class="mb-1 text-xs sm:text-sm tracking-wide  font-semibold">
                                Full Company Name
                            </label>
                            <div class="relative">
                                <div class="inline-flex items-center justify-center absolute left-0 top-0 h-full w-10 ">
                                    <i class="pi pi-building "></i>
                                </div>
                                <input id="name" type="text" name="name" v-model="formVals.name"
                                    class="text-sm sm:text-base placeholder-gray-500 pl-10 pr-4 rounded-full border border-gray-400 w-full py-2 focus:outline-none focus:border-green-800"
                                    placeholder="Registered Company Name" />
                            </div>
                            <Error v-if="errors.step1.name" :message="errors.step1.name" />
                        </div>

                        <div class="flex flex-col mb-3 md:mb-6">
                            <label for="email" class="mb-1 text-xs sm:text-sm tracking-wide  font-semibold">
                                E-Mail Address:
                            </label>
                            <div class="relative">
                                <div class="inline-flex items-center justify-center absolute left-0 top-0 h-full w-10 ">
                                    <i class="pi pi-envelope"></i>
                                </div>
                                <input id="email" type="email" name="email" v-model="formVals.email"
                                    class="text-sm sm:text-base placeholder-gray-500 pl-10 pr-4 rounded-full border border-gray-400 w-full py-2 focus:outline-none focus:border-green-800"
                                    placeholder="E-Mail Address" />
                            </div>
                            <Error v-if="errors.step1.email" :message="errors.step1.email" />
                        </div>

                        <div class="flex flex-col mb-3 md:mb-6">
                            <label for="contact_number" class="mb-1 text-xs sm:text-sm tracking-wide  font-semibold">
                                Contact number
                            </label>
                            <div class="relative">
                                <div class="inline-flex items-center justify-center absolute left-0 top-0 h-full w-10 ">
                                    <i class="pi pi-phone"></i>
                                </div>
                                <div class="flex flex-row items-center relative">
                                    <div class="absolute left-8 ">
                                        <CountryCode v-model="formVals.country_code" />
                                    </div>
                                    <input id="contact_number" type="tel" name="contact_number"
                                        v-model="formVals.contact_number"
                                        class="text-sm sm:text-base placeholder-gray-500 pl-10 pr-4 rounded-full border border-gray-400 w-full py-2 focus:outline-none focus:border-green-800 ml-36" />
                                </div>
                            </div>
                            <Error v-if="errors.step1.contact_number" :message="errors.step1.contact_number" />
                        </div>

                        <div class="flex justify-between space-x-4 w-full">
                            <BaseButton label="Next" class="p-8" :action="() => handleNext()" />
                        </div>
                    </div>

                    <div v-if="currentStep === 2">
                        <ul class="steps w-full">
                            <li data-content="✓" class="step step-success text-white"></li>
                            <li data-content="✓" class="step"></li>
                            <li data-content="✓" class="step"></li>
                            <li data-content="✓" class="step"></li>
                        </ul>

                        <div class="flex flex-col mb-3 md:mb-6"></div>
                        <div class="flex flex-col mb-3 md:mb-6"></div>

                        <div class="flex flex-col mb-3 md:mb-6">
                            <label for="password" class="mb-1 text-xs sm:text-sm tracking-wide  font-semibold">
                                Password:
                            </label>
                            <div class="relative">
                                <div class="inline-flex items-center justify-center absolute left-0 top-0 h-full w-10 ">
                                    <i class="pi pi-lock"></i>
                                </div>
                                <input id="password" type="password" name="password" v-model="formVals.password"
                                    class="text-sm sm:text-base placeholder-gray-500 pl-10 pr-4 rounded-full border border-gray-400 w-full py-2 focus:outline-none focus:border-green-800"
                                    placeholder="Password" />
                            </div>
                            <Error v-if="errors.step2.password" :message="errors.step2.password" />
                        </div>

                        <div class="flex flex-col mb-3 md:mb-6">
                            <label for="password_confirmation"
                                class="mb-1 text-xs sm:text-sm tracking-wide  font-semibold">
                                Confirm Password:
                            </label>
                            <div class="relative">
                                <div class="inline-flex items-center justify-center absolute left-0 top-0 h-full w-10 ">
                                    <i class="pi pi-check-circle text-xl"></i>
                                </div>
                                <input id="password_confirmation" type="password" name="password_confirmation"
                                    v-model="formVals.password_confirmation"
                                    class="text-sm sm:text-base placeholder-gray-500 pl-10 pr-4 rounded-full border border-gray-400 w-full py-2 focus:outline-none focus:border-green-800"
                                    placeholder="Confirm Password" />
                            </div>
                            <Error v-if="errors.step2.password_confirmation"
                                :message="errors.step2.password_confirmation" />
                        </div>

                        <div class="flex justify-between space-x-4 w-full">
                            <BaseButton label="Previous" class="p-8" :action="() => handlePrev()" />
                            <BaseButton label="next" class="p-8" :action="() => handleNext()" />
                        </div>
                    </div>

                    <div v-if="currentStep === 3">
                        <!-- Step 3 Fields -->
                        <div>
                            <ul class="steps w-full">
                                <li data-content="✓" class="step step-success"></li>
                                <li data-content="✓" class="step step-success"></li>
                                <li data-content="✓" class="step"></li>
                                <li data-content="✓" class="step"></li>
                            </ul>

                            <div class="mb-6 pt-4">
                                <label class="mb-5 block text-xl font-semibold ">
                                    Certificate of incorporation (Upload a <span class="text-red-500">pdf</span>
                                    copy)
                                </label>

                                <div class="mb-8">
                                    <input type="file" name="coi_doc" id="file1" class="sr-only"
                                        @change="handleFileChange" />
                                    <label for="file1"
                                        class="relative flex h-100 items-center justify-center rounded-md border border-dashed border-[#e0e0e0] p-6 text-center">
                                        <div>
                                            <span class="mb-2 block ">
                                                <i class="pi pi-paperclip"></i>
                                                Drop files here
                                            </span>
                                            <span class="mb-2 block text-base font-medium text-[#6B7280]">Or</span>
                                            <span
                                                class="inline-flex rounded border border-[#e0e0e0] py-2 px-7 text-base font-medium ">
                                                Browse
                                            </span>
                                            <p v-if="formVals.coi_doc">
                                                Selected File:
                                                {{ formVals.coi_doc.name }}
                                            </p>
                                        </div>
                                    </label>
                                    <Error v-if="errors.step3.coi_doc" :message="errors.step3.coi_doc" />
                                </div>
                            </div>

                            <div class="flex justify-between space-x-4 w-full mt-4">
                                <BaseButton label="Previous" class="p-8" :action="() => handlePrev()" />
                                <BaseButton label="next" class="p-8" :action="() => handleNext()" />
                            </div>
                        </div>
                    </div>

                    <div v-if="currentStep === 4">
                        <div>
                            <ul class="steps w-full">
                                <li data-content="✓" class="step step-success"></li>
                                <li data-content="✓" class="step step-success"></li>
                                <li data-content="✓" class="step step-success"></li>
                                <li data-content="✓" class="step"></li>
                            </ul>

                            <div class="mb-6 pt-4">
                                <label class="mb-5 block text-xl font-semibold ">
                                    AOC document (Upload a <span class="text-red-500">pdf</span> copy, and provide
                                    expiry date)
                                </label>

                                <div class="mb-8">
                                    <input type="file" name="AOC_doc" id="file2" class="sr-only"
                                        @change="handleFileChange" />
                                    <label for="file2"
                                        class="relative flex h-100 items-center justify-center rounded-md border border-dashed border-[#e0e0e0] p-6 text-center">
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
                                            <p v-if="formVals.AOC_doc">
                                                Selected File:
                                                {{ formVals.AOC_doc.name }}
                                            </p>
                                        </div>
                                    </label>
                                    <Error v-if="errors.step4.AOC_doc" :message="errors.step4.AOC_doc" />
                                </div>
                            </div>

                            <div class="flex flex-col mb-3 md:mb-6">
                                <label for="AOC_expiry_date"
                                    class="mb-1 text-xs sm:text-sm tracking-wide  font-semibold">
                                    AOC Expiry date
                                </label>
                                <div class="relative">
                                    <div
                                        class="inline-flex items-center justify-center absolute left-0 top-0 h-full w-10 ">
                                        <i class="pi pi-clock"></i>
                                    </div>

                                    <input id="AOC_expiry_date" type="date" name="AOC_expiry_date"
                                        class="text-sm sm:text-base placeholder-gray-500 pl-10 pr-4 rounded-full border border-gray-400 w-full py-2 focus:outline-none focus:border-green-800"
                                        v-model="formVals.AOC_expiry_date" />
                                </div>
                                <Error v-if="errors.step4.AOC_expiry_date" :message="errors.step4.AOC_expiry_date" />
                            </div>

                            <div class="flex justify-between space-x-4 w-full mt-4">
                                <BaseButton label="Previous" class="p-8" :action="() => handlePrev()" />
                                <BaseButton label="Next" class="p-8" :action="() => handleNext()" />
                            </div>
                        </div>
                    </div>

                    <div v-if="currentStep === 5">
                        <div>
                            <ul class="steps w-full">
                                <li data-content="✓" class="step step-success"></li>
                                <li data-content="✓" class="step step-success"></li>
                                <li data-content="✓" class="step step-success"></li>
                                <li data-content="✓" class="step step-success"></li>
                            </ul>

                            <div class="mb-6 pt-4">
                                <label class="mb-5 block text-xl font-semibold ">
                                    Company PIN certificate (Upload a <span class="text-red-500">pdf</span> copy)
                                </label>

                                <div class="mb-8">
                                    <input type="file" name="company_pin" id="file3" class="sr-only"
                                        @change="handleFileChange" />
                                    <label for="file3"
                                        class="relative flex h-100 items-center justify-center rounded-md border border-dashed border-[#e0e0e0] p-6 text-center">
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
                                    <Error v-if="errors.step5.company_pin" :message="errors.step5.company_pin" />
                                </div>
                            </div>

                            <div class="flex justify-between space-x-4 w-full mt-4">
                                <BaseButton label="Previous" class="p-8" :action="() => handlePrev()" />
                                <BaseButton label="Submit" class="p-8" :action="() => handleNext()" />
                            </div>
                        </div>
                    </div>
                </div>
                <div className="flex justify-center items-center mt-2">
                    <a href="/tourism-operator/auth/login" target="_blank"
                        className="inline-flex items-center font-bold  hover:text-[#EF434A] text-xs text-center">
                    </a>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref, inject, watch } from "vue";
import axios from "axios";
import Swal from "sweetalert2";
import Error from "../../components/Errors/Error.vue";
import CountryCode from "../../components/countries/CountryCodes.vue";
import BaseButton from "../../components/Buttons/BaseButton.vue";
import { useRouter } from "vue-router";
const motionPresets = inject("motionPresets")
const router = useRouter()
const formValInit = {
    name: "",
    username: "",
    country: "",
    country_code: "",
    email: "",
    password: "",
    password_confirmation: "",
    contact_number: "",
    coi_doc: null,
    AOC_doc: null,
    AOC_expiry_date: "",
    company_pin: null,
};

const currentStep = ref(1);
const formVals = ref({ ...formValInit });

const errors = ref({
    step1: {},
    step2: {},
    step3: {},
    step4: {},
    step5: {},
});

const validateStep = (step) => {
    let stepErrors = {};

    if (step === 1) {
        stepErrors = validateStep1Fields(formVals.value);
    } else if (step === 2) {
        stepErrors = validateStep2Fields(formVals.value);
    } else if (step === 3) {
        stepErrors = validateStep3Fields(formVals.value);
    } else if (step === 4) {
        stepErrors = validateStep4Fields(formVals.value);
    } else if (step === 5) {
        stepErrors = validateStep5Fields(formVals.value);
    }

    return stepErrors;
};


const faAngleLeft = `<i class="pi pi-angle-left"></i>`;
const faAngleRight = `<i class="pi pi-angle-right"></i>`;

const handleNext = () => {
    const currentStepErrors = validateStep(currentStep.value);
    console.log("currentStep", currentStep);
    if (currentStep.value === 5) {
        handleSubmit();
        return;
    }
    if (Object.keys(currentStepErrors).length === 0) {
        currentStep.value += 1;
    } else {
        errors.value[`step${currentStep.value}`] = currentStepErrors;
    }
};

const handlePrev = () => {
    currentStep.value -= 1;
};

const handleFileChange = (e) => {
    const name = e.target.name;
    formVals.value[name] = e.target.files[0];
};

const handleSubmit = () => {
    const formDataToSend = new FormData();
    formDataToSend.append("company_name", formVals.value.name);
    formDataToSend.append(
        "contact_number",
        formVals.value.country_code.code + formVals.value.contact_number,
    );
    formDataToSend.append("country", formVals.value.country_code.name);
    formDataToSend.append("email", formVals.value.email);
    formDataToSend.append("password", formVals.value.password);
    formDataToSend.append(
        "password_confirmation",
        formVals.value.password_confirmation,
    );
    formDataToSend.append("coi_doc", formVals.value.coi_doc);
    formDataToSend.append("AOC_doc", formVals.value.AOC_doc);
    formDataToSend.append("AOC_expiry_date", formVals.value.AOC_expiry_date);
    formDataToSend.append("company_pin", formVals.value.company_pin);

    for (let [key, value] of formDataToSend.entries()) {
        console.log(`${key}: ${value}`);
    }

    axios
        .post("/register/aircraft-operator", formDataToSend, {
            headers: {
                "Content-Type": "multipart/form-data",
            },
        })
        .then(() => {
            Swal.fire({
                text: "Welcome onboard. Your account is now under review to ensure compliance. We will keep in touch via the provided Email/Phone.",
                icon: "success",
                confirmButtonColor: "#0f6566",
            });
            router.push('/');
        })
        .catch((err) => {
            Swal.fire({
                text: err.response.data.message || "An error occurred, please try later",
                icon: "error",
                confirmBaseButtonText: "Close",
                confirmBaseButtonColor: "#425C59",
            });
        });
};

const validateStep1Fields = (values) => {
    const step1Errors = {};
    const mailRegex = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/; // Fixed regex
    const contact_numberRegex = /^\+?[1-9]\d{1,14}([ -]?\d+)*$/;

    if (!values.name) {
        step1Errors.name = "Company name is required";
    }
    if (!values.email) {
        step1Errors.email = "Email is required";
    } else if (!mailRegex.test(values.email)) {
        step1Errors.email = "Email is invalid";
    }
    if (!values.contact_number) {
        step1Errors.contact_number = "Contact number is required";
    } else if (!contact_numberRegex.test(values.contact_number)) {
        step1Errors.contact_number =
            "Number is invalid";
    }

    return step1Errors;
};

const validateStep2Fields = (values) => {
    const step2Errors = {};

    if (!values.password) {
        step2Errors.password = "Please set your password";
    } else if (values.password !== values.password_confirmation) {
        step2Errors.password_confirmation = "Passwords don't match";
    } else if (values.password.length < 8) {
        step2Errors.password = "Please use at least 8 Characters";
    }

    return step2Errors;
};

const validateStep3Fields = (values) => {
    const step3Errors = {};

    if (!values.coi_doc) {
        step3Errors.coi_doc = "Please upload AOC";
    }

    return step3Errors;
};

watch(() => formVals.value.contact_number, () => {
    if (formVals.value.contact_number.startsWith("0")) {
        formVals.value.contact_number = formVals.value.contact_number.slice(1);
    }
});



const validateStep4Fields = (values) => {
    const step4Errors = {};

    if (!values.AOC_doc) {
        step4Errors.AOC_doc = "Please upload insurance";
    }
    if (!values.AOC_expiry_date) {
        step4Errors.AOC_expiry_date = "Expiry date required";
    }

    return step4Errors;
};

const validateStep5Fields = (values) => {
    const step5Errors = {};

    if (!values.company_pin) {
        step5Errors.company_pin = "Please upload COA";
    }

    return step5Errors;
};
</script>

<style scoped>
/* Add your styles here */
</style>
