<template>
    <Table
        :headers="['NAME', 'ADM', 'CLASS', 'GUARDIAN', 'ACTION']"
        title="All Students"
        v-model:query="searchQuery"
        :rows="studentData?.length"
    >
        <template v-slot:actions>
            <SmallButton
                icon="pi pi-plus"
                :action="() => showModal('addflight')"
            ></SmallButton>

            <Button icon="pi pi-print" class="mr-2" severity="secondary" />
            <Button icon="pi pi-upload" severity="secondary"
        /></template>
        <template v-slot:content>
            <tr v-for="(student, index) in studentData" :key="index">
                <td class="p-2 whitespace-nowrap">
                    <div class="flex items-center">
                        <div class="w-10 h-10 flex-shrink-0 mr-2 sm:mr-3">
                            <img
                                class="rounded-full"
                                src="https://raw.githubusercontent.com/cruip/vuejs-admin-dashboard-template/main/src/images/user-36-05.jpg"
                                width="40"
                                height="40"
                                alt="Alex Shatov"
                            />
                        </div>
                        <div class="text-start">
                            {{ student.first_name }}
                            {{ student.second_name }}
                        </div>
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-left">{{ student.admission }}</div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="ttext-start text-green-500">
                        {{ student.class?.level }}-
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-center">
                        {{ student.guardian_email }}
                    </div>
                </td>
                <td class="p-2 whitespace-nowrap">
                    <div class="text-center">
                        <SmallButton
                            classes="border border-blue-500 border-dotted px-2 text-sm bg-red-500"
                            button-text="Edit"
                            :action="() => showModal(student.id)"
                        />
                    </div>
                </td>
                <dialog
                    id="{`my_modal_${index}`}"
                    class="modal modal-bottom sm:modal-middle"
                >
                    <div class="modal-box dark:text-slate-400 dark:bg-sky-950">
                        <h3 class="font-bold">Edit Flight Info</h3>
                        <p class="py-4 text-xs">Press ESC key to close</p>
                        <div class="modal-action">
                            <form method="dialog" class="flex flex-col gap-2">
                                <button
                                    class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2"
                                >
                                    ✕
                                </button>
                                <div class="md:grid grid-cols-2 space-x-4">
                                    <div>
                                        <span
                                            class="w-full text-center font-bold"
                                            >Edit Flight Info</span
                                        >
                                        <label
                                            for="origin"
                                            class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                                        >
                                            Origin
                                        </label>
                                        <Select
                                            class="text-sm"
                                            makeAnimated
                                            cacheOptions
                                            :options="selectOptions"
                                            id="origin"
                                            isSearchable
                                            placeholder="Search Origin Airport"
                                            :noOptionsMessage="() => 'No data'"
                                            @change="setOrigin"
                                        />
                                        <label
                                            for="destination"
                                            class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                                        >
                                            Destination
                                        </label>
                                        <Select
                                            class="text-sm"
                                            makeAnimated
                                            cacheOptions
                                            :options="selectOptions"
                                            id="destination"
                                            isSearchable
                                            placeholder="Search Destination Airport"
                                            :noOptionsMessage="() => 'No Data'"
                                            @change="setDestination"
                                        />
                                        <label
                                            for="available_seats"
                                            class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                                        >
                                            Seats Available
                                        </label>
                                        <input
                                            id="available_seats"
                                            name="available_seats"
                                            type="number"
                                            class="input input-bordered input-sm w-full max-w-xs"
                                            @change="handleChange"
                                        />
                                        <label
                                            for="price"
                                            class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                                        >
                                            Price Per Seat
                                            <p class="font-bold text-lg">
                                                KES {{ flightVals.price }}
                                            </p>
                                        </label>
                                        <input
                                            type="range"
                                            min="0"
                                            max="20000"
                                            id="price"
                                            step="100"
                                            name="price"
                                            v-model="flightVals.price"
                                            class="range range-xs my-2 range-info"
                                            @change="handleChange"
                                        />
                                        <label
                                            for="departure_time"
                                            class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                                        >
                                            Departure Time
                                        </label>
                                        <Datepicker
                                            v-model="setStartDate"
                                            showIcon
                                            :minDate="new Date()"
                                            fluid
                                            iconDisplay="input"
                                            timeOnly
                                        >
                                            <template #inputicon="slotProps">
                                                <i
                                                    class="pi pi-clock"
                                                    @click="
                                                        slotProps.clickCallback
                                                    "
                                                />
                                            </template>
                                        </Datepicker>

                                        <label
                                            for="arrival_time"
                                            class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                                        >
                                            Arrival Time
                                        </label>

                                        <Datepicker
                                            v-model="setEndDate"
                                            showIcon
                                            :minDate="new Date()"
                                            fluid
                                            iconDisplay="input"
                                            timeOnly
                                        >
                                            <template #inputicon="slotProps">
                                                <i
                                                    class="pi pi-clock"
                                                    @click="
                                                        slotProps.clickCallback
                                                    "
                                                />
                                            </template>
                                        </Datepicker>
                                    </div>
                                    <div>
                                        <span
                                            class="w-full text-center font-bold"
                                            >Edit Aircraft Info</span
                                        >
                                        <label
                                            for="aircraft"
                                            class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                                        >
                                            Aircraft
                                        </label>
                                        <Select
                                            class="text-sm"
                                            makeAnimated
                                            cacheOptions
                                            :options="selectOptionsAircrafts"
                                            id="aircraft"
                                            isSearchable
                                            placeholder="Select Aircraft"
                                            :noOptionsMessage="() => 'No Data'"
                                            @change="setAircraft"
                                        />
                                        <label
                                            for="pilot"
                                            class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                                        >
                                            Pilot
                                        </label>
                                        <Select
                                            class="text-sm"
                                            makeAnimated
                                            cacheOptions
                                            :options="selectOptionsPilots"
                                            id="pilot"
                                            isSearchable
                                            placeholder="Select Pilot"
                                            :noOptionsMessage="() => 'No Data'"
                                            @change="setPilot"
                                        />
                                        <label
                                            for="tour_operator"
                                            class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                                        >
                                            Tourism Operator
                                        </label>
                                        <Select
                                            class="text-sm"
                                            makeAnimated
                                            cacheOptions
                                            :options="
                                                selectOptionsTourOperators
                                            "
                                            id="tour_operator"
                                            isSearchable
                                            placeholder="Select Tour Operator"
                                            :noOptionsMessage="() => 'No Data'"
                                            @change="setTourOperator"
                                        />
                                    </div>
                                </div>
                                <div class="modal-action">
                                    <button class="btn">Close</button>
                                    <button
                                        class="btn"
                                        @click.prevent="
                                            handleflightEdit(flight.id)
                                        "
                                    >
                                        Save
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </dialog>
            </tr>

            <!-- create student -->

            <dialog id="addflight" class="modal">
                <div class="modal-box dark:text-slate-400 dark:bg-sky-950">
                    <h3 class="font-bold">Flight Info</h3>
                    <p class="py-4 text-xs">Press ESC key to close</p>
                    <form method="dialog" class="flex flex-col gap-2">
                        <button
                            class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2"
                        >
                            ✕
                        </button>
                        <div class="md:grid grid-cols-2 space-x-4">
                            <div>
                                <span class="w-full text-center font-bold"
                                    >Flight Info</span
                                >
                                <label
                                    for="origin"
                                    class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                                >
                                    Origin
                                </label>
                                <Select
                                    class="text-sm"
                                    makeAnimated
                                    cacheOptions
                                    :options="selectOptions"
                                    id="origin"
                                    isSearchable
                                    placeholder="Search Origin Airport"
                                    :noOptionsMessage="() => 'No data'"
                                    @change="setOrigin"
                                />
                                <label
                                    for="destination"
                                    class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                                >
                                    Destination
                                </label>
                                <Select
                                    class="text-sm"
                                    makeAnimated
                                    cacheOptions
                                    :options="selectOptions"
                                    id="destination"
                                    isSearchable
                                    placeholder="Search Destination Airport"
                                    :noOptionsMessage="() => 'No Data'"
                                    @change="setDestination"
                                />
                                <label
                                    for="available_seats"
                                    class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                                >
                                    Seats Available
                                </label>
                                <input
                                    id="available_seats"
                                    name="available_seats"
                                    type="number"
                                    class="input input-bordered input-sm w-full max-w-xs"
                                    @change="handleChange"
                                />
                                <label
                                    for="price"
                                    class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                                >
                                    Price Per Seat
                                    <p class="font-bold text-lg">
                                        KES {{ flightVals.price }}
                                    </p>
                                </label>
                                <input
                                    type="range"
                                    min="0"
                                    max="20000"
                                    id="price"
                                    step="100"
                                    name="price"
                                    v-model="flightVals.price"
                                    class="range range-xs my-2 range-info"
                                    @change="handleChange"
                                />
                                <label
                                    for="departure_time"
                                    class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                                >
                                    Departure Time
                                </label>

                                <Datepicker
                                    v-model="StartDate"
                                    showIcon
                                    :minDate="new Date()"
                                    fluid
                                    iconDisplay="input"
                                    timeOnly
                                >
                                    <template #inputicon="slotProps">
                                        <i
                                            class="pi pi-clock"
                                            @click="slotProps.clickCallback"
                                        />
                                    </template>
                                </Datepicker>

                                <label
                                    for="arrival_time"
                                    class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                                >
                                    Arrival Time
                                </label>
                                <Datepicker
                                    v-model="endDate"
                                    showIcon
                                    :minDate="new Date()"
                                    fluid
                                    iconDisplay="input"
                                    timeOnly
                                >
                                    <template #inputicon="slotProps">
                                        <i
                                            class="pi pi-clock"
                                            @click="slotProps.clickCallback"
                                        />
                                    </template>
                                </Datepicker>
                            </div>
                            <div>
                                <span class="w-full text-center font-bold"
                                    >Aircraft Info</span
                                >
                                <label
                                    for="aircraft"
                                    class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                                >
                                    Aircraft
                                </label>
                                <Select
                                    class="text-sm"
                                    makeAnimated
                                    cacheOptions
                                    :options="selectOptionsAircrafts"
                                    id="aircraft"
                                    isSearchable
                                    placeholder="Select Aircraft"
                                    :noOptionsMessage="() => 'No Data'"
                                    @change="setAircraft"
                                />
                                <label
                                    for="pilot"
                                    class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                                >
                                    Pilot
                                </label>
                                <Select
                                    class="text-sm"
                                    makeAnimated
                                    cacheOptions
                                    :options="selectOptionsPilots"
                                    id="pilot"
                                    isSearchable
                                    placeholder="Select Pilot"
                                    :noOptionsMessage="() => 'No Data'"
                                    @change="setPilot"
                                />
                                <label
                                    for="tour_operator"
                                    class="block mt-2 text-xs font-semibold text-gray-800 uppercase"
                                >
                                    Tourism Operator
                                </label>
                                <Select
                                    class="text-sm"
                                    makeAnimated
                                    cacheOptions
                                    :options="selectOptionsTourOperators"
                                    id="tour_operator"
                                    isSearchable
                                    placeholder="Select Tour Operator"
                                    :noOptionsMessage="() => 'No Data'"
                                    @change="setTourOperator"
                                />
                            </div>
                        </div>
                        <div class="modal-action">
                            <button class="btn">Close</button>
                            <button class="btn" @click.prevent="handleSubmit">
                                Save
                            </button>
                        </div>
                    </form>
                </div>
            </dialog>
        </template>
        <!-- end create student -->
    </Table>
