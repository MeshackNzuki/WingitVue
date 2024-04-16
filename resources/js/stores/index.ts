import { defineStore } from "pinia";
import { toast } from "vue3-toastify";
import axios from "axios";

export const useShoppingStore = defineStore("shopping", {
    persist: true,
    state: () => {
        return {
            products: [
                {
                    id: 1,
                    name: "Iphone 12",
                    price: 700,
                    image: "https://cdn.pixabay.com/photo/2016/11/20/08/33/camera-1842202__480.jpg",
                },
                {
                    id: 2,
                    name: "Samsung s10",
                    price: 400,
                    image: "https://cdn.pixabay.com/photo/2016/03/27/19/43/samsung-1283938__340.jpg",
                },
                {
                    id: 3,
                    name: "Samsung Tv",
                    price: 1200,
                    image: "https://cdn.pixabay.com/photo/2019/06/30/18/19/tv-4308538__480.jpg",
                },
                {
                    id: 4,
                    name: "Huwawei Mate",
                    price: 900,
                    image: "https://cdn.pixabay.com/photo/2017/08/11/14/19/honor-2631271__340.jpg",
                },
                {
                    id: 5,
                    name: "Huwawei Mate",
                    price: 900,
                    image: "  https://images.pexels.com/photos/2857040/pexels-photo-2857040.jpeg",
                },
                {
                    id: 6,
                    name: "Huwawei Mate",
                    price: 900,
                    image: "  https://images.pexels.com/photos/2857040/pexels-photo-2857040.jpeg",
                },
                {
                    id: 7,
                    name: "Huwawei Mate",
                    price: 900,
                    image: "  https://images.pexels.com/photos/2857040/pexels-photo-2857040.jpeg",
                },
                {
                    id: 8,
                    name: "Huwawei Mate",
                    price: 900,
                    image: "  https://images.pexels.com/photos/2857040/pexels-photo-2857040.jpeg",
                },
                {
                    id: 9,
                    name: "Huwawei Mate",
                    price: 900,
                    image: "  https://images.pexels.com/photos/2857040/pexels-photo-2857040.jpeg",
                },
                {
                    id: 10,
                    name: "Huwawei Mate",
                    price: 900,
                    image: "https://cdn.pixabay.com/photo/2017/08/11/14/19/honor-2631271__340.jpg",
                },
                {
                    id: 11,
                    name: "Huwawei Mate",
                    price: 900,
                    image: "  https://images.pexels.com/photos/2857040/pexels-photo-2857040.jpeg",
                },
                {
                    id: 12,
                    name: "Huwawei Mate",
                    price: 900,
                    image: "  https://images.pexels.com/photos/2857040/pexels-photo-2857040.jpeg",
                },
                {
                    id: 13,
                    name: "Huwawei Mate",
                    price: 900,
                    image: "  https://images.pexels.com/photos/2857040/pexels-photo-2857040.jpeg",
                },
                {
                    id: 14,
                    name: "Huwawei Mate",
                    price: 900,
                    image: "  https://images.pexels.com/photos/2857040/pexels-photo-2857040.jpeg",
                },
                {
                    id: 15,
                    name: "Huwawei Mate",
                    price: 900,
                    image: "  https://images.pexels.com/photos/2857040/pexels-photo-2857040.jpeg",
                },
                {
                    id: 16,
                    name: "Huwawei Mate",
                    price: 900,
                    image: "  https://images.pexels.com/photos/2857040/pexels-photo-2857040.jpeg",
                },
                {
                    id: 17,
                    name: "Huwawei Mate",
                    price: 900,
                    image: "https://images.pexels.com/photos/2529147/pexels-photo-2529147.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                },
            ],
            cartItems: [],
            phoneNumber: "+254703440095",
            open: false,
            catOpen: false,
        };
    },
    getters: {
        countCartItems() {
            return this.cartItems.length;
        },
        getCartItems() {
            return this.cartItems;
        },
        sidebarState() {
            return this.open;
        },
        catOpenState() {
            return this.catOpen;
        },
    },
    actions: {
        toggleSidebar() {
            this.open = !this.open;
        },
        toggleCatOpen() {
            console.log("happened");
            this.catOpen = !this.catOpen;
            console.log("happened", this.catOpen);
        },
        addToCart(item) {
            let index = this.cartItems.findIndex(
                (product) => product.id === item.id,
            );
            if (index !== -1) {
                this.products[index].quantity += 1;
                toast(item.name + " " + "has been updated", {
                    transition: toast.TRANSITIONS.ZOOM,
                    position: toast.POSITION.TOP_CENTER,
                });
            } else {
                item.quantity = 1;
                this.cartItems.push(item);
                toast.success(item.name + " " + "added to cart", {
                    transition: toast.TRANSITIONS.ZOOM,
                    position: toast.POSITION.TOP_CENTER,
                });
            }
        },
        incrementQ(item) {
            let index = this.cartItems.findIndex(
                (product) => product.id === item.id,
            );
            if (index !== -1) {
                this.cartItems[index].quantity += 1;
                toast(item.name + " " + "has been updated", {
                    transition: toast.TRANSITIONS.ZOOM,
                    position: toast.POSITION.TOP_CENTER,
                });
            }
        },
        decrementQ(item) {
            let index = this.cartItems.findIndex(
                (product) => product.id === item.id,
            );
            if (index !== -1) {
                this.cartItems[index].quantity -= 1;
                if (this.cartItems[index].quantity === 0) {
                    this.cartItems = this.cartItems.filter(
                        (product) => product.id !== item.id,
                    );
                }
                toast(item.name + " " + "has been updated", {
                    transition: toast.TRANSITIONS.ZOOM,
                    position: toast.POSITION.TOP_CENTER,
                });
            }
        },
        removeFromCart(item) {
            this.cartItems = this.cartItems.filter(
                (product) => product.id !== item.id,
            );
            // Swal.fire({
            //   position: 'top-end',
            //   icon: 'success',
            //   title: 'Your item has been removed',
            //   showConfirmButton: false,
            //   timer: 1500
            // });
            toast.warning(item.name + " " + "has been removed", {
                transition: toast.TRANSITIONS.ZOOM,
                position: toast.POSITION.TOP_CENTER,
            });
        },
        initiateSTK(phone) {
            let regex = /^(07|01)[0-9]{8}$/;
            if (phone === null || !regex.test(phone)) {
                toast.warning("🤔 Is the Mpesa number Right?", {
                    transition: toast.TRANSITIONS.ZOOM,
                    position: toast.POSITION.TOP_CENTER,
                });
            } else {
                const stkrequest = axios.post("/stk-request", { phone: phone });

                console.log("Starting promise execution");

                toast
                    .promise(
                        stkrequest,
                        {
                            pending: "Waiting for Safaricom...",
                        },
                        {
                            position: toast.POSITION.TOP_CENTER,
                        },
                    )
                    .then(() => {
                        toast.success(
                            "Please check your mobile to input MPESA PIN 😊",
                            {
                                transition: toast.TRANSITIONS.ZOOM,
                                position: toast.POSITION.TOP_CENTER,
                            },
                        );
                    })
                    .catch((error) => {
                        console.log("error", error);
                        toast.warning("An error occurred 🤯", {
                            transition: toast.TRANSITIONS.ZOOM,
                            position: toast.POSITION.TOP_CENTER,
                        });
                    });
            }
        },
    },
});
