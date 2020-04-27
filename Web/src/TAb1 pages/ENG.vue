<template>
    <div id="main">
        <div class="grid2x2">
            <div class="box box1"><page1eng2/></div>
            <div class="box box2"><page1eng1/></div>
            <div class="box box3"><page1eng3/></div>
            <div class="box box4"><page1eng4/></div>
        </div>
        
    </div>
</template>
<script>
import page1eng2 from '../Vcharts-component/Page1Eng2';
import page1eng1 from '../Vcharts-component/page1eng1';
import page1eng3 from '../Vcharts-component/Page1Eng3';
import page1eng4 from '../Vcharts-component/Page1Eng4';
export default {
    name: "ENG",
    components: {
        page1eng1,
        page1eng2,
        page1eng3,
        page1eng4
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