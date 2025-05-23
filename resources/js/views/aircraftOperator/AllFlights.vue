<template>
    <Table :headers="[
        'ORIGIN',
        'DESTINATION',
        'FLIGHT NO.',
        'SEATS',
        'PRICE',
        'DEPART TIME',
        'ARRIVAL TIME',
        'LISTING STATUS',
        'ACTION',
    ]" title="All Flights" v-model:query="searchQuery" :rows="flights?.length">
        <template v-slot:actions>
            <SmallButton icon="pi pi-plus" button-text="Add Flight" :action="() => showModal('addflight')">
            </SmallButton>

            <Button icon="pi pi-print" class="mr-2" severity="secondary" />
            <Button icon="pi pi-upload" severity="secondary" />
        </template>
        <template v-slot:content>
            <tr v-for="(flight, index) in flights" :key="index">
                <td class="p-2 whitespace-nowrap">
                    <div class="flex items-center">
                        <div class="text-start">
                            {{ flight.origin_airport.name }}
                        </div>
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-left">
                        {{ flight.destination_airport.name }}
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-left">
                        {{ flight.flight_no }}
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-start text-green-500">
                        {{ flight.initial_seats }}
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-center">
                        {{ flight.price }}
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-center">
                        {{
                            format(
                                new Date(flight.depart_time),
                                "EEEE do HH:mm ",
                            )
                        }}
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-center">
                        {{
                            format(
                                new Date(flight.arrival_time),
                                "EEEE do HH:mm ",
                            )
                        }}
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-center">

                        <SmallButton v-if="flight.is_approved == 1"
                            classes="border border-blue-500 border-dotted px-2 text-sm bg-emerald-500 text-white w-full"
                            button-text="Flight listed" />
                        <span v-else>
                            <SmallButton v-if="flight.is_listed == 1"
                                classes="border border-blue-500 border-dotted px-2 text-sm bg-yellow text-white w-full"
                                button-text="Pending Approval" />
                            <SmallButton v-else
                                classes="border border-blue-500 border-dotted px-2 text-sm bg-sky-500 text-white w-full"
                                button-text="Request listing" :action="() => handleList(flight.id)" />
                        </span>
                    </div>
                </td>
                <td class="p-2 flex text-center whitespace-nowrap gap-2 ">
                    <SmallButton classes="border border-blue-500 border-dotted px-2 text-sm bg-red-500 text-white"
                        button-text="Edit" :action="() => showModal(flight.id)" />
                </td>

                <dialog :id="flight.id" class="modal">
                    <div class="modal-box dark:text-slate-400 dark:bg-sky-950">
                        <h3 class="font-bold">Edit Flight Information</h3>
                        <p class="py-4 text-xs">Press ESC key to close</p>
                        <form method="dialog" class="flex flex-col gap-2">
                            <button class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2">
                                ✕
                            </button>
                            <div class="md:grid grid-cols-2 space-x-4">
                                <div>
                                    <span class="w-full text-center font-bold">Flight Information</span>
                                    <label for="origin" class="block mt-2 text-xs font-semibold  uppercase">
                                        Origin
                                    </label>
                                    <Select class="text-sm" makeAnimated cacheOptions :options="selectOptions"
                                        id="origin" isSearchable placeholder="Search Origin Airport"
                                        :noOptionsMessage="() => 'No data'" v-model="origin" />
                                    <label for="destination" class="block mt-2 text-xs font-semibold  uppercase">
                                        Destination
                                    </label>
                                    <Select class="text-sm" makeAnimated cacheOptions :options="selectOptions"
                                        id="destination" isSearchable placeholder="Search Destination Airport"
                                        :noOptionsMessage="() => 'No Data'" v-model="destination" />
                                    <label for="available_seats" class="block mt-2 text-xs font-semibold  uppercase">
                                        Seats Available
                                    </label>
                                    <input id="available_seats" type="number"
                                        class="input input-bordered input-sm w-full max-w-xs"
                                        v-model="availableSeats" />
                                    <label for="price" class="block mt-2 text-xs font-semibold  uppercase">
                                        Price Per Seat
                                        <p class="font-bold text-lg">
                                            KES {{ flightVals.price }}
                                        </p>
                                    </label>
                                    <input type="range" min="0" max="20000" id="price" step="100"
                                        v-model="flightVals.price" class="range range-xs my-2 range-info" />
                                    <label for="departure_time" class="block mt-2 text-xs font-semibold  uppercase">
                                        Departure Time
                                    </label>
                                    <input type="datetime-local" v-model="startDate"
                                        class="input input-bordered input-sm w-full max-w-xs" />
                                    <label for="arrival_time" class="block mt-2 text-xs font-semibold  uppercase">
                                        Arrival Time
                                    </label>
                                    <input type="datetime-local" v-model="endDate"
                                        class="input input-bordered input-sm w-full max-w-xs" />
                                </div>
                                <div>
                                    <span class="w-full text-center font-bold">Aircraft Info</span>
                                    <label for="aircraft" class="block mt-2 text-xs font-semibold  uppercase">
                                        Aircraft
                                    </label>
                                    <Select class="text-sm" makeAnimated cacheOptions :options="selectOptionsAircrafts"
                                        id="aircraft" isSearchable placeholder="Select Aircraft"
                                        :noOptionsMessage="() => 'No Data'" v-model="aircraft" />
                                    <label for="pilot" class="block mt-2 text-xs font-semibold  uppercase">
                                        Pilot
                                    </label>
                                    <Select class="text-sm" makeAnimated cacheOptions :options="selectOptionsPilots"
                                        id="pilot" isSearchable placeholder="Select Pilot"
                                        :noOptionsMessage="() => 'No Data'" v-model="pilot" />
                                    <label for="tour_operator" class="block mt-2 text-xs font-semibold  uppercase">
                                        Tourism Operator
                                    </label>
                                    <Select class="text-sm" makeAnimated cacheOptions
                                        :options="selectOptionsTourOperators" id="tour_operator" isSearchable
                                        placeholder="Select Tour Operator" :noOptionsMessage="() => 'No Data'"
                                        v-model="tourOperator" />
                                </div>
                            </div>
                            <div class="modal-action">
                                <button class="btn">Close</button>
                                <button class="btn" @click.prevent="handleEditSubmit">
                                    Update
                                </button>
                            </div>
                        </form>
                    </div>
                </dialog>
            </tr>
        </template>
    </Table>

    <dialog id="addflight" class="modal">
        <div class="modal-box dark:text-slate-400 dark:bg-sky-950">
            <h3 class="font-bold">Flight Info</h3>
            <p class="py-4 text-xs">Press ESC key to close</p>
            <form method="dialog" class="flex flex-col gap-2">
                <button class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2">
                    ✕
                </button>
                <div class="md:grid grid-cols-2 space-x-4">
                    <div>
                        <span class="w-full text-center font-bold">Flight Info</span>
                        <label for="origin" class="block mt-2 text-xs font-semibold  uppercase">
                            Origin
                        </label>
                        <Select class="text-sm" makeAnimated cacheOptions :options="selectOptions" id="origin"
                            isSearchable placeholder="Search Origin Airport" :noOptionsMessage="() => 'No data'"
                            v-model="origin" />
                        <label for="destination" class="block mt-2 text-xs font-semibold  uppercase">
                            Destination
                        </label>
                        <Select class="text-sm" makeAnimated cacheOptions :options="selectOptions" id="destination"
                            isSearchable placeholder="Search Destination Airport" :noOptionsMessage="() => 'No Data'"
                            v-model="destination" />
                        <label for="available_seats" class="block mt-2 text-xs font-semibold  uppercase">
                            Seats Available
                        </label>
                        <input id="available_seats" type="number" class="input input-bordered input-sm w-full max-w-xs"
                            v-model="flightVals.available_seats" />
                        <label for="price" class="block mt-2 text-xs font-semibold  uppercase">
                            Price Per Seat
                            <p class="font-bold text-lg">
                                KES {{ flightVals.price }}
                            </p>
                        </label>
                        <input type="range" min="0" max="20000" id="price" step="100" v-model="flightVals.price"
                            class="range range-xs my-2 range-info" />
                        <label for="departure_time" class="block mt-2 text-xs font-semibold  uppercase">
                            Departure Time
                        </label>
                        <input type="datetime-local" v-model="startDate"
                            class="input input-bordered input-sm w-full max-w-xs" />
                        <label for="arrival_time" class="block mt-2 text-xs font-semibold  uppercase">
                            Arrival Time
                        </label>
                        <input type="datetime-local" v-model="endDate"
                            class="input input-bordered input-sm w-full max-w-xs" />
                    </div>
                    <div>
                        <span class="w-full text-center font-bold">Aircraft Info</span>
                        <label for="aircraft" class="block mt-2 text-xs font-semibold  uppercase">
                            Aircraft
                        </label>

                        <Select :options="selectOptionsAircrafts" id="aircraft" isSearchable
                            placeholder="Start typing..." noOptionsMessage="No Match" v-model="aircraft"
                            class="text-base pl-10 pr-4 py-1 bg-white rounded-lg min-w-[250px]  text-sm" />

                        <label for="pilot" class="block mt-2 text-xs font-semibold  uppercase">
                            Pilot
                        </label>
                        <Select makeAnimated cacheOptions :options="selectOptionsPilots" id="pilot" isSearchable
                            placeholder="Start typing..." :noOptionsMessage="() => 'No Data'" v-model="pilot"
                            class="text-base pl-10 pr-4 py-1 bg-white rounded-lg min-w-[250px]  text-sm" />
                        <label for="tour_operator" class="block mt-2 text-xs font-semibold  uppercase">
                            Tourism Operator
                        </label>
                        <Select class="text-base pl-10 pr-4 py-1 bg-white rounded-lg min-w-[250px]  text-sm"
                            makeAnimated cacheOptions :options="selectOptionsTourOperators" id="tour_operator"
                            isSearchable placeholder="Start typing..." :noOptionsMessage="() => 'No Data'"
                            v-model="tourOperator" />
                    </div>
                </div>
                <div class="modal-action">
                    <button class="btn">Close</button>
                    <button class="btn" @click="handleSubmit">Save</button>
                </div>
            </form>
        </div>
    </dialog>
