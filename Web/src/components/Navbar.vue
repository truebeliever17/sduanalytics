<template>
  <b-navbar navbar-background-color="#000000">
    <template slot="brand">
      <b-navbar-item>
        <img src='../assets/logo.png'/>
      </b-navbar-item>
    </template>
    <template slot="start">
      <router-link to="/" tag="b-navbar-item" replace>
        Home
      </router-link>
      <router-link to="/services" tag="b-navbar-item" replace>
        Services
      </router-link>
    </template>

    <template slot="end">
      <sidebar></sidebar>
    </template>
  </b-navbar>
</template>

<script>
import sidebar from "./Sidebar.vue";
export default {
  components: {
    sidebar,
  },
};
</script>

<style>
</style>
