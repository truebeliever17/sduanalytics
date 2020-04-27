<template>
    <div id="main">
        <div class="grid2x2">
            <div class="box box1"><page1hum1/></div>
            <div class="box box2"><page1hum2/></div>
            <div class="box box3"><page1hum3/></div>
            <div class="box box4"><page1hum4/></div>
        </div>
        
    </div>
</template>
<script>
import page1hum1 from '../Vcharts-component/page1hum1';
import page1hum2 from '../Vcharts-component/page1hum2';
import page1hum3 from '../Vcharts-component/page1hum3';
import page1hum4 from '../Vcharts-component/page1hum4';
export default {
    name: "ENG",
    components: {
        page1hum1,
        page1hum2,
        page1hum3,
        page1hum4
    }
}
</script>

<style scoped>
.grid2x2 {
  min-height: 100%;
  display: flex;
  flex-wrap: wrap;
  flex-direction: row;
  justify-content: space-between;
}
.grid2x2 > div {
  display: flex; 
  flex-basis: calc(49%);  
  justify-content: center;
  flex-direction: column;
  max-height: 300px;
}

</style>