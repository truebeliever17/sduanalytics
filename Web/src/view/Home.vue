<template>
  <div class="wrapper">
    <tabpages />
  </div>
</template>

<script>
import page1 from "./page1.vue";
import tabpages from "./TabPages.vue";

export default {
  name: "Home",
  components: {
    tabpages,
  },
};
</script>

<style>
.wrapper {
  height: 80%;
  margin: 0;
  padding: 20px;
  overflow: hidden;
}
</style>
