<template>

  <b-navbar navbar-background-color="#000000">
    <template slot="brand">
      <b-navbar-item>
        <img src="../../images/logo.png" />
      </b-navbar-item>
    </template>
    <template slot="start">
      <b-navbar-item href="#">
        Home
      </b-navbar-item>
      <b-navbar-item href="#">
        Documentation
      </b-navbar-item>
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
