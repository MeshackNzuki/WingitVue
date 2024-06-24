<template>
    <nav
        v-if="!login"
        :class="
            'rounded-xl absolute md:left-1 md:block md:fixed md:top-1 md:bottom-1 dark:text-slate-300 md:overflow-y-auto md:flex-row md:flex-nowrap md:overflow-hidden shadow-lg flex flex-wrap items-center justify-between md:w-64 z-10 py-4 px-6 ' +
            (isDark
                ? 'bg-gradient-to-r from-slate-800 via-sky-950 to-sky-950'
                : 'bg-gradient-to-r from-white via-slate-50 to-sky-50')
        "
    >
        <div
            class="md:flex-col md:items-stretch md:min-h-full md:flex-nowrap px-0 flex flex-wrap items-center space-y-4 w-full mx-auto"
        >
            <!-- Toggler -->
            <button
                class="cursor-pointer text-black opacity-50 md:hidden px-3 py-1 text-xl leading-none bg-transparent rounded border border-solid border-transparent"
                type="button"
                v-on:click="toggleCollapseShow('bg-white m-2 py-3 px-6')"
            ></button>
            <!-- Brand -->
            <div class="flex flex-col justify-center items-center w-full">
                <router-link
                    class="md:block text-left md:pb-2 text-blueGray-600 text-sm uppercase font-bold p-4 px-0"
                    to="/"
                >
                    Ultra S. Manager
                </router-link>

                <!-- User -->
                <ul class="items-center flex flex-wrap list-none">
                    <li class="inline-block relative">
                        <user-dropdown />
                    </li>
                </ul>
            </div>
            <!-- Admin -->

            <div v-if="route.path.includes('/admin')" class="min-h-96 mt-0">
                <span
                    class="w-full flex justify-center text-center text-xs font-bold"
                >
                    Admin Module</span
                >
                <div class="relative flex flex-col rounded-x w-full p-2">
                    <nav
                        class="flex flex-col gap-1 p-2 font-sans text-base font-normal text-gray-700 dark:text-slate-300"
                    >
                        <router-link to="/admin/">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-compass"></i>
                                </div>
                                Dashboard
                            </div>
                        </router-link>
                        <router-link to="/admin/users">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-users"></i>
                                </div>
                                Manage Users
                            </div>
                        </router-link>

                        <router-link to="/admin/profile">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-user"></i>
                                </div>
                                Profile
                            </div>
                        </router-link>

                        <router-link to="/admin/settings">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-cog"></i>
                                </div>
                                Settings
                            </div>
                        </router-link>

                        <router-link to="logout">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        viewBox="0 0 24 24"
                                        fill="currentColor"
                                        aria-hidden="true"
                                        class="h-5 w-5"
                                    >
                                        <path
                                            fill-rule="evenodd"
                                            d="M12 2.25a.75.75 0 01.75.75v9a.75.75 0 01-1.5 0V3a.75.75 0 01.75-.75zM6.166 5.106a.75.75 0 010 1.06 8.25 8.25 0 1011.668 0 .75.75 0 111.06-1.06c3.808 3.807 3.808 9.98 0 13.788-3.807 3.808-9.98 3.808-13.788 0-3.808-3.807-3.808-9.98 0-13.788a.75.75 0 011.06 0z"
                                            clip-rule="evenodd"
                                        ></path>
                                    </svg>
                                </div>
                                Log Out
                            </div>
                        </router-link>
                        <hr />

                        <router-link to="/admissions">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-graduation-cap"></i>
                                </div>
                                Admissions
                            </div>
                        </router-link>

                        <router-link to="/finance">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-briefcase"></i>
                                </div>
                                Finance
                            </div>
                        </router-link>

                        <router-link to="/inventory">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-shop"></i>
                                </div>
                                Inventory
                            </div>
                        </router-link>

                        <router-link to="/hostel">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-warehouse"></i>
                                </div>
                                hostel
                            </div>
                        </router-link>

                        <router-link to="/library">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-book"></i>
                                </div>
                                Library
                            </div>
                        </router-link>
                    </nav>
                    <div
                        class="flex border border-dashed rounded-2xl justify-center items-center"
                    >
                        <common-button
                            class="mt-10 shadow-sm"
                            button-text="Add New User"
                        ></common-button>
                        <SpeedDial
                            :model="items"
                            :radius="120"
                            type="quarter-circle"
                            direction="up-left"
                        />
                    </div>
                </div>
            </div>

            <!-- Library -->
            <div v-if="route.path.includes('/library')" class="min-h-96 mt-0">
                <span
                    class="w-full flex justify-center text-center text-xs font-bold"
                >
                    Library Module</span
                >
                <div class="relative flex flex-col rounded-x w-full p-2">
                    <nav
                        class="flex flex-col gap-1 p-2 font-sans text-base font-normal text-gray-700 dark:text-slate-300"
                    >
                        <router-link to="/library/">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-compass"></i>
                                </div>
                                Dashboard
                            </div>
                        </router-link>
                        <router-link to="/library/all_books">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-book"></i>
                                </div>
                                All Books
                            </div>
                        </router-link>

                        <router-link to="/library/all_students">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-users"></i>
                                </div>
                                All Students
                            </div>
                        </router-link>
                        <router-link to="/library/issued">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-file-export"></i>
                                </div>
                                Borrowed Books
                            </div>
                        </router-link>
                        <router-link to="/library/lost">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-exclamation-circle"></i>
                                </div>
                                Lost Books
                            </div>
                        </router-link>

                        <div
                            class="dropdown dropdown-bottom leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                        >
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-address-book"></i>
                                </div>
                                Book Count <i class="pi pi-angle-down mt-1"></i>
                            </div>
                            <ul
                                tabindex="0"
                                class="dropdown-content z-[1] menu p-2 shadow bg-base-100 rounded-box w-52"
                            >
                                <li>
                                    <router-link to="/library/count_subject"
                                        >Count /Subject</router-link
                                    >
                                </li>
                                <li>
                                    <router-link to="/library/count_title">
                                        Count /Title</router-link
                                    >
                                </li>
                            </ul>
                        </div>
                        <div
                            class="dropdown dropdown-bottom leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                        >
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-file-excel"></i>
                                </div>
                                Reports <i class="pi pi-angle-down mt-1"></i>
                            </div>
                            <ul
                                tabindex="0"
                                class="dropdown-content z-[1] menu p-2 shadow bg-base-100 rounded-box w-52"
                            >
                                <li>
                                    <router-link to="/library/daily_reports"
                                        >Daily</router-link
                                    >
                                </li>
                                <li>
                                    <router-link to="/library/monthly_reports"
                                        >Monthly
                                    </router-link>
                                </li>
                            </ul>
                        </div>

                        <router-link to="logout">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        viewBox="0 0 24 24"
                                        fill="currentColor"
                                        aria-hidden="true"
                                        class="h-5 w-5"
                                    >
                                        <path
                                            fill-rule="evenodd"
                                            d="M12 2.25a.75.75 0 01.75.75v9a.75.75 0 01-1.5 0V3a.75.75 0 01.75-.75zM6.166 5.106a.75.75 0 010 1.06 8.25 8.25 0 1011.668 0 .75.75 0 111.06-1.06c3.808 3.807 3.808 9.98 0 13.788-3.807 3.808-9.98 3.808-13.788 0-3.808-3.807-3.808-9.98 0-13.788a.75.75 0 011.06 0z"
                                            clip-rule="evenodd"
                                        ></path>
                                    </svg>
                                </div>
                                Log Out
                            </div>
                        </router-link>
                        <hr />

                        <router-link to="/admissions">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-graduation-cap"></i>
                                </div>
                                Admissions
                            </div>
                        </router-link>

                        <router-link to="/finance">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-briefcase"></i>
                                </div>
                                Finance
                            </div>
                        </router-link>

                        <router-link to="/inventory">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-shop"></i>
                                </div>
                                Inventory
                            </div>
                        </router-link>

                        <router-link to="/hostel">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-warehouse"></i>
                                </div>
                                hostel
                            </div>
                        </router-link>

                        <router-link to="/library">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-book"></i>
                                </div>
                                Library
                            </div>
                        </router-link>
                    </nav>
                    <router-link to="admin/users">
                        <common-button
                            class="mt-10 shadow-sm"
                            button-text="Add New User"
                        ></common-button>
                    </router-link>
                </div>
            </div>

            <!-- Finance -->
            <div v-if="route.path.includes('/finance')" class="min-h-96 mt-0">
                <span
                    class="w-full flex justify-center text-center text-xs font-bold"
                >
                    Finance Module</span
                >
                <div class="relative flex flex-col rounded-x w-full p-2">
                    <nav
                        class="flex flex-col gap-1 p-2 font-sans text-base font-normal text-gray-700 dark:text-slate-300"
                    >
                        <router-link to="/admin/">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-compass"></i>
                                </div>
                                Dashboard
                            </div>
                        </router-link>
                        <router-link to="users">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-users"></i>
                                </div>
                                Manage Users
                            </div>
                        </router-link>

                        <router-link to="profile">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-user"></i>
                                </div>
                                Profile
                            </div>
                        </router-link>

                        <router-link to="settings">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-cog"></i>
                                </div>
                                Settings
                            </div>
                        </router-link>

                        <router-link to="logout">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        viewBox="0 0 24 24"
                                        fill="currentColor"
                                        aria-hidden="true"
                                        class="h-5 w-5"
                                    >
                                        <path
                                            fill-rule="evenodd"
                                            d="M12 2.25a.75.75 0 01.75.75v9a.75.75 0 01-1.5 0V3a.75.75 0 01.75-.75zM6.166 5.106a.75.75 0 010 1.06 8.25 8.25 0 1011.668 0 .75.75 0 111.06-1.06c3.808 3.807 3.808 9.98 0 13.788-3.807 3.808-9.98 3.808-13.788 0-3.808-3.807-3.808-9.98 0-13.788a.75.75 0 011.06 0z"
                                            clip-rule="evenodd"
                                        ></path>
                                    </svg>
                                </div>
                                Log Out
                            </div>
                        </router-link>
                        <hr />

                        <router-link to="/admissions">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-graduation-cap"></i>
                                </div>
                                Admissions
                            </div>
                        </router-link>

                        <router-link to="/finance">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-briefcase"></i>
                                </div>
                                Finance
                            </div>
                        </router-link>

                        <router-link to="/inventory">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-shop"></i>
                                </div>
                                Inventory
                            </div>
                        </router-link>

                        <router-link to="/hostel">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-warehouse"></i>
                                </div>
                                hostel
                            </div>
                        </router-link>

                        <router-link to="/library">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-book"></i>
                                </div>
                                Library
                            </div>
                        </router-link>
                    </nav>
                    <router-link to="admin/users">
                        <common-button
                            class="mt-10 shadow-sm"
                            button-text="Add New User"
                        ></common-button>
                    </router-link>
                </div>
            </div>

            <!-- Guardian -->
            <div v-if="route.path.includes('/guardian')" class="min-h-96 mt-0">
                <span
                    class="w-full flex justify-center text-center text-xs font-bold"
                >
                    Guardian Module</span
                >
                <div class="relative flex flex-col rounded-x w-full p-2">
                    <nav
                        class="flex flex-col gap-1 p-2 font-sans text-base font-normal text-gray-700 dark:text-slate-300"
                    >
                        <router-link to="/admin/">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-compass"></i>
                                </div>
                                Dashboard
                            </div>
                        </router-link>
                        <router-link to="users">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-users"></i>
                                </div>
                                Manage Users
                            </div>
                        </router-link>

                        <router-link to="profile">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-user"></i>
                                </div>
                                Profile
                            </div>
                        </router-link>

                        <router-link to="settings">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-cog"></i>
                                </div>
                                Settings
                            </div>
                        </router-link>

                        <router-link to="logout">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        viewBox="0 0 24 24"
                                        fill="currentColor"
                                        aria-hidden="true"
                                        class="h-5 w-5"
                                    >
                                        <path
                                            fill-rule="evenodd"
                                            d="M12 2.25a.75.75 0 01.75.75v9a.75.75 0 01-1.5 0V3a.75.75 0 01.75-.75zM6.166 5.106a.75.75 0 010 1.06 8.25 8.25 0 1011.668 0 .75.75 0 111.06-1.06c3.808 3.807 3.808 9.98 0 13.788-3.807 3.808-9.98 3.808-13.788 0-3.808-3.807-3.808-9.98 0-13.788a.75.75 0 011.06 0z"
                                            clip-rule="evenodd"
                                        ></path>
                                    </svg>
                                </div>
                                Log Out
                            </div>
                        </router-link>
                        <hr />

                        <router-link to="/admissions">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-graduation-cap"></i>
                                </div>
                                Admissions
                            </div>
                        </router-link>

                        <router-link to="/finance">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-briefcase"></i>
                                </div>
                                Finance
                            </div>
                        </router-link>

                        <router-link to="/inventory">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-shop"></i>
                                </div>
                                Inventory
                            </div>
                        </router-link>

                        <router-link to="/hostel">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-warehouse"></i>
                                </div>
                                hostel
                            </div>
                        </router-link>

                        <router-link to="/library">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-book"></i>
                                </div>
                                Library
                            </div>
                        </router-link>
                    </nav>
                    <router-link to="admin/users">
                        <common-button
                            class="mt-10 shadow-sm"
                            button-text="Add New User"
                        ></common-button>
                        <SpeedDial
                            :model="items"
                            direction="right"
                            :style="{ top: 'calc(50% - 2rem)', left: 0 }"
                        />
                    </router-link>
                </div>
            </div>

            <div
                v-if="route.path.includes('/admissions')"
                class="min-h-96 mt-0"
            >
                <span
                    class="w-full flex justify-center text-center text-xs font-bold"
                >
                    Admissions Module</span
                >
                <div class="relative flex flex-col rounded-x w-full p-2">
                    <nav
                        class="flex flex-col gap-1 p-2 font-sans text-base font-normal text-gray-700 dark:text-slate-300"
                    >
                        <router-link to="/admissions/">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-compass"></i>
                                </div>
                                Dashboard
                            </div>
                        </router-link>
                        <router-link to="all">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-users"></i>
                                </div>
                                All Students
                            </div>
                        </router-link>
                        <router-link to="continuing">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-users"></i>
                                </div>
                                Continuing
                            </div>
                        </router-link>
                        <router-link to="alumni">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-users"></i>
                                </div>
                                Alumni
                            </div>
                        </router-link>

                        <router-link to="profile">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-user"></i>
                                </div>
                                Profile
                            </div>
                        </router-link>

                        <router-link to="settings">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-cog"></i>
                                </div>
                                Settings
                            </div>
                        </router-link>

                        <router-link to="logout">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        viewBox="0 0 24 24"
                                        fill="currentColor"
                                        aria-hidden="true"
                                        class="h-5 w-5"
                                    >
                                        <path
                                            fill-rule="evenodd"
                                            d="M12 2.25a.75.75 0 01.75.75v9a.75.75 0 01-1.5 0V3a.75.75 0 01.75-.75zM6.166 5.106a.75.75 0 010 1.06 8.25 8.25 0 1011.668 0 .75.75 0 111.06-1.06c3.808 3.807 3.808 9.98 0 13.788-3.807 3.808-9.98 3.808-13.788 0-3.808-3.807-3.808-9.98 0-13.788a.75.75 0 011.06 0z"
                                            clip-rule="evenodd"
                                        ></path>
                                    </svg>
                                </div>
                                Log Out
                            </div>
                        </router-link>
                        <hr />

                        <router-link to="/admissions">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-graduation-cap"></i>
                                </div>
                                Admissions
                            </div>
                        </router-link>

                        <router-link to="/finance">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-briefcase"></i>
                                </div>
                                Finance
                            </div>
                        </router-link>

                        <router-link to="/inventory">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-shop"></i>
                                </div>
                                Inventory
                            </div>
                        </router-link>

                        <router-link to="/hostel">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-warehouse"></i>
                                </div>
                                hostel
                            </div>
                        </router-link>

                        <router-link to="/library">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-book"></i>
                                </div>
                                Library
                            </div>
                        </router-link>
                    </nav>
                    <router-link to="admin/users">
                        <common-button
                            class="mt-10 shadow-sm"
                            button-text="Add New User"
                        ></common-button>
                    </router-link>
                </div>
            </div>

            <!-- Student -->
            <div v-if="route.path.includes('/student')" class="min-h-96 mt-0">
                <span
                    class="w-full flex justify-center text-center text-xs font-bold"
                >
                    Student Module</span
                >
                <div class="relative flex flex-col rounded-x w-full p-2">
                    <nav
                        class="flex flex-col gap-1 p-2 font-sans text-base font-normal text-gray-700 dark:text-slate-300"
                    >
                        <router-link to="/admin/">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-compass"></i>
                                </div>
                                Dashboard
                            </div>
                        </router-link>
                        <router-link to="users">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-users"></i>
                                </div>
                                Manage Users
                            </div>
                        </router-link>

                        <router-link to="profile">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-user"></i>
                                </div>
                                Profile
                            </div>
                        </router-link>

                        <router-link to="settings">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-cog"></i>
                                </div>
                                Settings
                            </div>
                        </router-link>

                        <router-link to="logout">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        viewBox="0 0 24 24"
                                        fill="currentColor"
                                        aria-hidden="true"
                                        class="h-5 w-5"
                                    >
                                        <path
                                            fill-rule="evenodd"
                                            d="M12 2.25a.75.75 0 01.75.75v9a.75.75 0 01-1.5 0V3a.75.75 0 01.75-.75zM6.166 5.106a.75.75 0 010 1.06 8.25 8.25 0 1011.668 0 .75.75 0 111.06-1.06c3.808 3.807 3.808 9.98 0 13.788-3.807 3.808-9.98 3.808-13.788 0-3.808-3.807-3.808-9.98 0-13.788a.75.75 0 011.06 0z"
                                            clip-rule="evenodd"
                                        ></path>
                                    </svg>
                                </div>
                                Log Out
                            </div>
                        </router-link>
                        <hr />

                        <router-link to="/admissions">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-graduation-cap"></i>
                                </div>
                                Admissions
                            </div>
                        </router-link>

                        <router-link to="/finance">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-briefcase"></i>
                                </div>
                                Finance
                            </div>
                        </router-link>

                        <router-link to="/inventory">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-shop"></i>
                                </div>
                                Inventory
                            </div>
                        </router-link>

                        <router-link to="/hostel">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-warehouse"></i>
                                </div>
                                hostel
                            </div>
                        </router-link>

                        <router-link to="/library">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-book"></i>
                                </div>
                                Library
                            </div>
                        </router-link>
                    </nav>
                    <router-link to="admin/users">
                        <common-button
                            class="mt-10 shadow-sm"
                            button-text="Add New User"
                        ></common-button>
                    </router-link>
                </div>
            </div>

            <!-- Instructor -->
            <div
                v-if="route.path.includes('/instructor')"
                class="min-h-96 mt-0"
            >
                <span
                    class="w-full flex justify-center text-center text-xs font-bold"
                >
                    Instructor Module</span
                >
                <div class="relative flex flex-col rounded-x w-full p-2">
                    <nav
                        class="flex flex-col gap-1 p-2 font-sans text-base font-normal text-gray-700 dark:text-slate-300"
                    >
                        <router-link to="/admin/">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-compass"></i>
                                </div>
                                Dashboard
                            </div>
                        </router-link>
                        <router-link to="users">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-users"></i>
                                </div>
                                Manage Users
                            </div>
                        </router-link>

                        <router-link to="profile">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-user"></i>
                                </div>
                                Profile
                            </div>
                        </router-link>

                        <router-link to="settings">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-cog"></i>
                                </div>
                                Settings
                            </div>
                        </router-link>

                        <router-link to="logout">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        viewBox="0 0 24 24"
                                        fill="currentColor"
                                        aria-hidden="true"
                                        class="h-5 w-5"
                                    >
                                        <path
                                            fill-rule="evenodd"
                                            d="M12 2.25a.75.75 0 01.75.75v9a.75.75 0 01-1.5 0V3a.75.75 0 01.75-.75zM6.166 5.106a.75.75 0 010 1.06 8.25 8.25 0 1011.668 0 .75.75 0 111.06-1.06c3.808 3.807 3.808 9.98 0 13.788-3.807 3.808-9.98 3.808-13.788 0-3.808-3.807-3.808-9.98 0-13.788a.75.75 0 011.06 0z"
                                            clip-rule="evenodd"
                                        ></path>
                                    </svg>
                                </div>
                                Log Out
                            </div>
                        </router-link>
                        <hr />

                        <router-link to="/admissions">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-graduation-cap"></i>
                                </div>
                                Admissions
                            </div>
                        </router-link>

                        <router-link to="/finance">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-briefcase"></i>
                                </div>
                                Finance
                            </div>
                        </router-link>

                        <router-link to="/inventory">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-shop"></i>
                                </div>
                                Inventory
                            </div>
                        </router-link>

                        <router-link to="/hostel">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-warehouse"></i>
                                </div>
                                hostel
                            </div>
                        </router-link>

                        <router-link to="/library">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-book"></i>
                                </div>
                                Library
                            </div>
                        </router-link>
                    </nav>
                    <router-link to="admin/users">
                        <common-button
                            class="mt-10 shadow-sm"
                            button-text="Add New User"
                        ></common-button>
                    </router-link>
                </div>
            </div>
            <div v-if="route.path.includes('/inventory')" class="min-h-96 mt-0">
                <span
                    class="w-full flex justify-center text-center text-xs font-bold"
                >
                    Inventory Module</span
                >
                <div class="relative flex flex-col rounded-x w-full p-2">
                    <nav
                        class="flex flex-col gap-1 p-2 font-sans text-base font-normal text-gray-700 dark:text-slate-300"
                    >
                        <router-link to="/admin/">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-compass"></i>
                                </div>
                                Dashboard
                            </div>
                        </router-link>
                        <router-link to="users">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-users"></i>
                                </div>
                                Manage Users
                            </div>
                        </router-link>

                        <router-link to="profile">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-user"></i>
                                </div>
                                Profile
                            </div>
                        </router-link>

                        <router-link to="settings">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-cog"></i>
                                </div>
                                Settings
                            </div>
                        </router-link>

                        <router-link to="logout">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        viewBox="0 0 24 24"
                                        fill="currentColor"
                                        aria-hidden="true"
                                        class="h-5 w-5"
                                    >
                                        <path
                                            fill-rule="evenodd"
                                            d="M12 2.25a.75.75 0 01.75.75v9a.75.75 0 01-1.5 0V3a.75.75 0 01.75-.75zM6.166 5.106a.75.75 0 010 1.06 8.25 8.25 0 1011.668 0 .75.75 0 111.06-1.06c3.808 3.807 3.808 9.98 0 13.788-3.807 3.808-9.98 3.808-13.788 0-3.808-3.807-3.808-9.98 0-13.788a.75.75 0 011.06 0z"
                                            clip-rule="evenodd"
                                        ></path>
                                    </svg>
                                </div>
                                Log Out
                            </div>
                        </router-link>
                        <hr />

                        <router-link to="/admissions">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-graduation-cap"></i>
                                </div>
                                Admissions
                            </div>
                        </router-link>

                        <router-link to="/finance">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-briefcase"></i>
                                </div>
                                Finance
                            </div>
                        </router-link>

                        <router-link to="/inventory">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-shop"></i>
                                </div>
                                Inventory
                            </div>
                        </router-link>

                        <router-link to="/hostel">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-warehouse"></i>
                                </div>
                                hostel
                            </div>
                        </router-link>

                        <router-link to="/library">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-book"></i>
                                </div>
                                Library
                            </div>
                        </router-link>
                    </nav>
                    <router-link to="admin/users">
                        <common-button
                            class="mt-10 shadow-sm"
                            button-text="Add New User"
                        ></common-button>
                    </router-link>
                </div>
            </div>
            <div v-if="route.path.includes('/hostel')" class="min-h-96 mt-0">
                <span
                    class="w-full flex justify-center text-center text-xs font-bold"
                >
                    Hostel Module</span
                >
                <div class="relative flex flex-col rounded-x w-full p-2">
                    <nav
                        class="flex flex-col gap-1 p-2 font-sans text-base font-normal text-gray-700 dark:text-slate-300"
                    >
                        <router-link to="/hostel/">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-compass"></i>
                                </div>
                                Dashboard
                            </div>
                        </router-link>
                        <router-link to="/hostel/all">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-users"></i>
                                </div>
                                All hostel
                            </div>
                        </router-link>

                        <router-link to="profile">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-user"></i>
                                </div>
                                Profile
                            </div>
                        </router-link>

                        <router-link to="/hostel/settings">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-cog"></i>
                                </div>
                                Settings
                            </div>
                        </router-link>

                        <router-link to="logout">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        viewBox="0 0 24 24"
                                        fill="currentColor"
                                        aria-hidden="true"
                                        class="h-5 w-5"
                                    >
                                        <path
                                            fill-rule="evenodd"
                                            d="M12 2.25a.75.75 0 01.75.75v9a.75.75 0 01-1.5 0V3a.75.75 0 01.75-.75zM6.166 5.106a.75.75 0 010 1.06 8.25 8.25 0 1011.668 0 .75.75 0 111.06-1.06c3.808 3.807 3.808 9.98 0 13.788-3.807 3.808-9.98 3.808-13.788 0-3.808-3.807-3.808-9.98 0-13.788a.75.75 0 011.06 0z"
                                            clip-rule="evenodd"
                                        ></path>
                                    </svg>
                                </div>
                                Log Out
                            </div>
                        </router-link>
                        <hr />

                        <router-link to="/admissions">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-graduation-cap"></i>
                                </div>
                                Admissions
                            </div>
                        </router-link>

                        <router-link to="/finance">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-briefcase"></i>
                                </div>
                                Finance
                            </div>
                        </router-link>

                        <router-link to="/inventory">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-shop"></i>
                                </div>
                                Inventory
                            </div>
                        </router-link>

                        <router-link to="/hostel">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-warehouse"></i>
                                </div>
                                hostel
                            </div>
                        </router-link>

                        <router-link to="/library">
                            <div
                                role="button"
                                tabindex="0"
                                class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none"
                            >
                                <div class="grid place-items-center mr-4">
                                    <i class="pi pi-book"></i>
                                </div>
                                Library
                            </div>
                        </router-link>
                    </nav>
                    <router-link to="admin/users">
                        <common-button
                            class="mt-10 shadow-sm"
                            button-text="Add New User"
                        ></common-button>
                    </router-link>
                </div>
            </div>
        </div>
    </nav>
</template>
<script setup>
import { ref, onMounted, watch } from "vue";
import UserDropdown from "@/components/Dropdowns/UserDropdown.vue";
import { useRoute } from "vue-router";
import { useDark } from "@vueuse/core";
import CommonButton from "../CommonButton.vue";
import SpeedDial from "primevue/speeddial";

const collapseShow = ref("hidden");
const toggleCollapseShow = (classes) => {
    collapseShow.value = classes;
};

const isDark = useDark({ disableTransition: false });
const route = useRoute();
const login = ref(false);

onMounted(() => {
    // Access current route properties directly on route object
    if (route.path === "/login") {
        login.value = true;
    }
});

// Watch for changes in the current route path
watch(
    () => route.path,
    (newPath) => {
        login.value = newPath === "/login";
    },
);
</script>