</template>
<script setup>
import { ref, onMounted } from "vue";
import axios from "axios";
import { toast } from "vue3-toastify";
import Datepicker from "@vuepic/vue-Datepicker";
import Swal from "sweetalert2";

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
    try {
        flightVals.value.origin_airport_id = origin.value.value;
        flightVals.value.destination_airport_id = destination.value.value;
        flightVals.value.pilot_id = pilot.value.value;
        flightVals.value.aircraft_id = aircraft.value.value;
        flightVals.value.depart_time = startDate.value;
        flightVals.value.arrival_time = endDate.value;
        flightVals.value.tourism_operator_id = tourOperator.value.value;

        await axios.post("flights", flightVals.value);
        Swal.fire({
            text: "Flight has been created",
            icon: "success",
            confirmButtonText: "Close",
            confirmButtonColor: "#425C59",
        });
        reload.value = !reload.value;
    } catch (error) {
        toast.error("Please fill all form fields");
        console.error("Flight creation error:", error);
        Swal.fire({
            text: "An error occurred",
            icon: "error",
            confirmButtonText: "Close",
            confirmButtonColor: "#425C59",
        });
    }
};

const handleDelete = (id) => {
    Swal.fire({
        title: "Confirm to Delete Item",
        text: "Action is irreversible",
        icon: "warning",
        showCancelButton: true,
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
        text: "Note that if the flight is approved you won't be able to unlist or edit",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "I understand",
        cancelButtonText: "Cancel",
    }).then(async (result) => {
        if (result.isConfirmed) {
            try {
                const response = await axios.post(`flight-list/${id}`);
                toast.success(response.data.message);
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
    selectOptionsAircrafts.value = res.data
        .filter(
            (d) =>
                d.insurance_expiry && new Date(d.insurance_expiry) > new Date(),
        )
        .map((d) => ({
            value: d.id,
            label: `${d.aircraft_type || "Unknown Aircraft Type"}, ${d.registration || "Unknown Registration"}`,
        }));
};

onMounted(() => {
    getOptions();
    getflights();
    getPilots();
    getTourOperators();
    getAircrafts();
});
</script>
