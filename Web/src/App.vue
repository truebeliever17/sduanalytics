<template>
  <div id="app">
    <div class="wrapper">
      <tabpages/>
    </div>
  </div>
</template>

<script>
import page1 from './view/page1.vue';
import tabpages from './view/TabPages.vue'

export default {
  name: 'App',
  components: {
    tabpages
  }
}
</script>

<style>
#app {
}
.wrapper {
    height: 80%;
    margin: 0;
    padding: 20px;
    overflow: hidden;
  }
</style>
