<template>
    <div id="main">
        <div class="grid2x2">
            <div class="box box1"><page1bs1/></div>
            <div class="box box2"><page1bs2/></div>
            <div class="box box3"><page1bs3/></div>
            <div class="box box4"><page1bs4/></div>
        </div>
        
    </div>
</template>
<script>
import page1bs1 from '../Vcharts-component/page1bs1';
import page1bs2 from '../Vcharts-component/page1bs2';
import page1bs3 from '../Vcharts-component/page1bs3';
import page1bs4 from '../Vcharts-component/page1bs4';
export default {
    name: "ENG",
    components: {
        page1bs1,
        page1bs2,
        page1bs3,
        page1bs4
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