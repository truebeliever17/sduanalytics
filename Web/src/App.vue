<template>
  <div id="app">
    <navbar></navbar>
    <div class="wrapper">
      <tabpages />
    </div>
  </div>
</template>

<script>
import page1 from "./view/page1.vue";
import tabpages from "./view/TabPages.vue";
import navbar from "./view/Navbar.vue";

export default {
  name: "App",
  components: {
    tabpages,
    navbar,
  },
};
</script>

<style lang="scss">
@import "~bulma/sass/utilities/_all";
@import "https://use.fontawesome.com/releases/v5.2.0/css/all.css";
@import "https://cdn.materialdesignicons.com/2.5.94/css/materialdesignicons.min.css";
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
$navbar-item-img-max-height: 4rem;

$menu-item-color: $default-gray;

$button-border-width: 0em;
$button-border-color: transparent;
$button-background-color: transparent;
$button-color: $default-gray;
$button-hover-color: white;
$button-border-color: transparent;
$button-focus-border-color: transparent;
$button-active-color: white;
$button-active-border-color: transparent;

#app {
  background-color: #232931;
}
.wrapper {
  height: 80%;
  margin: 0;
  padding: 20px;
  overflow: hidden;
}
@import "~bulma";
@import "~buefy/src/scss/buefy";
</style>
