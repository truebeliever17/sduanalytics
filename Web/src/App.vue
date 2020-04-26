<template>
  <div id="app">
    <navbar></navbar>
    <router-view> </router-view>
  </div>
</template>

<script>
import navbar from "./components/Navbar.vue";

export default {
  name: "App",
  components: {
    navbar,
  },
};
</script>

<style lang="scss">
@import "~bulma/sass/utilities/_all";
@import "https://use.fontawesome.com/releases/v5.2.0/css/all.css";
@import "https://cdn.materialdesignicons.com/2.5.94/css/materialdesignicons.min.css";
@import "https://unpkg.com/boxicons@2.0.5/css/boxicons.min.css";
$default-dark: #232931;
$default-gray: #969696;
$colors: (
  "default-dark": (
    $default-dark,
    $default-dark,
  ),
);
$navbar-background-color: $default-dark;
$navbar-item-color: $default-gray;
$navbar-item-hover-background-color: #2b323b;
$navbar-item-hover-color: #fff;
$navbar-item-img-max-height: 4rem;

$menu-item-color: $default-gray;
$menu-item-hover-color: white;
$menu-item-hover-background-color: #333b45;

$button-border-width: 0em;
$button-border-color: transparent;
$button-background-color: transparent;
$button-color: $default-gray;
$button-hover-color: white;
$button-border-color: transparent;
$button-focus-border-color: transparent;
$button-active-color: white;
$button-active-border-color: transparent;

$input-background-color: $default-dark;
$input-hover-border-color: #3f4957;
$input-border-color: #333b45;
$input-color: #a2a6ab;
$label-color: #a2a6ab;
$input-icon-color: #7c838f;
$input-icon-active-color: #c7cbd1;
button.vs-pagination__button,
button.vs-pagination__arrow {
  background-color: #2b333d;
  color: #a2a6ab;
  fill: #a2a6ab;
}

i.vs-icon-arrow:before,
i.vs-icon-arrow:after {
  background-color: #a2a6ab;
}

button.vs-pagination__button:hover,
button.vs-pagination__arrow:hover {
  i.vs-icon-arrow:before,
  i.vs-icon-arrow:after {
    background-color: white;
  }
  background-color: #353e4a;
  color: white;
}
#app {
  min-height: 100vh;
  background-color: #232931;
  width:100%;
  height: 50.95vw;// for Sultans Laptop.
}

@import "~bulma";
@import "~buefy/src/scss/buefy";
</style>
