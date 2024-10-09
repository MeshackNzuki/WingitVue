<template>
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
                        src="/top.jpg"
                        alt="mockup"
                    />
                </div>
            </div>
        </div>
    </section>
</template>

<script setup>
// You can define your reactive variables and imports here, if necessary

const exo2 = {
    className: "your-exo-class-name", // Replace with your actual class name
};
</script>

<style scoped>
/* Add any scoped styles here if necessary */
</style>
