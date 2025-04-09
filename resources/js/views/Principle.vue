<template>
  <div class="">
    <div
      class="bg-[url('../assets/hiwr.jpg')] h-[350px] md:h-[600px] lg:h-[750px] bg-fixed bg-cover bg-no-repeat md:bg-cover bg-center relative z-[]">
      <div class="h-[350px] md:h-[600px] lg:h-[750px] flex justify-start relative bg-slate-900 bg-opacity-25 z-[-1]">
        <div
          class="bg-blck p-1 rounded-lg md:m-10 ml-2 mb-5 text-2xl md:text-4xl  lg:text-gray-50 font-semibold absolute bottom-28 z-10 left-5">
        </div>
      </div>
    </div>
    <div class="flex justify-center">
      <div class="w-full p-2 max-w-screen-2xl">
        <div class=" mt-8 flex justify-center">
          <div class="p-2 py-6 max-w-[70rem] text-left w-full">
            <h1 v-motion="getRandomMotionPreset()">
              <span class="text-second uppercase text-2xl font-exo-2">How Wingit Works</span>
            </h1>
            <p class="mb-2 mt-4" v-motion="getRandomMotionPreset()">
              <span>Wingit</span> aims to capitalise on a significant percentage of charter flights in Kenya that remain
              unutilised either because the aircraft is heading back to base empty or to do a pick-up empty. We call
              these empty legs “dead legs”. Wingit now offers the platform where our users can book seats at a
              significantly reduced rate on empty aircraft depending on their desired routing. Wingit does not own or
              operate any of the aircraft directly; instead, it has a network of aircraft registered to the platform by
              various aviation operators.
            </p>
            <p class="mt-2" v-motion="getRandomMotionPreset()">
              However, we have carefully hand-picked the operators we want to work with to ensure we do not compromise
              on safety and service. All of the aircraft that we accept to operate on Wingit are from reputable
              operators, are in good condition, and are flown by professional and experienced pilots. Further to this,
              we go above and beyond by installing tracking devices into each aircraft so that Wingit can monitor each
              flight to ensure our customers' safety is always kept at the highest of standards.
            <p class="mt-2" v-motion="getRandomMotionPreset()">
              <RouterLink to="/client-register" class="font-semibold underline">Join</RouterLink> the Wingit family
              today to experience the new era of flight charter in Kenya.
            </p>
            </p>
            <p class="mt-5 font-semibold" v-motion="getRandomMotionPreset()">Here are some quick steps to get you
              started;</p>
          </div>
        </div>
      </div>
    </div>
    <section class="text-center snap-center relative">
      <main class="flex flex-col items-center justify-center">
        <section
          class="flex flex-col w-full bg-cover bg-fixed bg-center flex justify-center items-center bg-[url('/about.jpg')]">
          <div class="relative flex flex-col w-full flex justify-center items-center bg-slate-300 bg-opacity-25">
            <div class="text-left px-4 bg-transparent max-w-screen-2xl">
              <div class="my-4 md:grid md:grid-cols-2 md:gap-4 items-center md:p-20">
                <div
                  class="rounded-md m-2 mr-2 py-3 px-4 bg-white bg-opacity-90 md:rounded-bl-3xl md:rounded-tl-3xl md:rounded-tr-xl  shadow-md"
                  v-motion="getRandomMotionPreset()">
                  <p class="font-bold">Account Creation</p>
                  <a href="/client-register" class="underline">Create an account</a> with Wingit, and enjoy the
                  flexibility and efficiency of being able to travel by air on your next adventure!
                </div>
                <div v-motion="getRandomMotionPreset()">
                  <span
                    class="rounded-full hidden md:flex bg-base h-10 w-10 mr-2 justify-center text-gray-50 items-center font-bold text-2xl">1</span>
                </div>
                <div class="md:flex justify-end hidden" v-motion="getRandomMotionPreset()">
                  <span
                    class="rounded-full bg-base h-10 w-10 mr-2 flex justify-center text-gray-50 items-center font-bold text-2xl">2</span>
                </div>
                <div
                  class="rounded-md m-2 ml-2 py-3 px-4 bg-white bg-opacity-90 md:rounded-br-3xl md:rounded-tr-3xl md:rounded-tl-xl "
                  v-motion="getRandomMotionPreset()">
                  <p class="font-bold">Select flight</p>
                  Once your account is up and running, you will be able to choose from different flight options where
                  suppliers have advertised empty seats on their aircraft.
                </div>
                <div
                  class="rounded-md m-2 mr-2 py-3 px-4 bg-white bg-opacity-90 md:rounded-bl-3xl md:rounded-tl-3xl md:rounded-tr-xl  shadow-md"
                  v-motion="getRandomMotionPreset()">
                  <p class="font-bold">Reserve seats</p>
                  When you have found the flight you are looking for, you can choose to reserve either just 1 seat, or
                  book the whole aircraft depending on your needs. Seats will be sold on a per seat basis at the rate
                  advertised through the app.
                </div>
                <div class="md:flex justify-start hidden" v-motion="getRandomMotionPreset()">
                  <span
                    class="rounded-full bg-base h-10 w-10 mr-2 flex justify-center text-gray-50 items-center font-bold text-2xl">3</span>
                </div>
                <div v-motion="getRandomMotionPreset()">
                  <div class="md:flex justify-end hidden">
                    <span
                      class="rounded-full bg-base h-10 w-10 mr-2 flex justify-center text-gray-50 items-center font-bold text-2xl">4</span>
                  </div>
                </div>
                <div
                  class="rounded-md m-2 ml-2 py-3 px-4 bg-white bg-opacity-90 md:rounded-br-3xl md:rounded-tr-3xl md:rounded-tl-xl "
                  v-motion="getRandomMotionPreset()">
                  <p class="font-bold">Make payment</p>
                  Payment will need to be made prior to your date of travel, either through Mpesa or a bank transfer.
                </div>
                <div
                  class="rounded-md m-2 ml-2 py-3 px-4 bg-white bg-opacity-90 md:rounded-br-3xl md:rounded-tr-3xl md:rounded-tl-xl "
                  v-motion="getRandomMotionPreset()">
                  <p class="font-bold">Travel</p>
                  Arrive at your departure aerodrome, board your “private” aircraft, sit back, relax and enjoy the
                  luxury of air travel in Kenya!
                </div>

                <div class="md:flex justify-start hidden" v-motion="getRandomMotionPreset()">
                  <span
                    class="rounded-full bg-base h-10 w-10 mr-2 flex justify-center text-gray-50 items-center font-bold text-2xl">5</span>
                </div>
                <div class="md:flex justify-end hidden" v-motion="getRandomMotionPreset()">
                  <span
                    class="rounded-full bg-base h-10 w-10 mr-2 flex justify-center text-gray-50 items-center font-bold text-2xl">6</span>
                </div>
                <div
                  class="rounded-md m-2 ml-2 py-3 px-4 bg-white bg-opacity-90 md:rounded-br-3xl md:rounded-tr-3xl md:rounded-tl-xl "
                  v-motion="getRandomMotionPreset()">
                  <p class="font-bold">Need to Cancel?</p>
                  Need to cancel? No problem. We offer free cancellation up to 2hrs before your scheduled departure
                  time. Unfortunately, any cancellations after this would be charged in full as Wingit has to honour the
                  booking with the operator.
                </div>
              </div>
            </div>
          </div>
        </section>
      </main>
    </section>
  </div>
</template>

<script setup>
import { ref, inject } from "vue";

const motionPresets = inject("motionPresets");

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