</template>

<script setup>
import { ref, onMounted, watch } from "vue";
import axios from "axios";
import { toast } from "vue3-toastify";
import Swal from "sweetalert2";
import SmallButton from "../../components/Buttons/Small.vue";
import Table from "../../components/Tables/MainTable.vue";
import Datepicker from "vuejs3-datepicker";
import Select from "vue-select";
import "vue-select/dist/vue-select.css";
import { format } from "date-fns";
import { useMainStore } from "../../stores";


const mainStore = useMainStore();

const CreateFlightInit = {
    origin_airport_id: "",
    pilot_id: "",
    destination_airport_id: "",
    depart_time: "",
    available_seats: "",
    entire_flight: "",
    arrival_time: "",
    price: "",
    aircraft_id: "",
    age: "",
    number_of_seats: "",
    aircraft_range: "",
    aircraft_code: "",
    speed: "",
    is_approved: "",
};

const searchQuery = ref("");

const flightVals = ref({ ...CreateFlightInit });
const selectOptions = ref([]);
const reload = ref(false);
const flights = ref([]);
const origin = ref();
const destination = ref();
const aircraft = ref();
const pilot = ref();
const tourOperator = ref();
const startDate = ref(new Date());
const endDate = ref(new Date());
const selectOptionsAircrafts = ref([]);
const selectOptionsPilots = ref([]);
const selectOptionsTourOperators = ref([]);

