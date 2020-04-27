<template>
    <div id="main">
        <div class="grid2x2">
            <div class="box box1"><page1l1/></div>
            <div class="box box2"><page1l2/></div>
            <div class="box box3"><page1l3/></div>
            <div class="box box4"><page1l4/></div>
        </div>
        
    </div>
</template>
<script>
import page1l1 from '../Vcharts-component/page1l1';
import page1l2 from '../Vcharts-component/page1l2';
import page1l3 from '../Vcharts-component/page1l3';
import page1l4 from '../Vcharts-component/page1l4';
export default {
    name: "ENG",
    components: {
        page1l1,
        page1l2,
        page1l3,
        page1l4
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