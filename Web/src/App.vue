<template>
  <div id="app">
    <navbar></navbar>
    <router-view> </router-view>
  </div>
</template>

<script>
import navbar from "./view/Navbar.vue";

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
$input-border-color: #333b45;
$input-color: #a2a6ab;

#app {
  background-color: #232931;
}

@import "~bulma";
@import "~buefy/src/scss/buefy";
</style>
