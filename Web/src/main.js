import Vue from "vue";
import VueRouter from "vue-router";
import App from "./App.vue";
import Home from "./view/Home.vue";
import Services from "./view/Services.vue";
import Vuesax from "vuesax";
import Buefy from "buefy";
import "vuesax/dist/vuesax.css";
import "material-icons/iconfont/material-icons.css";

Vue.use(Vuesax);
Vue.use(VueRouter);
Vue.use(Buefy);

const routes = [
  { path: "/", component: Home },
  { path: "/services", component: Services },
];

const router = new VueRouter({
  routes,
});

Vue.config.productionTip = false;

new Vue({
  el: "#app",
  router,
  render: (h) => h(App),
});
