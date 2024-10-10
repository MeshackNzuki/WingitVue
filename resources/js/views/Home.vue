<template>
<section>
   
  <div v-if="flightStore.flights">
    <div
      v-for="i in flightStore.flights"
      :key="i.id"
      class="relative hover:scale-105 transition-all duration-300 transition-timing-function-cubic-bezier-0.7 rounded-lg shadow-md m-2 from-cyan-50 via-purple-50 to-rose-100 bg-gradient-to-tl bg-cover bg-opacity-50 backdrop-blur-md bg-opacity-25"
    >
      <div class="absolute flex justify-center m-auto h-1/3 w-1/2 mr-0 bottom-0 bg-transparent">
        <div class="absolute left-0 top-1/3 bg-third rounded-bl-lg rounded-tr-lg rounded-br-lg px-2 -ml-1 shadow-lg">
          <p class="font-bold">
            <i class="pi pi-map-marker me-1 text-sm"></i>
            <span class="text-xs">{{ i.destination_airport?.city?.toUpperCase() }}</span>
            <br />
            <span class="text-sm">
              <i class="pi pi-info-circle w-4 mr-2 text-base"></i>
              <small>
                <template v-if="i.has_offer == 1">
                  {{ calculateDiscount(i.price, i.offer_price) }}% Off
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
        <div class="grid grid-cols-2 grid-flow-col gap-4 shadow-sm">
          <div class="flex justify-center p-1">
            <span class="bg-cyan-100 text-sm rounded-lg p-1 px-2 flex flex-row text-gray-900">
              <i class="pi pi-calendar w-5 h-5"></i>
              {{ format(new Date(i.depart_time), "EEE d, M, Y ")}}
            </span>
          </div>
          <div class="flex justify-center p-1">
            <span class="bg-cyan-100 text-sm rounded-lg p-1 px-2 flex flex-row text-gray-900">
              <i class="pi pi-ticket w-5 h-5"></i>
              <span class="me-1">{{ i.available_seats }}</span>
              <span>{{ i.available_seats > 1 ? 'seats' : 'seat' }}</span>
            </span>
          </div>
        </div>
      </div>
      <div class="px-6">
        <div>
          <table class="w-full">
            <tr>
              <td class="text-left"><small>   {{ format(new Date(i.depart_time), "h:mm a")}}</small></td>
              <td></td>
              <td><small>{{ format(new Date(i.arrival_time), "h:mm a") }}</small></td>
            </tr>
            <tr>
              <td class="text-left">
                <span class="font-semibold uppercase text-xs relative overflow-hidden">
                  {{ i.origin_airport?.name.split(' ')[0] }}
                </span>
              </td>
              <td class="flex justify-center flex-row pt-1.5">
                <div class="flex justify-center items-center p-1 relative">
                  <div class="h-1 w-6 sm:w-8 border-dashed border-base border-t-2 relative">
                    <div class="w-2.5 h-2.5 bg-base rounded-full absolute -left-5 -top-1.5 transform translate-x-1/2"></div>
                  </div>
                </div>
                <span class="h-4 w-4 rounded-full bg-base flex justify-center items-center">
                  <i class="pi pi-send text-gray-50 h-2.5 w-2.5"></i>
                </span>
                <div class="flex justify-center items-center p-1 relative">
                  <div class="h-1 w-6 sm:w-8 border-dashed border-base border-t-2 relative">
                    <div class="w-2.5 h-2.5 bg-base rounded-full absolute -right-1/3 -top-1.5 transform translate-x-1/2"></div>
                  </div>
                </div>
              </td>
              <td class="text-right">
                <span class="font-semibold uppercase text-xs relative overflow-hidden">
                  {{ i.destination_airport?.name.split(' ')[0] }}
                </span>
              </td>
            </tr>
          </table>
        </div>
        <div class="text-left">
          <span class="text-sm font-thin text-left">
            {{ i.aircraft_operator?.company_name }}
          </span>
        </div>
        <div class="w-full text-center">
          <span v-if="i.has_offer == 1" class="text-sm font-thin text-center line-through text-red-500 bg-red-50 p-1 rounded-full">
            KES {{ formatCurrency(i.price) }}
          </span>
          <span class="text-sm font-thin text-center m-2 bg-cyan-100 px-2 py-1 rounded-full">
            {{ i.has_offer == 1 ? formatCurrency(i.offer_price) : formatCurrency(i.price) }}
          </span>
        </div>
        <div class="text-right mt-3">
          <div class="flex justify-end mb-1">
            <div class="text-second flex justify-center space-x-2 px-4">
              <button @click="flightStore.decreaseSeats(i.id)" class="mb-2 text-gray-900 hover:scale-105 p-2 h-6 w-6 flex justify-center items-center transition duration-250 rounded-full bg-gray-300 shadow-md mt-1">
                <i class="pi pi-minus"></i>
              </button>
              <span class="bg-base p-2 w-8 flex justify-center items-center h-8 mb-2 text-gray-50 rounded-full font-thin">
                {{ i.seats <= i.available_seats ? i.seats : 'Add' }}
              </span>
              <button @click="flightStore.increaseSeats(i.id, i.available_seats)" class="mb-2 text-gray-900 hover:scale-105 p-2 h-6 w-6 flex justify-center items-center transition duration-250 rounded-full bg-gray-300 shadow-md mt-1">
                <i class="pi pi-plus"></i>
              </button>
              <label for="Category" class="block mb-2 text-md text-gray-800">
                Seats
              </label>
            </div>
          </div>
          <button @click="flightStore.bookFlight(i.id)" class="flex-no-shrink bg-gradient-to-tr from-teal-600 via-base to-base hover:scale-110 px-5 ml-4 py-2 mb-2 text-sm shadow-sm hover:shadow-lg tracking-wider text-gray-50 font-thin rounded-full transition ease-in duration-200">
            {{ flightStore.loading ? 'Please wait...' : ' Book Now' }}
          </button>
        </div>
      </div>
    </div>
  </div>
 
</section>
    <section class="bg-white" id="call2">
        <div
            class="grid max-w-screen-xl px-2 lg:px-12 py-4 mx-auto lg:gap-8 xl:gap-0 lg:py-16 lg:grid-cols-12"
        >
            <div class="mr-auto place-sel-center lg:col-span-6">
                <span
                    :class="`uppercase text-second text-lg ${exo2.className}`"
                >
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
                            class="collapse rounded-sm collapse-arrow collapse-white text-white bg-second"
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
</template>

<script setup>

import { onMounted } from "vue";
import Top from "../assets/top.jpg";
import { useFlightStore } from "../stores";
import { format } from "date-fns";

const flightStore = useFlightStore();
const formatCurrency = (price) => Number(price.split('.')[0]).toLocaleString();
onMounted(()=>{
    flightStore.fetchFlights();
}

)

const exo2 = {
    className: "your-exo-class-name", 
};
</script>


