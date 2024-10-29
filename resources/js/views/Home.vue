<template>
    <section>
        <div
            className=" h-screen bg-[url('../assets/hiw.jpg')]  object-cover bg-no-repeat bg-center  flex justify-center items-center "
        >
            <div class="max-w-screen-xl flex justify-center items-center">
                <div
                    className="w-full  h-96 flex justify-between flex-col md:flex-col "
                >
                    <div v-if="mainStore.flights.length > 0" class="">
                        <Carousel
                            :value="mainStore.flights"
                            :numVisible="3"
                            :numScroll="3"
                            :responsiveOptions="responsiveOptions"
                            circular
                            :autoplayInterval="4000"
                        >
                            <template #item="slotProps" class="">
                                <div
                                    class="max-w-sm mx-auto bg-white shadow-lg rounded-lg overflow-hidden re;ative"
                                >
                                
                                    <div
                                        class="flex items-center justify-between bg-teal-600 text-white px-6 py-4"
                                    >
                                        <div class="text-lg font-bold">
                                            Delta Airlines
                                        </div>
                                        <img
                                            src="https://via.placeholder.com/40"
                                            alt="Airline Logo"
                                            class="w-10 h-10 rounded-full"
                                        />
                                    </div>
                                    <div
                                        class="absolute flex justify-center m-auto h-1/3 w-1/2 mr-0 bottom-0 bg-transparent"
                                    >
                                        <div
                                            class="absolute left-0 top-1/3 bg-gold rounded-bl-lg rounded-tr-lg rounded-br-lg px-2 -ml-1 shadow-lg"
                                        >
                                            <p class="font-bold">
                                                <i
                                                    class="pi pi-map-marker me-1 text-sm"
                                                ></i>
                                                <span class="text-xs">{{
                                                    slotProps.data.destination_airport?.city?.toUpperCase()
                                                }}</span>
                                                <br />
                                                <span class="text-sm">
                                                    <i
                                                        class="pi pi-info-circle w-4 mr-2 text-base"
                                                    ></i>
                                                    <small>
                                                        <template
                                                            v-if="
                                                                slotProps.data
                                                                    .has_offer ==
                                                                1
                                                            "
                                                        >
                                                            {{
                                                                calculateDiscount(
                                                                    slotProps
                                                                        .data
                                                                        .price,
                                                                    slotProps
                                                                        .data
                                                                        .offer_price,
                                                                )
                                                            }}% Off
                                                        </template>
                                                        <template v-else>
                                                            Best Price
                                                        </template>
                                                    </small>
                                                </span>
                                            </p>
                                        </div>
                                    </div>  
                                    <div
                                        class="absolute flex justify-center m-auto h-1/3 w-1/2 mr-0 bottom-0 bg-transparent"
                                    >
                                        <div
                                            class="absolute left-0 top-1/3 bg-gold rounded-bl-lg rounded-tr-lg rounded-br-lg px-2 -ml-1 shadow-lg"
                                        >
                                            <p class="font-bold">
                                                <i
                                                    class="pi pi-map-marker me-1 text-sm"
                                                ></i>
                                                <span class="text-xs">{{
                                                    slotProps.data.destination_airport?.city?.toUpperCase()
                                                }}</span>
                                                <br />
                                                <span class="text-sm">
                                                    <i
                                                        class="pi pi-info-circle w-4 mr-2 text-base"
                                                    ></i>
                                                    <small>
                                                        <template
                                                            v-if="
                                                                slotProps.data
                                                                    .has_offer ==
                                                                1
                                                            "
                                                        >
                                                            {{
                                                                calculateDiscount(
                                                                    slotProps
                                                                        .data
                                                                        .price,
                                                                    slotProps
                                                                        .data
                                                                        .offer_price,
                                                                )
                                                            }}% Off
                                                        </template>
                                                        <template v-else>
                                                            Best Price
                                                        </template>
                                                    </small>
                                                </span>
                                            </p>
                                        </div>
                                    </div>
                                    <div>
                                        <div
                                            class="grid grid-cols-2 grid-flow-col gap-4 shadow-sm"
                                        >
                                            <div
                                                class="flex justify-center p-1"
                                            >
                                                <span
                                                    class="bg-cyan-100 text-sm rounded-lg p-1 px-2 flex flex-row text-gray-900"
                                                >
                                                    <i
                                                        class="pi pi-calendar w-5 h-5"
                                                    ></i>
                                                    {{
                                                        format(
                                                            new Date(
                                                                slotProps.data.depart_time,
                                                            ),
                                                            "EEE d, M, y ",
                                                        )
                                                    }}
                                                </span>
                                            </div>
                                            <div
                                                class="flex justify-center p-1"
                                            >
                                                <span
                                                    class="bg-cyan-100 text-sm rounded-lg p-1 px-2 flex flex-row text-gray-900"
                                                >
                                                    <i
                                                        class="pi pi-ticket w-5 h-5"
                                                    ></i>
                                                    <span class="me-1">{{
                                                        slotProps.data
                                                            .available_seats
                                                    }}</span>
                                                    <span>{{
                                                        slotProps.data
                                                            .available_seats > 1
                                                            ? "seats"
                                                            : "seat"
                                                    }}</span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="px-6">
                                        <div>
                                            <table class="w-full">
                                                <tr>
                                                    <td class="text-left">
                                                        <small>
                                                            {{
                                                                format(
                                                                    new Date(
                                                                        slotProps.data.depart_time,
                                                                    ),
                                                                    "h:mm a",
                                                                )
                                                            }}</small
                                                        >
                                                    </td>
                                                    <td></td>
                                                    <td>
                                                        <small>{{
                                                            format(
                                                                new Date(
                                                                    slotProps.data.arrival_time,
                                                                ),
                                                                "h:mm a",
                                                            )
                                                        }}</small>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-left">
                                                        <span
                                                            class="font-semibold uppercase text-xs relative overflow-hidden"
                                                        >
                                                            {{
                                                                slotProps.data.origin_airport?.name.split(
                                                                    " ",
                                                                )[0]
                                                            }}
                                                        </span>
                                                    </td>
                                                    <td
                                                        class="flex justify-center flex-row pt-1.5"
                                                    >
                                                        <div
                                                            class="flex justify-center items-center p-1 relative"
                                                        >
                                                            <div
                                                                class="h-1 w-6 sm:w-8 border-dashed border-base border-t-2 relative"
                                                            >
                                                                <div
                                                                    class="w-2.5 h-2.5 bg-base rounded-full absolute -left-5 -top-1.5 transform translate-x-1/2"
                                                                ></div>
                                                            </div>
                                                        </div>
                                                        <span
                                                            class="h-4 w-4 rounded-full bg-base flex justify-center items-center"
                                                        >
                                                            <i
                                                                class="pi pi-send text-gray-50 h-2.5 w-2.5"
                                                            ></i>
                                                        </span>
                                                        <div
                                                            class="flex justify-center items-center p-1 relative"
                                                        >
                                                            <div
                                                                class="h-1 w-6 sm:w-8 border-dashed border-base border-t-2 relative"
                                                            >
                                                                <div
                                                                    class="w-2.5 h-2.5 bg-base rounded-full absolute -right-1/3 -top-1.5 transform translate-x-1/2"
                                                                ></div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="text-right">
                                                        <span
                                                            class="font-semibold uppercase text-xs relative overflow-hidden"
                                                        >
                                                            {{
                                                                slotProps.data.destination_airport?.name.split(
                                                                    " ",
                                                                )[0]
                                                            }}
                                                        </span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="text-left">
                                            <span
                                                class="text-sm font-light text-left"
                                            >
                                                {{
                                                    slotProps.data
                                                        .aircraft_operator
                                                        ?.company_name
                                                }}
                                            </span>
                                        </div>
                                        <div class="w-full text-center">
                                            <span
                                                v-if="
                                                    slotProps.data.has_offer ==
                                                    1
                                                "
                                                class="text-sm font-normal text-center line-through text-red-500 bg-red-50 p-1 rounded-full"
                                            >
                                                KES
                                                {{
                                                    formatCurrency(
                                                        slotProps.data.price,
                                                    )
                                                }}
                                            </span>
                                            <span
                                                class="text-sm font-normal text-center m-2 bg-cyan-100 px-2 py-1 rounded-full"
                                            >
                                                KES
                                                {{
                                                    slotProps.data.has_offer ==
                                                    1
                                                        ? formatCurrency(
                                                              slotProps.data
                                                                  .offer_price,
                                                          )
                                                        : formatCurrency(
                                                              slotProps.data
                                                                  .price,
                                                          )
                                                }}.
                                            </span>
                                        </div>
                                        <div class="text-right mt-3">
                                            <div class="flex justify-end mb-1">
                                                <div
                                                    class="text-second flex justify-center space-x-2 px-4"
                                                >
                                                    <button
                                                        @click="
                                                            mainStore.decreaseSeats(
                                                                slotProps.data
                                                                    .id,
                                                            )
                                                        "
                                                        class="mb-2 text-gray-900 hover:scale-105 p-2 h-6 w-6 flex justify-center items-center transition duration-250 rounded-full bg-gray-300 shadow-md mt-1"
                                                    >
                                                        <i
                                                            class="pi pi-minus"
                                                        ></i>
                                                    </button>
                                                    <span
                                                        class="bg-base p-2 w-8 flex justify-center items-center h-8 mb-2 text-gray-50 rounded-full font-light"
                                                    >
                                                        {{
                                                            slotProps.data
                                                                .seats <=
                                                            slotProps.data
                                                                .available_seats
                                                                ? slotProps.data
                                                                      .seats
                                                                : "Add"
                                                        }}
                                                    </span>
                                                    <button
                                                        @click="
                                                            mainStore.increaseSeats(
                                                                slotProps.data
                                                                    .id,
                                                                slotProps.data
                                                                    .available_seats,
                                                            )
                                                        "
                                                        class="mb-2 text-gray-900 hover:scale-105 p-2 h-6 w-6 flex justify-center items-center transition duration-250 rounded-full bg-gray-300 shadow-md mt-1"
                                                    >
                                                        <i
                                                            class="pi pi-plus"
                                                        ></i>
                                                    </button>
                                                    <label
                                                        for="Category"
                                                        class="block mb-2 text-md text-gray-800"
                                                    >
                                                        Seats
                                                    </label>
                                                </div>
                                            </div>
                                            <button
                                                @click="
                                                    mainStore.bookFlight(
                                                        slotProps.data.id,
                                                    )
                                                "
                                                class="flex-no-shrink bg-gradient-to-tr from-teal-600 via-base to-base hover:scale-110 px-5 ml-4 py-2 mb-2 text-sm shadow-sm hover:shadow-lg tracking-wider text-gray-50 font-light rounded-full transition ease-in duration-200"
                                            >
                                                {{
                                                    mainStore.loading
                                                        ? "Please wait..."
                                                        : " Book Now"
                                                }}
                                            </button>
                                        </div>
                                    </div>

                                </div>

                                <div
                                    class="relative hover:scale-105 transition-all  duration-300 rounded-lg shadow-md m-2 bg-gradient-to-tl from-cyan-50 via-purple-50 to-rose-100 bg-cover backdrop-blur-md bg-opacity-25 max-w-md"
                                >
 
                                </div>
                            </template>
                        </Carousel>
                    </div>
                    <div v-else class="p-2 md:px-8 mb-32">
                        <vue-marquee-slider
                            id="marquee-slider-reverse"
                            :space="30"
                            :speed="12000"
                            :loop="true"
                            pauseOnHover
                            reverse
                        >
                            <div
                                v-for="destination in destinations"
                                :key="destination.name"
                                class="relative"
                            >
                                <img
                                    :src="getImagePath(destination.image)"
                                    :alt="destination.name"
                                    class="h-24 w-24 object-cover mix-blend-overlay"
                                />
                                <router-link
                                    to="listed-flights"
                                    class="text-center mt-2 absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 text-gray-50 hover:text-black hover:bg-gold px-4 py-1 rounded-full underline underline-offset-4 hover:shadow-lg transition duration-350 hover:scale-110"
                                >
                                    {{ destination.name }}
                                </router-link>
                            </div>
                        </vue-marquee-slider>
                    </div>
                    <div className="w-full flex mt-0  justify-center mb-32">
                        <div
                            className="flex flex-col  text-gray-50 w-full px-2 lg:px-12 py-4 max-w-screen-xl"
                        >
                            <h1
                                className="text-2xl md:text-4xl text-left font-semibold  lg:ml-0 mt-5 text-gray-50 md:mt-5"
                            >
                                <span className="{exo2.className}">
                                    Charter Flight Booking Service In Kenya
                                </span>
                            </h1>
                            <span
                                className="mt-2 md:m-0 lg:mt-2 text-gray-50 lg:text-md font-light mb-4 "
                            >
                                <h2>
                                    Explore Kenyan cities , towns , and parks
                                    with our exceptional flight services
                                </h2>
                            </span>
                            <router-link to="/listed-flights" className="my-6">
                                <span
                                    className="text-md font-normal mt-6 mb-5 md:mb-0 text-gray-50"
                                >
                                    <span
                                        className="flex flex-row hover:translate-x-0.5 trasition duration-300 font-semibold"
                                    >
                                        <span className="-m-1 ml-1 me-1">
                                            <SplitButton
                                                link1="/listed-flights"
                                                label1="All Flights"
                                                icon1=""
                                                link2="/flight-search"
                                                label2="Search Flight"
                                                icon2="pi pi-search"
                                            />
                                        </span>
                                    </span>
                                </span>
                            </router-link>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="bg-white" id="call2">
        <div class="relative flex justify-center items-center">
            <div
                class="absolute hidden w-full max-w-screen-lg bg-secondary self-center shadow-md rounded-lg h-24 lg:flex justify-center"
            >
                <vue-marquee-slider
                    id="marquee-slider-cards"
                    :space="30"
                    :speed="12000"
                    :loop="true"
                    pauseOnHover
                >
                    <div
                        v-for="destination in destinations"
                        :key="destination.name"
                        class="relative"
                    >
                        <img
                            :src="getImagePath(destination.image)"
                            :alt="destination.name"
                            class="h-24 w-24 object-cover mix-blend-overlay"
                        />
                        <router-link
                            to="listed-flights"
                            class="text-center mt-2 absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 text-gray-50 hover:text-black hover:bg-gold px-4 py-1 rounded-full underline underline-offset-4 hover:shadow-lg transition duration-350 hover:scale-110"
                        >
                            {{ destination.name }}
                        </router-link>
                    </div>
                </vue-marquee-slider>
            </div>
        </div>
        <div
            class="grid max-w-screen-xl px-2 lg:px-12 py-4 mx-auto lg:gap-8 xl:gap-0 lg:py-16 lg:grid-cols-12 relative"
        >
            <div class="mr-auto place-sel-center lg:col-span-6">
                <span
                    :class="`uppercase text-second text-lg ${exo2.className}`"
                >
                    <div
                        className="w-full h-full fixed top-0 left-0 z-[-1] "
                    ></div>
                    Your amazing experience powers us
                </span>
                <div class="grid grid-flow-row auto-rows-max">
                    <div>
                        <p class="max-w-2xl mb-2 mt-5 font-light text-gray-800">
                            We are dedicated to providing our passengers with
                            exceptional travel experiences. Whether you're
                            planning a business trip, a family vacation, a
                            romantic getaway, or a last minute dash away, Just
                            Wingit!
                        </p>
                    </div>

                    <div class="my-12 md:my-24">
                        <p>
                            Escape for a weekend of sunshine in Mombasa or a
                            safari wilderness tour in the Masai Mara or just
                            tour Kenya. Lock in your travel plans and save!
                        </p>
                        <router-link to="/about">
                            <span>
                                <p
                                    class="underline mt-5 font-light text-lg text-gray-900 flex flex-row justify-start hover:scale-105 transform hover:translate-x-4 transition-transform duration-250 cursor-pointer"
                                >
                                    Learn More
                                </p>
                            </span>
                        </router-link>
                    </div>

                    <div class="bottom-0">
                        <div
                            class="collapse rounded-sm collapse-arrow collapse-white text-white bg-secondary ary"
                        >
                            <input type="radio" name="my-accordion-2" />
                            <div class="collapse-title text-lg font-light">
                                <span
                                    class="bg-bg-500 text-gray-50 font-light mb-2"
                                >
                                    Book With Us Now
                                </span>
                            </div>
                            <div class="collapse-content text-white">
                                <p class="pb-2 font-light">
                                    <router-link
                                        class="me-2"
                                        to="/search-flight"
                                    >
                                        <i
                                            class="pi pi-search text-gray-700 text-2xl"
                                        ></i>
                                        Search
                                    </router-link>
                                    |
                                    <router-link to="/listed-flights">
                                        View Listed Flights</router-link
                                    >
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <router-link to="/listed-flights">
                    <span class="text-md font-normal mt-8 mb-5 md:mb-0">
                        <span
                            class="underline underline-offset-4 flex flex-row hover:translate-x-0.5 transition duration-300 font-semibold"
                        >
                            <span class="-m-1 ml-1 me-1">Book Now</span>
                            <i
                                class="pi pi-arrow-right h-5 w-5 stroke-gray-400"
                            ></i>
                        </span>
                    </span>
                </router-link>
            </div>

            <div
                class="hidden lg:mt-0 lg:col-span-6 lg:flex w-full justify-end relative p-4"
            >
                <div class="bg-slate-500 mt-5">
                    <img
                        class="w-full h-full rounded-md mix-blend-overlay"
                        :src="Top"
                        alt="mockup"
                    />
                </div>
            </div>
        </div>
    </section>
    <section class="bg-base">
        <div
            class="mx-auto flex flex-col md:flex-row items-center px-2 lg:px-12 max-w-screen-xl"
        >
            <div
                class="flex flex-col w-full lg:w-1/3 justify-center items-start px-2 py-8"
            >
                <p class="font-light text-gray-50 lg:mb-8">
                    We are committed to providing our passengers with an
                    exceptional travel experience, from the moment they book
                    their flights to the time they reach their destination.
                </p>
                <ul class="list-none mt-2">
                    <li class="py-1">
                        <div class="flex items-center">
                            <div>
                                <span
                                    class="inline-block py-1 px-2 uppercase rounded-full text-gold"
                                >
                                    <i class="pi pi-check-circle h-5 w-5"></i>
                                </span>
                            </div>
                            <div>
                                <h4 class="text-gray-50 font-light">
                                    Comfort and Safety
                                </h4>
                            </div>
                        </div>
                    </li>
                    <li class="py-1">
                        <div class="flex items-center">
                            <div>
                                <span
                                    class="inline-block py-1 px-2 uppercase rounded-full text-gold"
                                >
                                    <i class="pi pi-check-circle h-5 w-5"></i>
                                </span>
                            </div>
                            <div>
                                <h4 class="text-gray-50 font-light">
                                    Reliability
                                </h4>
                            </div>
                        </div>
                    </li>
                    <li class="py-1">
                        <div class="flex items-center">
                            <div>
                                <span
                                    class="inline-block px-2 uppercase rounded-full text-gold"
                                >
                                    <i class="pi pi-check-circle h-5 w-5"></i>
                                </span>
                            </div>
                            <div>
                                <h4 class="text-gray-50 font-light">
                                    Customer Service
                                </h4>
                            </div>
                        </div>
                    </li>
                </ul>
                <router-link
                    to="/about"
                    class="bg-transparent hover:bg-gold text-gold hover:text-black rounded shadow hover:shadow-lg py-2 mt-4 px-4 border border-gold hover:border-transparent transition duration-300"
                >
                    Read More
                </router-link>
            </div>
            <div
                class="p-2 mt-0 mb-3 md:mb-0 md:mt-0 ml-0 lg:w-2/3 justify-center"
            >
                <div
                    class="flex flex-wrap justify-center items-center space-x-4"
                >
                    <div
                        class="hidden xl:block w-40 h-60 bg-[url('../assets/p1.jpg')] bg-cover rounded-t-full bg-contain bg-center rounded-b-full transform -rotate-12 flex justify-center items-center"
                    ></div>
                    <div>
                        <div
                            class="w-60 h-96 bg-[url('../assets/p2.jpg')] rounded-t-full bg-opacity-25 bg-cover rounded-b-full bg-contin bg-center transform -rotate-12 flex justify-center items-center"
                        ></div>
                    </div>
                    <div>
                        <div
                            class="hidden xl:block w-40 h-60 bg-[url('../assets/pill4.jpg')] rounded-t-full bg-contain bg-center bg-cover rounded-b-full transform -rotate-12 flex justify-center items-center"
                        ></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="text-center scroll-smooth snap-center relative">
        <div class="absolute inset-0"></div>
        <main class="flex flex-col items-center justify-center">
            <section
                class="flex-col w-full h-[350px] bg-cover bg-fixed bg-center flex justify-center items-center bg-[url('../assets/thrill.jpg')]"
            >
                <div
                    class="relative flex-col w-full h-[350px] max-w-screen-xl my-24 px-2 lg:px-12 flex justify-start"
                >
                    <div class="text-left px-4 bg-transparent">
                        <span
                            class="text-gray-50 md:text-5xl font-semibold mb-4"
                        >
                            <div class="text-3xl mb-12">
                                <span class="text-3xl font-semibold"
                                    >Experience the thrill of travel with
                                    Wingit</span
                                >
                            </div>
                        </span>
                        <div class="my-6">
                            <span class="font-light text-gray-50">
                                <p></p>
                            </span>
                        </div>
                        <span class="m-auto mt-12 mb-4 lg:mb-0 lg:m-0 lg:mt-10">
                            <router-link to="/listed-flights">
                                <CallToAction label="Explore" />
                            </router-link>
                        </span>
                    </div>
                </div>
            </section>
        </main>
    </section>
