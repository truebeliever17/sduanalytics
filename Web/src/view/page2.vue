<template>
  <div>
    <h1>General statistics of GPA</h1>
    <div id="l">
      <!-- <div><page2polar style="height:300px; width:300px;"/></div> -->
      <div>
        <div>
          <h3>Average GPA by terms</h3>
          <page2radar />
        </div>
      </div>
      <div>
        <h3>GPA counts</h3>
        <page2pie />
      </div>
    </div>
  </div>
</template>

<script>
import page2radar from "../Vcharts-component/page2radar";
import page2pie from "../Vcharts-component/page2pie";
export default {
  name: "page2",
  components: {
    page2radar,
    page2pie,
  },
};
</script>

<style scoped>
h1 {
  text-align: center;
  color: white;
  text-align: center;
  font-size: 2em;
  font-weight: bold;
  margin: 0 0 5rem 0;
}

h3 {
  margin-bottom: 5px;
}
#l {
  min-height: 100%;
  display: flex;
  flex-direction: row;
  justify-content: center;
  flex-wrap: wrap;
}
#l > div {
  display: flex;
  flex-basis: calc(45%);
  border: 1px solid #282f38;
  border-radius: 3px;
  margin: 10px;
  padding: 10px;
  justify-content: center;
  flex-direction: column;
  min-height: 300px;
}
div {
  text-align: center;
}
</style>