const getflights = async () => {
    const res = await axios.get("flights-all/empty_param");
    flights.value = res.data;
};

const handleChange = (event) => {
    const { name, value } = event.target;
    flightVals.value[name] = value;
};

const handleSubmit = async () => {

    if (!origin.value) {
        toast.error("Please select an origin airport");
        return;
    }

    if (!destination.value) {
        toast.error("Please select a destination airport");
        return;
    }

    if (!startDate.value) {
        toast.error("Please select a departure time");
        return;
    }
    if (!endDate.value) {
        toast.error("Please select an arrival time");
        return;
    }
    if (startDate.value >= endDate.value) {
        toast.error("Departure time must be before arrival time");
        return;
    }
    if (flightVals.value.available_seats <= 0) {
        toast.error("Available seats must be greater than 0");
        return;
    }
    if (flightVals.value.price <= 0) {
        toast.error("Price must be greater than 0");
        return;
    }

    if (flightVals.value.available_seats > 200) {
        toast.error("Available seats must be less than 200");
        return;
    }
    if (!aircraft.value) {
        toast.error("Please select an aircraft");
        return;
    }
    if (!pilot.value) {
        toast.error("Please select a pilot");
        return;
    }

    //optionalise tour operator
    if (!flightVals.value.tourism_operator_id) {
        delete flightVals.value.tourism_operator_id;
    }


    flightVals.value.origin_airport_id = origin.value.value;
    flightVals.value.destination_airport_id = destination.value.value;
    flightVals.value.pilot_id = pilot.value.value;
    flightVals.value.aircraft_id = aircraft.value.value;
    flightVals.value.depart_time = startDate.value;
    flightVals.value.arrival_time = endDate.value;
    flightVals.value.tourism_operator_id = tourOperator.value?.value || "";

    console.log("flightVals", flightVals.value);

    await axios.post("flights", flightVals.value);
    Swal.fire({
        text: "Flight has been created",
        icon: "success",
        confirmButtonText: "Close",
        confirmButtonColor: "#0e5b5c",
    });
    reload.value = !reload.value;

};

