<template>
    <section>
        <div
            className=" h-screen bg-fixed bg-[url('../assets/hiw.jpg')] bg-cover bg-no-repeat bg-center grid place-items-center ">
            <div class="w-full h-full absolute top-0 left-0  bg-sky-950 bg-opacity-30">
            </div>
            <div class="max-w-screen-xl flex justify-center items-center">
                <div className="w-full  h-96 flex justify-between flex-col md:flex-col ">
                    <div v-if="mainStore.flights" class="w-full flex justify-center md:block">
                        <Carousel :value="mainStore.flights" :numVisible="3" :numScroll="3" :showIndicators="true"
                            :showNavigators="false" :responsiveOptions="responsiveOptions"
                            containerClass="w-[350px] md:w-full " circular :autoplayInterval="6000">
                            <template #item="slotProps" class="flex-1 ">
                                <div v-motion="motionPresets.fadeRight(Math.random() * 500)"
                                    class="max-w-sm mx-2 from-cyan-50 via-purple-50 to-blue-50 bg-gradient-to-tl shadow-lg rounded-lg relative hover:scale-105 transition-all duration-300 ease-in ">
                                    <div
                                        class="absolute inset-0 z-[-1] bg-[url('https://img.freepik.com/free-vector/white-abstract-background_23-2148810246.jpg?t=st=1741239373~exp=1741242973~hmac=950b463911a781d7718c96b0af899940b1546ed7e671875c6c56c0a2a63a021e&w=1060')] bg-no-repeat bg-right bg-cover opacity-15 mix-blend-multiply">
                                    </div>
                                    <div class="flex items-center justify-between bg-transparent  z-1 px-2 py-0.5 ">
                                        <div class="text-lg font-light">
                                            {{
                                                slotProps.data.aircraft_operator
                                                    ?.company_name
                                            }}
                                        </div>
                                        <router-link>
                                            <div v-if="
                                                slotProps.data
                                                    .aircraft_operator?.avatar
                                            " class="avatar pointer">
                                                <div class="size-6 rounded-full ring-2 ring-sky-900 mt-0.5">
                                                    <img :src="`https://api.wingit.co.ke/core/storage/app/public/uploads/avatars/${slotProps.data.aircraft_operator?.avatar}`"
                                                        alt="User Avatar" />
                                                </div>
                                            </div>
                                            <div v-else class="avatar">
                                                <div
                                                    class="ring-gold ring-[2px] ring-offset-base-100 w-7 mt-1 rounded-full">
                                                    <img src="../assets/logo.png" />
                                                </div>
                                            </div>
                                        </router-link>
                                    </div>
                                    <!-- <div
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
                                        </p>
                                    </div> -->
                                    <div>
                                        <div class="flex w-full justify-between">
                                            <div class="flex justify-center p-1">
                                                <span
                                                    class="bg-cyan-100 text-sm rounded-lg p-1 px-2 flex flex-row text-gray-900">
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
                                            <!-- <span class="font-semibold text-xs mt-4">FLIGHT:{{
                                                slotProps.data.flight_no
                                            }}</span> -->
                                            <div class="flex justify-center p-1">
                                                <span
                                                    class="bg-cyan-100 text-sm rounded-lg p-1 px-2 flex flex-row text-gray-900">
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
                                    <div class="px-2">
                                        <div>
                                            <table class="w-full">
                                                <tr>
                                                    <td class="text-left">
                                                        <span
                                                            class="font-semibold uppercase text-xs relative overflow-hidden">
                                                            {{
                                                                slotProps.data.origin_airport?.name.split(
                                                                    " "
                                                                ).slice(0, 2).join(" ")
                                                            }}
                                                        </span>
                                                    </td>
                                                    <td class="flex justify-center flex-row pt-1.5">
                                                        <div class="flex justify-center items-center p-1 relative">
                                                            <div
                                                                class="h-1 w-6 sm:w-8 border-dashed border-base border-t-2 relative">
                                                                <div
                                                                    class="w-2.5 h-2.5 bg-base rounded-full absolute -left-5 -top-1.5 transform translate-x-1/2">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <span
                                                            class="size-5 rounded-full bg-base flex justify-center items-center">
                                                            <svg width="18px" height="18px" viewBox="0 0 24 24"
                                                                version="1.1" xmlns="http://www.w3.org/2000/svg"
                                                                xmlns:xlink="http://www.w3.org/1999/xlink"
                                                                fill="#ffffff">
                                                                <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                                                                <g id="SVGRepo_tracerCarrier" stroke-linecap="round"
                                                                    stroke-linejoin="round"></g>
                                                                <g id="SVGRepo_iconCarrier">
                                                                    <g id="🔍-Product-Icons" stroke="none"
                                                                        stroke-width="1" fill="none"
                                                                        fill-rule="evenodd">
                                                                        <g id="ic_fluent_airplane_24_regular"
                                                                            fill="#fff" fill-rule="nonzero">
                                                                            <path
                                                                                d="M9.46919998,9.64319623 L8.76896994,3.76843084 L8.76710757,3.69483566 C8.76710757,2.80621457 9.48747729,2.08584485 10.3760984,2.08584485 C11.1788794,2.08584485 11.9218023,2.50550659 12.3544416,3.22025731 L12.4407989,3.38093148 L15.385665,9.46995365 L19.3428194,9.35413963 C20.7764517,9.31203281 21.9727746,10.4400871 22.0151239,11.8847274 L22.0160008,11.9499605 C22.0160008,13.3843303 20.8532144,14.5471167 19.3968974,14.5467955 L15.4327301,14.4307421 L12.4408511,20.6189605 C12.0579681,21.4109607 11.2557936,21.9141552 10.3760984,21.9141552 C9.48747729,21.9141552 8.76710757,21.1937854 8.76744131,20.2827924 L8.77394708,20.164845 L9.48082465,14.2565719 L7.3487405,14.1943124 L7.0798372,14.9299926 C6.79932412,15.6973087 6.06934989,16.2076712 5.2523667,16.2076712 C4.37643365,16.2076712 3.66634961,15.4975871 3.6663497,14.6212975 L3.66671081,13.861732 L3.51166584,13.8294555 C2.62167552,13.6436712 1.98399916,12.8591352 1.98399916,11.9499605 C1.98399916,11.0406621 2.62214845,10.2561854 3.51221687,10.0711276 L3.66671101,10.0389641 L3.66634961,9.27826691 C3.66634961,8.47624085 4.26447316,7.80342041 5.10100277,7.70020621 L5.2523667,7.69224982 C5.99730606,7.69224982 6.67523788,8.11741422 7.01683448,8.81928941 L7.07965265,8.96942416 L7.34928097,9.70533179 L9.46919998,9.64319623 Z M10.3760984,3.58584485 C10.3159044,3.58584485 10.2671076,3.6346417 10.2667738,3.67246374 L11.1531665,11.0944828 L6.31272071,11.2363579 L5.68530725,9.52108796 L5.65276359,9.44201959 C5.57839918,9.28972577 5.42297213,9.19224982 5.29886242,9.1908072 L5.24063152,9.19295861 C5.19903584,9.19816414 5.16634961,9.23493241 5.16634953,9.27791055 L5.16729071,11.2587256 L3.81774959,11.5396812 C3.62334837,11.5801 3.48399916,11.7514019 3.48399916,11.9499605 C3.48399916,12.1488457 3.62349315,12.3204658 3.81777809,12.3610227 L5.16729088,12.6419576 L5.16634961,14.6216541 C5.16634961,14.66916 5.20486077,14.7076712 5.2523667,14.7076712 C5.43953173,14.7076712 5.60676364,14.5907508 5.67101347,14.4150016 L6.31126118,12.6633773 L11.165177,12.8051178 L10.2683025,20.276313 L10.2671076,20.3051643 C10.2671076,20.3653583 10.3159044,20.4141552 10.3760984,20.4141552 C10.6804219,20.4141552 10.9579277,20.2400791 11.0903941,19.9660701 L14.5052716,12.9029476 L19.4188447,13.0471167 C20.0247873,13.0471167 20.5160817,12.5559031 20.5160817,11.960971 L20.515528,11.9177565 C20.4977422,11.3121942 19.9924188,10.8357073 19.3867788,10.8534954 L14.4583367,10.997736 L11.1066298,4.06557353 L11.0542344,3.96737821 C10.910871,3.73107325 10.6537746,3.58584485 10.3760984,3.58584485 Z"
                                                                                id="🎨-Color"></path>
                                                                        </g>
                                                                    </g>
                                                                </g>
                                                            </svg>
                                                        </span>
                                                        <div class="flex justify-center items-center p-1 relative">
                                                            <div
                                                                class="h-1 w-6 sm:w-8 border-dashed border-base border-t-2 relative">
                                                                <div
                                                                    class="w-2.5 h-2.5 bg-base rounded-full absolute -right-1/3 -top-1.5 transform translate-x-1/2">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="text-right">
                                                        <span
                                                            class="font-semibold uppercase text-xs relative overflow-hidden">
                                                            {{
                                                                slotProps.data.destination_airport?.name.split(
                                                                    " "
                                                                ).slice(0, 2).join(" ")
                                                            }}
                                                        </span>
                                                    </td>
                                                </tr>
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
                                                            }}</small>
                                                    </td>
                                                    <td></td>
                                                    <td class="text-right">
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
                                            </table>
                                        </div>

                                        <div class="w-full text-center ">
                                            <span v-if="
                                                slotProps.data.has_offer ==
                                                1
                                            "
                                                class="text-sm font-normal text-center line-through text-red-500 bg-red-50 p-1  rounded-full">
                                                KES
                                                {{
                                                    formatCurrency(
                                                        slotProps.data.price,
                                                    )
                                                }}
                                            </span>
                                        </div>
                                        <div class="flex justify-between items-center">
                                            <div
                                                class="text-sm  text-center m-2 bg-emerald-500 bg-opacity-45 ms-16 px-4 py-1 h-7 text-gray-900  rounded-full">
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
                                                }}
                                            </div>
                                            <div class="text-right mt-3">
                                                <div class="flex justify-end mb-1">
                                                    <div class="text-second flex justify-center space-x-2">
                                                        <button @click="
                                                            mainStore.decreaseSeats(
                                                                slotProps
                                                                    .data
                                                                    .id,
                                                            )
                                                            "
                                                            class="mb-2 text-gray-900 hover:scale-105 p-2 h-6 w-6 flex justify-center items-center transition duration-250 rounded-full bg-gray-300 shadow-md mt-1">
                                                            <i class="pi pi-minus"></i>
                                                        </button>
                                                        <span
                                                            class="bg-base p-2 w-8 flex justify-center items-center h-8 mb-2 text-gray-50 rounded-full font-light">
                                                            {{
                                                                slotProps.data
                                                                    .seats <= slotProps.data.available_seats ?
                                                                    slotProps.data.seats : "Add" }} </span>
                                                                <button @click="
                                                                    mainStore.increaseSeats(
                                                                        slotProps
                                                                            .data
                                                                            .id,
                                                                        slotProps
                                                                            .data
                                                                            .available_seats,
                                                                    )
                                                                    "
                                                                    class="mb-2 text-gray-900 hover:scale-105 p-2 h-6 w-6 flex justify-center items-center transition duration-250 rounded-full bg-gray-300 shadow-md mt-1">
                                                                    <i class="pi pi-plus"></i>
                                                                </button>
                                                                <label for="Category" class="block mb-2 text-md  mt-1">
                                                                    Seats
                                                                </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="flex justify-between w-full items-center">
                                            <div class="text-sm flex justify-between items-center">
                                                <i class="pi pi-tags w-4 mr-1 text-red-500"></i>
                                                <small>
                                                    <span v-if="
                                                        slotProps.data
                                                            .has_offer == 1
                                                    ">
                                                        {{
                                                            calculateDiscount(
                                                                slotProps.data
                                                                    .price,
                                                                slotProps.data
                                                                    .offer_price,
                                                            )
                                                        }}% Off
                                                    </span>
                                                    <span v-else>
                                                        Best Price
                                                    </span>
                                                </small>
                                            </div>
                                            <button @click="
                                                mainStore.bookFlight(
                                                    slotProps.data.id,
                                                )
                                                "
                                                class="flex-no-shrink bg-gradient-to-tr from-teal-600 via-base to-base hover:scale-110 px-5 ml-4 py-2 mb-2 text-sm shadow-sm hover:shadow-lg tracking-wider text-gray-50 font-light rounded-full transition ease-in duration-300 ease-in">
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
                                    class="relative hover:scale-105 transition-all duration-300 ease-in rounded-lg shadow-md m-2 bg-gradient-to-tl from-cyan-50 via-purple-50 to-rose-100 bg-cover backdrop-blur-md bg-opacity-25 max-w-md">
                                </div>
                            </template>
                        </Carousel>
                    </div>

                    <div v-else class="p-2 md:px-8 mb-32">
                        <vue-marquee-slider id="marquee-slider-reverse" :space="30" :speed="12000" :loop="true"
                            pauseOnHover reverse>
                            <div v-for="destination in destinations" :key="destination.name" class="relative">
                                <img :src="destination.image" :alt="destination.name"
                                    class="h-24 w-24 object-cover rounded-full mix-blend-overlay" />
                                <router-link to="listed-flights"
                                    class="text-center mt-2 absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 text-gray-50 hover:text-black hover:bg-gold px-4 py-1 rounded-full underline underline-offset-4 hover:shadow-lg transition duration-350 hover:scale-110">
                                    {{ destination.name }}
                                </router-link>
                            </div>
                        </vue-marquee-slider>
                    </div>
                    <div className="w-full flex mt-0  justify-center mb-32 ">
                        <div className="flex flex-col  text-gray-50 w-full px-2 lg:px-12 py-4 max-w-screen-xl">
                            <h1 v-motion="motionPresets.fadeUp()"
                                className="text-2xl md:text-4xl text-left font- font-serif  lg:ml-0 mt-5 text-gray-50 md:mt-5">

                                Charter Flight Booking Service In Kenya

                            </h1>
                            <span v-motion="motionPresets.fadeDown()"
                                className="mt-2 md:m-0 lg:mt-2 text-gray-50 lg:text-md font-light mb-4 ">
                                <h2>
                                    Explore Kenyan cities ,towns, and parks
                                    with our exceptional flight services
                                </h2>
                            </span>
                            <router-link to="/listed-flights" className="my-6" v-motion="motionPresets.fadeUp(300)">
                                <span className="text-md font-normal mt-6 mb-5 md:mb-0 text-gray-50">
                                    <span
                                        className="flex flex-row hover:translate-x-0.5 trasition duration-300 ease-in font-semibold">
                                        <span className="-m-1 ml-1 me-1">
                                            <SplitButton link1="/listed-flights" label1="All Flights" icon1=""
                                                link2="/flight-search" label2="Search Flight" icon2="pi pi-search" />
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
            <div class="absolute hidden w-full max-w-screen-lg bg self-center rounded-lg h-24 lg:flex justify-center">
                <vue-marquee-slider id="marquee-slider-cards" :space="30" :speed="12000" :loop="true" pauseOnHover>
                    <div v-for="destination in destinations" :key="destination.name" class="relative">
                        <router-link to="listed-flights">
                            <img :src="destination.image" :alt="destination.name"
                                class="h-24 w-24 rounded-full object-cover mix-blend-overlay" />
                            <span
                                class="text-center mt-2 absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 text-gray-50 hover:text-black hover:bg-gold px-4 py-1 rounded-full underline underline-offset-4 hover:shadow-lg transition duration-350 hover:scale-110">
                                {{ destination.name }}
                            </span>
                        </router-link>
                    </div>
                </vue-marquee-slider>
            </div>
        </div>
        <div
            class="grid max-w-screen-xl px-2 lg:px-12 py-4 mx-auto lg:gap-8 xl:gap-0 lg:py-16 lg:grid-cols-12 relative">
            <div class="mr-auto place-sel-center lg:col-span-6" v-motion="motionPresets.fadeLeft()">
                <span :class="`uppercase text-second text-lg ${exo2.className}`">
                    <div className="w-full h-full fixed top-0 left-0 z-[-1] "></div>
                    <h2 class="font-semibold font-serif my-6 text-lg text-secondary">
                        Your amazing experience powers us
                    </h2>
                </span>
                <div class="grid grid-flow-row auto-rows-max">
                    <div>
                        <p class="max-w-2xl mb-2 mt-5 ">
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
                            safari wilderness tour in the Maasai Mara or just
                            tour Kenya. Lock in your travel plans and save!
                        </p>
                        <router-link to="/about">
                            <span>
                                <p
                                    class="underline mt-5 font-light text-lg text-gray-900 flex flex-row justify-start hover:scale-105 transform hover:translate-x-4 transition-transform duration-250 cursor-pointer">
                                    Learn More
                                </p>
                            </span>
                        </router-link>
                    </div>

                    <div class="bottom-0" v-motion="motionPresets.fadeDown()">
                        <div class="collapse rounded-sm collapse-arrow collapse-white text-base bg-gold">
                            <input type="radio" name="my-accordion-2" />
                            <div class="collapse-title text-lg font-light">
                                <span class="bg-bg-500 text-gray-900 font-semibold mb-3">
                                    Book With Us Now
                                </span>
                            </div>
                            <div class="collapse-content">
                                <p class="pb-2 font-light">
                                    <router-link class="me-2" to="/flight-search">
                                        <i class="pi pi-search"></i>
                                        Search
                                    </router-link>
                                    |
                                    <router-link to="/listed-flights">
                                        View Listed Flights</router-link>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="hidden lg:mt-0 lg:col-span-6 lg:flex w-full justify-end relative p-4"
                v-motion="motionPresets.fadeRight()">
                <div class="bg-slate-500 mt-5">
                    <img class="w-full h-full rounded-md hover:scale-105 transition-all duration-300 ease-in" :src="Top"
                        alt="mockup" />
                </div>
            </div>
        </div>
    </section>
    <section class="bg-base">
        <div class=" mx-auto flex flex-col md:flex-row items-center px-2 lg:px-12 max-w-screen-xl">
            <div v-motion="motionPresets.fadeRight()"
                class="flex flex-col w-full lg:w-1/3 justify-center items-start px-2 py-8">
                <p class="font-light text-gray-50 lg:mb-8">
                    We are committed to providing our passengers with an
                    exceptional travel experience, from the moment they book
                    their flights to the time they reach their destination.
                </p>
                <ul class="list-none mt-2">
                    <li class="py-1">
                        <div class="flex items-center">
                            <div>
                                <span class="inline-block py-1 px-2 uppercase rounded-full text-gold">
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
                                <span class="inline-block py-1 px-2 uppercase rounded-full text-gold">
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
                                <span class="inline-block px-2 uppercase rounded-full text-gold">
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
                <router-link to="/about"
                    class="bg-transparent hover:bg-gold text-gold hover:text-black rounded shadow hover:shadow-lg py-2 mt-4 px-4 border border-gold hover:border-transparent transition duration-300 ease-in">
                    Read More
                </router-link>
            </div>
            <div class="p-2 mt-0 mb-3 md:mb-0 md:mt-0 ml-0 lg:w-2/3 justify-center">
                <div class="flex flex-wrap justify-center items-center space-x-4">
                    <div v-motion="motionPresets.fadeDown()">
                        <div
                            class="xl:block w-40 h-60 bg-[url('../assets/p1.jpg')] bg-cover rounded-t-full bg-contain bg-center rounded-b-full transform -rotate-12 flex justify-center items-center">
                        </div>
                    </div>
                    <div v-motion="motionPresets.fadeRight()">
                        <div
                            class="w-60 h-96 bg-[url('../assets/p2.jpg')] rounded-t-full bg-opacity-25 bg-cover rounded-b-full bg-contin bg-center transform -rotate-12 flex justify-center items-center">
                        </div>
                    </div>
                    <div v-motion="motionPresets.fadeUp()">
                        <div
                            class="xl:block w-40 h-60 bg-[url('../assets/pill4.jpg')] rounded-t-full bg-contain bg-center bg-cover rounded-b-full transform -rotate-12 flex justify-center items-center">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="text-center scroll-smooth snap-center relative">
        <main class="flex flex-col items-center justify-center">
            <section
                class="flex-col w-full h-[350px] bg-cover bg-fixed bg-center flex justify-center items-center bg-[url('../assets/thrill.jpg')]">
                <div class="relative flex-col w-full h-[350px] max-w-screen-xl my-24 px-2 lg:px-12 flex justify-start">
                    <div class="text-left px-4 bg-transparent">
                        <span class="text-gray-50 md:text-5xl font-semibold mb-4">
                            <div class="text-3xl mb-12" v-motion="motionPresets.fadeUp()">
                                <span class="text-3xl  ">Experience the thrill of travel with
                                    Wingit</span>
                            </div>
                        </span>
                        <div class="my-6">
                            <span class="font-light text-gray-50">
                                <p></p>
                            </span>
                        </div>
                        <span class="m-auto mt-12 mb-4 lg:mb-0 lg:m-0 lg:mt-10" v-motion="motionPresets.fadeDown()">
                            <router-link to="/listed-flights">
                                <CallToAction label="Explore" />
                            </router-link>
                        </span>
                    </div>
                </div>
            </section>
        </main>
        <section class="py-6 bg-[url('../assets/bg.jpg')]">
            <h2 class="font-semibold font-serif my-6 text-lg uppercase text-gray-900"
                v-motion="motionPresets.fadeDown()">
                Why Wingit
            </h2>

            <div class="grid md:grid-cols-3 max-w-screen-lg mx-auto gap-10 mt-16 px-5">
                <div class="flex gap-4 items-start flex-col">

                    <div>
                        <h3 class="font-semibold text-xl mb-4" v-motion="motionPresets.fadeUp()">
                            Flight charter booking service
                        </h3>
                        <figure>
                            <img src="../assets/common.jpg" class="rounded-t-lg" alt="Wingit - flight booking" />
                        </figure>
                        <p class="mt-1 " v-motion="motionPresets.fadeDown()">
                            Experience private charter flight at a fraction of
                            the cost with all the freedom and flexibility that
                            comes with it. We update availability of routes
                            constantly as they come up so stay tuned in for the
                            best offers.
                        </p>
                    </div>
                </div>

                <div class="flex gap-4 items-start flex-col">
                    <div>
                        <h3 class="font-semibold text-xl mb-4" v-motion="motionPresets.fadeDown()">
                            Wide selection of destinations
                        </h3>
                        <figure class="">
                            <img src="../assets/common2.jpg" class="rounded-t-lg" alt="Wingit - flight booking" />
                        </figure>
                        <p class="mt-1  text-white md:text-gray-600" v-motion="motionPresets.fadeUp()">
                            Whether you are dreaming of a beach holiday, safari
                            escape, reunion with family or a business trip, we
                            will take you there in comfort, safety and style.
                        </p>
                    </div>
                </div>
                <div class="flex gap-4 items-start flex-col">
                    <div>
                        <h3 class="font-semibold text-xl text-white md:text-gray-600 mb-4"
                            v-motion="motionPresets.fadeDown()">
                            Flexible booking options
                        </h3>
                        <figure>
                            <img src="../assets/common3.jpg" class="rounded-t-lg" alt="Wingit - flight booking" />
                        </figure>
                        <p class="mt-1  text-white md:text-gray-600" v-motion="motionPresets.fadeUp()">
                            Life is unpredictable - Change your plans without
                            any hassle and enjoy the freedom to travel on your
                            terms with Wingit.
                        </p>
                    </div>
                </div>
            </div>
        </section>

        <section class="my-6">
            <h2 class="font-semibold my-4 text-lg font-serif uppercase text-secondary"
                v-motion="motionPresets.fadeDown()">
                Popular Destinations
            </h2>
            <div class="container mx-auto px-5 py-2 lg:px-32 lg:pt-24" v-motion="motionPresets.fadeUp()">
                <div class="flex">
                    <vue-marquee-slider id="marquee-slider-space" numVisible="3" :space="60" :speed="19000" :loop="true"
                        pauseOnHover>
                        <div v-for="destination in destinations" :key="destination.name" class="relative mb-14">
                            <router-link to="listed-flights" class="">
                                <img :src="destination.image" :alt="destination.name"
                                    class="h-32 rounded-full w-32 object-cover mix-blend-overlay" />
                                <span
                                    class="text-center mt-2 absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 text-gray-50 hover:text-black hover:bg-gold px-4 py-1 rounded-full underline underline-offset-4 hover:shadow-lg transition duration-350 hover:scale-110">
                                    {{ destination.name }}
                                </span>
                            </router-link>
                        </div>
                    </vue-marquee-slider>
                </div>
                <div class="-m-1 flex flex-wrap md:-m-2 mt-24">
                    <div class="flex w-1/2 flex-wrap">
                        <div class="relative group w-1/2 p-1 md:p-2 hover:scale-105 transition-all duration-300 ease-in"
                            v-motion="getRandomMotionPreset()">
                            <span class="absolute top-2 right-4 hidden group-hover:block ">
                                <router-link to="/listed-flights">
                                    <CallToAction label="Explore" />
                                </router-link>
                            </span>
                            <img alt="gallery" class="block h-full w-full rounded-lg object-cover object-center"
                                src="../assets/Kisumu.jpg" />
                        </div>
                        <div class="relative group w-1/2 p-1 md:p-2 hover:scale-105 transition-all duration-300 ease-in"
                            v-motion="getRandomMotionPreset()">
                            <span class="absolute top-2 right-4 hidden group-hover:block ">
                                <router-link to="/listed-flights">
                                    <CallToAction label="Explore" />
                                </router-link>
                            </span>
                            <img alt="gallery" class="block h-full w-full rounded-lg object-cover object-center"
                                src="../assets/Malindi.jpg" />
                        </div>
                        <div class="relative group w-full p-1 md:p-2 hover:scale-105 transition-all duration-300 ease-in"
                            v-motion="getRandomMotionPreset()">
                            <span class="absolute top-2 right-4 hidden group-hover:block ">
                                <router-link to="/listed-flights">
                                    <CallToAction label="Explore" />
                                </router-link>
                            </span>
                            <img alt="gallery" class="block h-full w-full rounded-lg object-cover object-center"
                                src="../assets/Diani.jpg" />
                        </div>
                    </div>
                    <div class=" flex w-1/2 flex-wrap">
                        <div class="relative group w-full p-1 md:p-2 hover:scale-105 transition-all duration-300 ease-in"
                            v-motion="getRandomMotionPreset()">
                            <span class="absolute top-2 right-4 hidden group-hover:block ">
                                <router-link to="/listed-flights">
                                    <CallToAction label="Explore" />
                                </router-link>
                            </span>
                            <img alt="gallery" class="block h-full w-full rounded-lg object-cover object-center"
                                src="../assets/Nanyuki.jpg" />
                        </div>
                        <div class="relative group w-1/2 p-1 md:p-2 hover:scale-105 transition-all duration-300 ease-in"
                            v-motion="getRandomMotionPreset()">
                            <span class="absolute top-2 right-4 hidden group-hover:block ">
                                <router-link to="/listed-flights">
                                    <CallToAction label="Explore" />
                                </router-link>
                            </span>
                            <img alt="gallery" class="block h-full w-full rounded-lg object-cover object-center"
                                src="../assets/Masaimara.jpg" />
                        </div>
                        <div class="relative group w-1/2 p-1 md:p-2 hover:scale-105 transition-all duration-300 ease-in"
                            v-motion="getRandomMotionPreset()">
                            <span class="absolute top-2 right-4 hidden group-hover:block ">
                                <router-link to="/listed-flights">
                                    <CallToAction label="Explore" />
                                </router-link>
                            </span>
                            <img alt="gallery" class="block h-full w-full rounded-lg object-cover object-center"
                                src="../assets/Eldoret.jpg" />
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="mx-2 flex flex-wrap justify-center gap-4 my-6 py-4">
            <h2 class="font-semibold my-4 text-lg font-serif uppercase text-secondary"
                v-motion="motionPresets.fadeDown()">
                Hear from our clients
            </h2>
            <div class="mx-2 flex flex-wrap justify-center gap-4 px-2">
                <div class="w-full  md:w-1/4  flex justify-center" v-motion="getRandomMotionPreset()">
                    <RateCard :rating="5" name="Kelsy Mageto"
                        text="I was in a hurry to fly to a meeting in Mombasa, Wingit helped me arrive on time." />
                </div>

                <div class="w-full  md:w-1/4  flex justify-center" v-motion="getRandomMotionPreset()">
                    <RateCard :rating="5" name="Brian Okello"
                        text="Wingit made my business trip seamless. The crew was professional and the jet was top-notch!" />
                </div>

                <div class="w-full md:w-1/4  flex justify-center" v-motion="getRandomMotionPreset()">
                    <RateCard :rating="5" name="Angela Njeri"
                        text="Absolutely incredible experience! From booking to landing, everything was smooth and luxurious." />
                </div>

                <div class="w-full md:w-1/4  hidden md:flex justify-center" v-motion="getRandomMotionPreset()">
                    <RateCard :rating="4" name="Mark Odhiambo"
                        text="The comfort and privacy were unmatched. Perfect for executives who need reliable travel." />
                </div>

                <div class="w-full  md:w-1/4  hidden md:flex justify-center" v-motion="getRandomMotionPreset()">
                    <RateCard :rating="5" name="Samantha Koech"
                        text="Exceptional service! The flight was punctual, and the team was extremely accommodating." />
                </div>

                <div class="w-full  md:w-1/4 hidden md:flex justify-center  " v-motion="getRandomMotionPreset()">
                    <RateCard :rating="4" name="James Mwangi"
                        text="Great experience flying with Wingit. It felt personalized and stress-free. Will book again!" />
                </div>
            </div>
        </section>




    </section>
    <section class="overflow-hidden bg-fixed bg-[url('../assets/hiw.jpg')] bg-cover bg-no-repeat bg-center">
        <div
            class="items-center justify-between py-10 px-5 backdrop-blur shadow-2xl  rounded-lg mx-auto  text-center bg-transparent">
            <div class="px-2 -mt-6 container mx-auto">
                <div class="text-center bg-gray-50 bg-opacity-75 w-full md:w-1/2 mx-auto p-2 rounded-lg">
                    <h1 v-motion="motionPresets.fadeDown()"
                        class="font-semibold text-lg  leading-loose  font-serif my-3 w-full text-secondary">
                        <span>Comfort and convenience on the fly</span>
                    </h1>
                    <div class="w-full text-center" v-motion="motionPresets.fadeUp()">
                        <p class="">
                            By registering an account, you will be the first
                            to receive news of our special fares and
                            promotions.
                        </p>
                        <form @submit.prevent="handleSubscription" class="my-12">
                            <div class="max-w-sm mx-auto p-1 pr-0 flex flex-wrap items-center gap-2">
                                <input type="email" v-model="subscriptionMail" placeholder="Email address"
                                    class="flex-1 appearance-none rounded-full text-center shadow border p-1  mr-2 focus:outline-none" />
                                <BaseButton :action="handleSubscription" label="Subscribe" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
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
import BaseButton from "../components/Buttons/BaseButton.vue";
import { toast } from "vue3-toastify";
import { inject } from "vue";
import malindiImage from "@/assets/Malindi.jpg";
import dianiImage from "@/assets/Diani.jpg";
import laikipiaImage from "@/assets/Laikipia.jpeg";
import samburuImage from "@/assets/Samburu.jpg";
import amboseliImage from "@/assets/Amboseli.jpg";
import eldoretImage from "@/assets/Eldoret.jpg";
import nakuruImage from "@/assets/Nakuru.jpg";
import kisumuImage from "@/assets/Kisumu.jpg";
import nanyukiImage from "@/assets/Nanyuki.jpg";
import masaiMaraImage from "@/assets/Masaimara.jpg";
import nairobiImage from "@/assets/Nairobi.jpg";
import RateCard from "../components/Card/RateCard.vue";


