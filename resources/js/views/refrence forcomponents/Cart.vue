<template>
    <div
        class="flex justify-center pt-20 bg-gradient-to-b from-purple-100 via-cyan-50 to-white"
    >
        <div class="w-full max-w-screen-2xl">
            <div class="my-4">
                <div>
                    <div
                        class="bg-white overflow-hidden border-0 sm:rounded-lg"
                    >
                        <div class="px-4 py-5 sm:px-6 flex space-x-4">
                            <h3
                                class="text-lg font-semibold leading-6 text-gray-900"
                            >
                                Shopping Cart
                            </h3>
                            <span>
                                <RouterLink to="/shop">
                                    <commonButton
                                        buttonText="Continue Shopping"
                                    />
                                </RouterLink>
                            </span>
                        </div>
                        <div class="border-t">
                            <div class="overflow-x-auto">
                                <table
                                    class="min-w-full divide-y divide-gray-200"
                                >
                                    <thead class="bg-gray-50">
                                        <tr>
                                            <th
                                                scope="col"
                                                class="px-2 py-3 sm:px-6 sm:py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                            >
                                                NO.
                                            </th>
                                            <th
                                                scope="col"
                                                class="px-2 py-3 sm:px-6 sm:py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                            >
                                                PIC
                                            </th>
                                            <th
                                                scope="col"
                                                class="px-2 py-3 sm:px-6 sm:py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                            >
                                                Name
                                            </th>
                                            <th
                                                scope="col"
                                                class="px-2 py-3 sm:px-6 sm:py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                            >
                                                Quantity
                                            </th>
                                            <th
                                                scope="col"
                                                class="px-2 py-3 sm:px-6 sm:py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                            >
                                                Price@item
                                            </th>
                                            <th
                                                scope="col"
                                                class="px-2 py-3 sm:px-6 sm:py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                            >
                                                Subtotal
                                            </th>
                                            <th
                                                scope="col"
                                                class="px-2 py-3 sm:px-6 sm:py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                            ></th>
                                        </tr>
                                    </thead>
                                    <tbody
                                        class="bg-white divide-y divide-gray-200"
                                    >
                                        <tr
                                            v-for="(
                                                item, index
                                            ) in data.getCartItems"
                                            :key="item.id"
                                        >
                                            <td
                                                class="px-2 py-4 sm:px-6 sm:py-4 whitespace-nowrap"
                                            >
                                                {{ index + 1 }}
                                            </td>
                                            <td
                                                class="px-2 py-4 sm:px-6 sm:py-4 whitespace-nowrap"
                                            >
                                                <img
                                                    :src="item.image"
                                                    class="h-12 w-12 sm:h-16 sm:w-16 object-cover"
                                                    :alt="item.name"
                                                />
                                            </td>
                                            <td
                                                class="px-2 py-4 sm:px-6 sm:py-4 whitespace-nowrap"
                                            >
                                                {{ item.name }}
                                            </td>
                                            <td
                                                class="px-2 py-4 sm:px-6 sm:py-4 whitespace-nowrap"
                                            >
                                                <div class="flex items-center">
                                                    <button
                                                        @click="
                                                            data.decrementQ(
                                                                item,
                                                            )
                                                        "
                                                        class="text-gray-500 focus:outline-none"
                                                    >
                                                        <svg
                                                            xmlns="http://www.w3.org/2000/svg"
                                                            fill="none"
                                                            viewBox="0 0 24 24"
                                                            stroke-width="1.5"
                                                            stroke="currentColor"
                                                            class="w-6 h-6 sm:w-8 sm:h-8 -mt-2"
                                                        >
                                                            <path
                                                                stroke-linecap="round"
                                                                stroke-linejoin="round"
                                                                d="M15 12H9m12 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z"
                                                            />
                                                        </svg>
                                                    </button>
                                                    <span
                                                        class="mx-2 font-semibold"
                                                        >{{
                                                            item.quantity
                                                        }}</span
                                                    >
                                                    <button
                                                        @click="
                                                            data.incrementQ(
                                                                item,
                                                            )
                                                        "
                                                        class="text-gray-500 focus:outline-none"
                                                    >
                                                        <svg
                                                            xmlns="http://www.w3.org/2000/svg"
                                                            fill="none"
                                                            viewBox="0 0 24 24"
                                                            stroke-width="1.5"
                                                            stroke="currentColor"
                                                            class="w-6 h-6 sm:w-8 sm:h-8 -mt-2"
                                                        >
                                                            <path
                                                                stroke-linecap="round"
                                                                stroke-linejoin="round"
                                                                d="M12 9v6m3-3H9m12 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z"
                                                            />
                                                        </svg>
                                                    </button>
                                                </div>
                                            </td>
                                            <td
                                                class="px-2 py-4 sm:px-6 sm:py-4 whitespace-nowrap"
                                            >
                                                Ksh.{{ item.price }}
                                            </td>
                                            <td
                                                class="px-2 py-4 sm:px-6 sm:py-4 whitespace-nowrap"
                                            >
                                                Ksh.{{
                                                    item.price * item.quantity
                                                }}
                                            </td>
                                            <td
                                                class="px-2 py-4 sm:px-6 sm:py-4 whitespace-nowrap"
                                            >
                                                <button
                                                    @click="
                                                        data.removeFromCart(
                                                            item,
                                                        )
                                                    "
                                                    class="text-red-500 focus:outline-none"
                                                >
                                                    Remove
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td
                                                colspan="5"
                                                class="px-2 py-4 sm:px-6 sm:py-4 whitespace-nowrap text-right text-xs font-medium text-gray-500 uppercase"
                                            >
                                                Total
                                            </td>
                                            <td
                                                class="px-2 py-4 sm:px-6 sm:py-4 whitespace-nowrap text-xs font-medium text-gray-500 uppercase"
                                            >
                                                Ksh.{{
                                                    data.cartItems.reduce(
                                                        (acc, item) =>
                                                            (acc +=
                                                                item.price *
                                                                item.quantity),
                                                        0,
                                                    )
                                                }}
                                            </td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div v-if="data.countCartItems > 0" class="px-4">
                            <h5
                                class="text-lg font-semibold leading-6 text-gray-900"
                            >
                                Payment Options ( Ksh.{{
                                    data.cartItems.reduce(
                                        (acc, item) =>
                                            (acc += item.price * item.quantity),
                                        0,
                                    )
                                }})
                            </h5>
                            <div class="flex flex-wrap justify-center">
                                <div class="flex flex-col m-1">
                                    <label
                                        for="full-name"
                                        class="block text-sm font-medium text-gray-700"
                                        >Full Name</label
                                    >
                                    <p class="text-red-400 text-xs">
                                        {{ ErrorOrderData.full_name }}
                                    </p>
                                    <input
                                        type="text"
                                        id="full-name"
                                        name="full-name"
                                        v-model="OrderData.full_name"
                                        class="mt-1 px-4 py-1 border border-gray-300 rounded-md shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
                                    />
                                </div>
                                <div class="flex flex-col m-1">
                                    <label
                                        for="email"
                                        class="block text-sm font-medium text-gray-700"
                                        >Email</label
                                    >
                                    <p class="text-red-400 text-xs">
                                        {{ ErrorOrderData.email }}
                                    </p>
                                    <input
                                        type="email"
                                        v-model="OrderData.email"
                                        id="email"
                                        name="email"
                                        class="mt-1 px-4 py-1 border border-gray-300 rounded-md shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
                                    />
                                </div>
                                <div class="flex flex-col m-1">
                                    <label
                                        for="location"
                                        class="block text-sm font-medium text-gray-700"
                                        >Location</label
                                    >
                                    <p class="text-red-400 text-xs">
                                        {{ ErrorOrderData.location }}
                                    </p>
                                    <input
                                        type="text"
                                        id="location"
                                        v-model="OrderData.location"
                                        name="location"
                                        class="mt-1 px-4 py-1 border border-gray-300 rounded-md shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
                                    />
                                </div>
                                <div class="flex flex-col m-1">
                                    <label
                                        for="phone"
                                        class="block text-sm font-medium text-gray-700"
                                        >Phone Number</label
                                    >
                                    <p class="text-red-400 text-xs">
                                        {{ ErrorOrderData.phone }}
                                    </p>
                                    <input
                                        type="tel"
                                        id="phone"
                                        v-model="OrderData.phone"
                                        name="phone"
                                        required
                                        class="mt-1 px-4 py-1 border border-gray-300 rounded-md shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
                                    />
                                </div>
                            </div>

                            <ul
                                class="flex justify-center w-full space-x-8 mt-10 mb-12"
                            >
                                <li>
                                    <button
                                        class="bg-gradient-to-r from-emerald-400 to font-semibold bg-emerald-600 px-4 py-1 text-white rounded-full hover:translate-x-1 hover:scale-110 transition duration-200 ease-out"
                                        @click="lnmp"
                                    >
                                        Lipa na Mpesa
                                    </button>
                                </li>
                                <li class="text-gray-400">Or</li>
                                <li>
                                    <commonButton buttonText="Use Card" />
                                </li>
                            </ul>
                            <Transition name="slidedown">
                                <div
                                    v-if="mpesaRef"
                                    class="flex justify-center w-full mb-36"
                                >
                                    <span>
                                        <h5
                                            class="text-lg font-semibold leading-6 text-gray-900"
                                        >
                                            Please enter Mpesa number :
                                        </h5>
                                        <span class="">
                                            <input
                                                @click="useUserNumber()"
                                                id="myCheckbox"
                                                type="checkbox"
                                                class="accent-emerald-500 checked:accent-black me-2 h-4 w-4 rounded-full"
                                            />
                                            <label
                                                for="myCheckbox"
                                                class="cursor-pointer"
                                                >Use the number above</label
                                            >
                                        </span>
                                        <input
                                            class="mx-2 pt-1 border border-gray-200 rounded-md px-2 mt-2"
                                            type="text"
                                            :placeholder="
                                                showMpesaNumberRef
                                                    ? OrderData.phone
                                                    : '07 xxx xxx xxx'
                                            "
                                            v-model="mpesaNumberRef"
                                        />

                                        <button
                                            class="bg-gradient-to-r from-emerald-400 to font-semibold bg-emerald-600 px-4 py-1 text-white rounded-full hover:translate-x-1 hover:scale-110 transition duration-200 ease-out"
                                            @click="processCart()"
                                        >
                                            Pay Now
                                        </button>
                                    </span>
                                </div>
                            </Transition>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { useShoppingStore } from "../stores";