const handleDelete = (id) => {
    Swal.fire({
        title: "Confirm to Delete Item",
        text: "Action is irreversible",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#d33",
        cancelButtonColor: "#0e5b5c",
        confirmButtonText: "Yes",
        cancelButtonText: "No",
    }).then(async (result) => {
        if (result.isConfirmed) {
            try {
                const response = await axios.post(`flight-delete/${id}`);
                toast.success(response.data.message);
                reload.value = !reload.value;
            } catch (err) {
                toast.error("Not enough permission");
            }
        }
    });
};

const handleList = (id) => {
    Swal.fire({
        title: "Confirm to List",
        text: "Note that if the flight is approved, you won't be able to unlist or edit without wingit reviewing the flight",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#0e5b5c",
        confirmButtonText: "I understand",
        cancelButtonText: "Cancel",
    }).then(async (result) => {
        if (result.isConfirmed) {
            try {
                const response = await axios.post(`flight-list/${id}`);
                toast.info(response.data.message);
                reload.value = !reload.value;
            } catch (err) {
                reload.value = !reload.value;
            }
        }
    });
};

const handleflightEdit = async (id) => {
    flightVals.value.origin_airport_id = origin.value?.value || "";
    flightVals.value.destination_airport_id = destination.value?.value || "";
    flightVals.value.pilot_id = pilot.value?.value || "";
    flightVals.value.aircraft_id = aircraft.value?.value || "";
    flightVals.value.depart_time = startDate.value;
    flightVals.value.arrival_time = endDate.value;
    flightVals.value.tourism_operator_id = tourOperator.value?.value || "";

    await axios.post(`flight-update/${id}`, flightVals.value);
    reload.value = !reload.value;
};

const getOptions = async () => {
    const res = await axios.get("airports");
    selectOptions.value = res.data.map((d) => ({
        value: d.id,
        label: d.name,
    }));
};

const getPilots = async () => {
    const res = await axios.get("pilots");
    selectOptionsPilots.value = res.data.map((p) => ({
        value: p.id,
        label: p.name,
    }));
};

const getTourOperators = async () => {
    const res = await axios.get("tour-operators");
    selectOptionsTourOperators.value = res.data.map((d) => ({
        value: d.id,
        label: d.company_name,
    }));
};

const getAircrafts = async () => {
    const res = await axios.get("aircrafts");

    console.log("aircrafts", res);
    selectOptionsAircrafts.value = res.data.map((d) => ({
        value: d.id,
        label: d.registration,
    }));
};

const showModal = (modalId) => {
    document.getElementById(modalId).showModal();
};

watch([searchQuery, reload], () => {
    getflights();
    fetchDashData();
    mainStore.startStoreServices()
});
const fetchDashData = async () => {
    const response = await axios.get("/dashdata-airop");
    mainStore.setDashDataAirOp(response.data);
};

onMounted(() => {
    getOptions();
    getflights();
    getPilots();
    getTourOperators();
    getAircrafts();
    fetchDashData();
    mainStore.startStoreServices();
});
</script>
