<template>
    <div class="bg-white">
        <section
            class="flex flex-col w-full h-[350px] lg:h-[750px] bg-cover bg-fixed bg-center justify-center items-center bg-[url('../assets/bg.jpg')]"
        >
            <div
                class="relative flex flex-col w-full h-[350px] justify-center items-center mt-24 bg-transparent"
            >
                <div class="max-w-[70em] w-full px-8 py-4">
                    <div class="mt-32">
                        <span class="text-gray-50 uppercase text-3xl font-serif"
                            >About Us</span
                        >
                    </div>
                </div>
            </div>
        </section>

        <main class="bg-white -mt-[2.3rem] z-50">
            <div
                class="p-2 md:mx-40 md:p-20 md:px-0 text-gray-800 2xl:px-40 flex justify-center rounded-lg"
            >
                <div
                    class="max-w-screen-2xl bg-white p-6 font-light text-gray-800 lg:mb-8 text-left"
                >
                    <p>
                        Inspired by the need to “democratise private air
                        travel”, Wingit was established to bridge the gap
                        between expensive private charters and unutilised
                        capacity. In doing so we hope to enable more people the
                        freedom and flexibility of private charter flight in
                        Kenya, providing access to every corner of the country
                        more efficiently and more affordably.
                    </p>
                    <p className="mb-2 mt-2">
                        Whether it be for spontaneous private travel on your
                        next holiday, or important business trips, we know the
                        value in getting you there faster and more comfortably.
                        Book your next flight with us, we promise you won't
                        regret it!
                    </p>
                    <p className="mb-2 mt-2">
                        We offer a flight charter booking service to a growing
                        number of destinations at a fraction of the cost of
                        booking a private charter. We work with hand-picked
                        charter operators who meet our safety and service
                        standards to leverage their “empty-legs” providing you
                        with a private charter experience at a fraction of the
                        cost. The more you use our service the better it gets as
                        we look to grow our footprint in terms of destinations
                        and reduced costs. We believe in the democratisation of
                        private air travel! That’s what powers Wingit!
                    </p>

                    <p class="my-2">
                        <router-link
                            to="/principle"
                            class="underline underline-offset-2"
                            >Learn More</router-link
                        >
                    </p>
                </div>
            </div>

            <!-- Travel Section with Animation -->
            <section class="text-center scroll-smooth snap-center relative">
                <main class="flex flex-col items-center justify-center">
                    <section
                        class="flex-col w-full h-[350px] bg-cover bg-fixed bg-center justify-center items-center bg-[url('../assets/about.jpg')]"
                    >
                        <div
                            class="relative flex-col w-full h-[350px] items-center bg-slate-900 bg-opacity-75 flex justify-center"
                        >
                            <div
                                class="text-left bg-transparent max-w-screen-2xl px-4"
                            >
                                <span
                                    class="text-gray-50 md:text-5xl font-semibold mb-4 font-serif"
                                >
                                    <div>Local Travel Reimagined</div>
                                </span>
                                <div class="my-6">
                                    <p class="font-light text-gray-50">
                                        Experience the future of flight booking
                                        - seamless, smart, and stress-free.
                                        Elevate your travel with our reimagined
                                        air travel services.
                                    </p>
                                </div>
                                <router-link
                                    to="/listed-flights"
                                    class="m-auto mt-6 mb-4 lg:mb-0 lg:m-0 lg:mt-10"
                                >
                                    <BaseButton label="Book a Seat" />
                                </router-link>
                            </div>
                        </div>
                    </section>
                </main>
            </section>

            <!-- Team Section -->
            <h2
                class="font-semibold text-center p-3 m-auto text-gray-700 text-2xl"
            >
                <span class="text-second uppercase text-3xl font-serif"
                    >Our Team</span
                >
            </h2>

            <section class="max-w-6xl mx-auto px-4 sm:px-2 lg:px-4 py-6">
    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-2 lg:grid-cols-3 gap-3">
      <TeamCard
        name="Ryan Outram"
        title="Founder"
        imageSrc="https://wingit.co.ke/resources/js/assets/team/ryan.png"
        description="Ryan has a keen sense of adventure and especially enjoys the challenges of flying off the beaten track to remote locations around Kenya and the rest of East Africa. Having spent his childhood on a farm on the slopes of Mt. Kenya, staring skyward at aircraft flying to and fro, he followed his dream of flying, and now runs his own private charter company, Rift Valley Aviation, which has partnered with Wingit to fly you on your next adventure. Ryan is a passionate outdoors adventurist, active conservationist, water skier, kite surfer and an enthusiastic pilot who loves to see the excited reaction of his passengers traveling by air across Kenya's magnificent landscapes."
      />
      <TeamCard
        name="Ngugi Kiuna"
        title="Founder"
        imageSrc="https://wingit.co.ke/resources/js/assets/team/ngugi.png"
        description="Ngugi is a passionate aviator, investor, explorer and lover of all things (fast) and outdoors. Ngugi studied a degree in Chemical Engineering and holds a PhD in composite structures for aerospace applications. After completing his PhD he went into the world of Investment Banking and worked for several global investment banks for 17 yrs before finally deciding to come back to his roots in Kenya and pursue more entrepreneurial opportunities. Keen to satisfy his passion for aviation and exploring new places, he started learning how to fly in 2007 and now holds a Commercial Pilots license and enjoys flying his family and friends in his “time capsule” to beautiful places all around the continent. Ngugi is keen to “democratise access to personal aviation”!"
      />
      <TeamCard
        name="Kui Mbugua"
        title="Partner"
        imageSrc="https://wingit.co.ke/resources/js/assets/team/kui.png"
        description="Born in Kenya, Kui is passionate about disruptive business innovation and growth that provides access to economic opportunities that propel the African continent forward. A keen traveler, she believes that opening up the interior of the continent through aviation aligns perfectly with increasing the economic exposure and materialising economic benefit to so many regions. Kui was recently recognised as one of the Top 25 Women in Digital in Kenya and with a background in international business and commercial law, she has been with Uber since September 2019 where she was Strategy and Planning Lead for Sub-Saharan Africa for 2 years before stepping into her current role as General Manager. She also sits on the global board of the Women@Uber global ERG where she promotes the advancement of Women@Uber through the development of strong networks, access to leadership, creation of development and learning opportunities and facilitation of leadership events and peer mentoring. Prior to that, Kui worked at McKinsey &Co. as a management consultant where she served clients across Africa (with exposure to Asian and European markets) in multiple industries (consumer, airlines, energy, telco, agriculture and logistics) with a focus on growth and operations strategy and execution and has broad industry experience in customer experience and support strategy."
      />
      <TeamCard
        name="Nzuki Meshack"
        title="Partner"
        imageSrc="https://wingit.co.ke/resources/js/assets/team/mesh.png"
        description="Meshack is a passionate and skilled software developer with over six years of experience in the industry. From an early age, Meshack's curiosity and love for technology sparked a lifelong interest in coding and problem-solving. With a solid foundation in computer science, Meshack embarked on a journey to turn this passion into a successful career. Throughout his professional journey, Meshack has had the opportunity to work on a wide range of projects, spanning from web applications to mobile apps and everything in between. He has honed his expertise in various programming languages, including Python, JavaScript, and Java, and have a solid understanding of modern development frameworks and tools. Meshack is constantly exploring new technologies and currently working full time at Wingit."
      />
      <TeamCard
        name="Ian Butich"
        title="Partner"
        imageSrc="https://wingit.co.ke/resources/js/assets/team/ian.png"
        description="Ian is a passionate software developer specialising in web development. With over 6 years of experience, he has excelled in front-end development. His expertise extends to back-end technologies."
      />
      <TeamCard
        name="Caroline Kagendo"
        title="Partner"
        imageSrc="https://wingit.co.ke/resources/js/assets/team/carol.png"
        description="Caroline is an independent consultant at Nkemi Consulting, a Strategic Brand, Marketing and Communication advisory firm she set up in 2014. She’s worked with companies at different stages from startup to multinational, in product development, brand management and marketing strategy focusing on commercial outcomes; plus driving communication strategies, plans and campaign development. Her consulting career comes with a backdrop of 20 years’ experience in both agency leadership positions and mainstream marketing roles, the most recent of which were as General Manager of New Business at Squad Digital, Agency Lead at Grey Group South East Africa in charge of the Procter & Gamble portfolio of brands ensuring marketing delivery across Kenya, Uganda, Tanzania, Ethiopia, Zimbabwe and Angola plus Strategy & Business Development Director at Ogilvy & Mather. Caroline has a degree in Communications from Daystar University."
      />
      
    </div>

    <section class="grid grid-rows-1 border-top gap-4 md:grid-cols-2 my-6 p-2 md:p-8">
      <div>
        <img src="../assets/footerabt.jpg" alt="" />
      </div>
      <div class="flex justify-center items-center py-5">
        <div>
          <p>
            <span class="font-serif font-bold">{{ 'Discover Kenya, Your Way' }}</span>
            <p class="my-4">
              Embark on a journey through the scenic landscapes of Kenya. From the savannas to the coast, redefine your travel experience with us and explore the beauty of Kenya like never before.
            </p>
            <router-link to="/auth/client-register">
              <BaseButton label="Get Started"></BaseButton>
            </router-link>
          </p>
        </div>
      </div>
    </section>
  </section>
        </main>
    </div>
</template>

<script setup>
import BaseButton from "../components/Buttons/BaseButton.vue";
import TeamCard from "../components/Card/TeamCard.vue";
</script>

<style scoped>
/* Add any additional styles here */
</style>
