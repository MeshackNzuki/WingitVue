<template>
    <div class="p-3">
        <div class="overflow-x-auto rounded-md shadow-md">
            <div
                class="bg-lime-100 h-10 p-1 flex flex-row justify-between px-4 items-center"
            >
                <span class="font-bold">Title</span>
                <span class="font-light">Rows : 249</span>
                <span>
                    <div class="form-control">
                        <input
                            type="text"
                            placeholder="Search this table"
                            class="input input-sm input-bordered w-24 md:w-auto"
                        /></div
                ></span>
                <span class="flex flex-row gap-2">
                    <Button
                        icon="pi pi-plus"
                        class="mr-2"
                        severity="secondary"
                    />
                    <Button
                        icon="pi pi-print"
                        class="mr-2"
                        severity="secondary"
                    />
                    <Button icon="pi pi-upload" severity="secondary" />
                </span>
                <i class="pi pi-spin pi-cog"></i>
            </div>
            <table class="table-auto w-full bg-slate-50 dark:bg-slate-800">
                <thead
                    class="text-xs font-semibold uppercase text-gray-400 bg-gray-50"
                >
                    <tr>
                        <th class="p-2 whitespace-nowrap">
                            <div class="font-semibold text-left">Name</div>
                        </th>
                        <th class="p-2 whitespace-nowrap">
                            <div class="font-semibold text-left">Email</div>
                        </th>
                        <th class="p-2 whitespace-nowrap">
                            <div class="font-semibold text-left">Spent</div>
                        </th>
                        <th class="p-2 whitespace-nowrap">
                            <div class="font-semibold text-center">Country</div>
                        </th>
                    </tr>
                </thead>
                <tbody
                    class="text-sm divide-y divide-gray-100 dark:divide-slate-500 text-gray-600 dark:text-lime-50"
                >
                    <tr>
                        <td class="p-2 whitespace-nowrap">
                            <div class="flex items-center">
                                <div
                                    class="w-10 h-10 flex-shrink-0 mr-2 sm:mr-3"
                                >
                                    <img
                                        class="rounded-full"
                                        src="https://raw.githubusercontent.com/cruip/vuejs-admin-dashboard-template/main/src/images/user-36-05.jpg"
                                        width="40"
                                        height="40"
                                        alt="Alex Shatov"
                                    />
                                </div>
                                <div class="font-medium text-gray-800">
                                    Alex Shatov
                                </div>
                            </div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-left">alexshatov@gmail.com</div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-left font-medium text-green-500">
                                $2,890.66
                            </div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-lg text-center">🇺🇸</div>
                        </td>
                    </tr>
                    <tr>
                        <td class="p-2 whitespace-nowrap">
                            <div class="flex items-center">
                                <div
                                    class="w-10 h-10 flex-shrink-0 mr-2 sm:mr-3"
                                >
                                    <img
                                        class="rounded-full"
                                        src="https://raw.githubusercontent.com/cruip/vuejs-admin-dashboard-template/main/src/images/user-36-06.jpg"
                                        width="40"
                                        height="40"
                                        alt="Philip Harbach"
                                    />
                                </div>
                                <div class="font-medium text-gray-800">
                                    Philip Harbach
                                </div>
                            </div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-left">philip.h@gmail.com</div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-left font-medium text-green-500">
                                $2,767.04
                            </div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-lg text-center">🇩🇪</div>
                        </td>
                    </tr>
                    <tr>
                        <td class="p-2 whitespace-nowrap">
                            <div class="flex items-center">
                                <div
                                    class="w-10 h-10 flex-shrink-0 mr-2 sm:mr-3"
                                >
                                    <img
                                        class="rounded-full"
                                        src="https://raw.githubusercontent.com/cruip/vuejs-admin-dashboard-template/main/src/images/user-36-07.jpg"
                                        width="40"
                                        height="40"
                                        alt="Mirko Fisuk"
                                    />
                                </div>
                                <div class="font-medium text-gray-800">
                                    Mirko Fisuk
                                </div>
                            </div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-left">mirkofisuk@gmail.com</div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-left font-medium text-green-500">
                                $2,996.00
                            </div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-lg text-center">🇫🇷</div>
                        </td>
                    </tr>
                    <tr>
                        <td class="p-2 whitespace-nowrap">
                            <div class="flex items-center">
                                <div
                                    class="w-10 h-10 flex-shrink-0 mr-2 sm:mr-3"
                                >
                                    <img
                                        class="rounded-full"
                                        src="https://raw.githubusercontent.com/cruip/vuejs-admin-dashboard-template/main/src/images/user-36-08.jpg"
                                        width="40"
                                        height="40"
                                        alt="Olga Semklo"
                                    />
                                </div>
                                <div class="font-medium text-gray-800">
                                    Olga Semklo
                                </div>
                            </div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-left">olga.s@cool.design</div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-left font-medium text-green-500">
                                $1,220.66
                            </div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-lg text-center">🇮🇹</div>
                        </td>
                    </tr>
                    <tr>
                        <td class="p-2 whitespace-nowrap">
                            <div class="flex items-center">
                                <div
                                    class="w-10 h-10 flex-shrink-0 mr-2 sm:mr-3"
                                >
                                    <img
                                        class="rounded-full"
                                        src="https://raw.githubusercontent.com/cruip/vuejs-admin-dashboard-template/main/src/images/user-36-09.jpg"
                                        width="40"
                                        height="40"
                                        alt="Burak Long"
                                    />
                                </div>
                                <div class="font-medium text-gray-800">
                                    Burak Long
                                </div>
                            </div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-left">longburak@gmail.com</div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-left font-medium text-green-500">
                                $1,890.66
                            </div>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-lg text-center">🇬🇧</div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>
<script setup>
import Button from "primevue/button";
</script>