const motionPresets = inject("motionPresets");
const mainStore = useMainStore();
const subscriptionMail = ref("");

const formatCurrency = (price) => price.toLocaleString();

const exo2 = {
    className: "your-exo-class-name",
};

const handleSubscription = (e) => {
    // Add subscription logic here, such as sending subscriptionMail to an API
    console.log("Subscribed with:", subscriptionMail.value);
    toast.info("Thank you");
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
]);



const destinations = ref([
    { name: "Malindi", image: malindiImage },
    { name: "Diani", image: dianiImage },
    { name: "Laikipia", image: laikipiaImage },
    { name: "Samburu", image: samburuImage },
    { name: "Amboseli", image: amboseliImage },
    { name: "Eldoret", image: eldoretImage },
    { name: "Nakuru", image: nakuruImage },
    { name: "Kisumu", image: kisumuImage },
    { name: "Nanyuki", image: nanyukiImage },
    {
        name: "Mombasa",
        image: "https://images.pexels.com/photos/1045113/pexels-photo-1045113.jpeg?auto=compress&cs=tinysrgb&w=1600",
    },
    { name: "Maasai Mara", image: masaiMaraImage },
    { name: "Nairobi", image: nairobiImage },
]);
function getRandomMotionPreset() {
    const presets = [
        motionPresets.fadeUp(Math.random() * 300),
        motionPresets.fadeIn(Math.random() * 300),
        motionPresets.fadeLeft(Math.random() * 300),
        motionPresets.fadeRight(Math.random() * 300),
        motionPresets.fadeDown(Math.random() * 300),
    ];
    return presets[Math.floor(Math.random() * presets.length)];
}
</script>