</template>

<script setup>
import { onMounted, ref } from "vue";
import Top from "../assets/top.jpg";
import { useMainStore } from "../stores";
import { format } from "date-fns";
import { VueMarqueeSlider } from "vue3-marquee-slider";
import Carousel from "primevue/carousel";
import SplitButton from "../components/Buttons/SplitButton.vue";
import CallToAction from "../components/Buttons/CallToAction.vue";

const mainStore = useMainStore();

const formatCurrency = (price) => Number(price.split(".")[0]).toLocaleString();
onMounted(() => {
    mainStore.fetchFlights();
});

const exo2 = {
    className: "your-exo-class-name",
};
const responsiveOptions = ref([
    {
        breakpoint: "1400px",
        numVisible: 2,
        numScroll: 1,
    },
    {
        breakpoint: "1199px",
        numVisible: 3,
        numScroll: 1,
    },
    {
        breakpoint: "767px",
        numVisible: 2,
        numScroll: 1,
    },
    {
        breakpoint: "575px",
        numVisible: 1,
        numScroll: 1,
    },
    {
        breakpoint: "575px",
        numVisible: 1,
        numScroll: 1,
    },
]);

const destinations = [
    { name: "Malindi", image: "../assets/Malindi.jpg" },
    { name: "Diani", image: "../assets/Diani.jpg" },
    { name: "Laikipia", image: "../assets/Laikipia.jpeg" },
    { name: "Samburu", image: "../assets/Samburu.jpg" },
    { name: "Amboseli", image: "../assets/Amboseli.jpg" },
    { name: "Eldoret", image: "../assets/Eldoret.jpg" },
    { name: "Nakuru", image: "../assets/Nakuru.jpg" },
    { name: "Kisumu", image: "../assets/Kisumu.jpg" },
    { name: "Nanyuki", image: "../assets/Nanyuki.jpg" },
    {
        name: "Mombasa",
        image: "https://images.pexels.com/photos/1045113/pexels-photo-1045113.jpeg?auto=compress&cs=tinysrgb&w=1600",
    },
    { name: "Masai Mara", image: "../assets/Masaimara.jpg" },
    { name: "Nairobi", image: "../assets/Nairobi.jpg" },
];

function getImagePath(image) {
    return new URL(image, import.meta.url).href;
}
</script>