import commonButton from "../components/commonButton.vue";
import { ref } from "vue";
import axios from "axios";
import { toast } from "vue3-toastify";

//get store
const data = useShoppingStore();

const { getCartItems, initiateSTK } = useShoppingStore();

// Assuming getCartItems returns an array of objects with 'id' and 'quantity' properties

const OrderData = ref({
    full_name: "",
    email: "",
    phone: "",
    location: "",
    cart_data: [],
});
const ErrorOrderData = ref({});

const mpesaRef = ref(false);
const mpesaNumberRef = ref(null);
const showMpesaNumberRef = ref(false);

const lnmp = () => {
    mpesaRef.value = true;
};

const useUserNumber = () => {
    showMpesaNumberRef.value = !showMpesaNumberRef.value;
};

const processCart = () => {
    if (showMpesaNumberRef) {
        mpesaNumberRef.value = OrderData.value.phone;
    }

    console.log("first", mpesaNumberRef.value);
    OrderData.value.cart_data = [];
    getCartItems.map((item) => {
        OrderData.value.cart_data.push({
            id: item.id,
            quantity: item.quantity,
        });
    });

    for (const key in OrderData.value) {
        if (!OrderData.value[key]) {
            ErrorOrderData.value[key] = "* Required";
            return;
        }
    }

    axios
        .post("process-order", OrderData.value)
        .then((response) => {
            initiateSTK(mpesaNumberRef);
        })
        .catch((error) => {
            toast.warning(error.response.data.error, {
                transition: toast.TRANSITIONS.ZOOM,
                position: toast.POSITION.TOP_CENTER,
            });
        });
};
</script>

<style>
i {
    cursor: pointer;
}
</style>
