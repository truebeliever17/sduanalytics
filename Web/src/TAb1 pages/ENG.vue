<template>
    <div id="main">
        <div class="grid2x2">
            <div class="box box1"><page1eng1/></div>
            <div class="box box2"><div>two</div></div>
            <div class="box box3"><div>three</div></div>
            <div class="box box4"><div>four</div></div>
        </div>
        
    </div>
</template>
<script>
import page1eng1 from '../Vcharts-component/page1eng1';
export default {
    name: "ENG",
    components: {
        page1eng1
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
  flex-basis: calc(50% - 40px);  
  justify-content: center;
  flex-direction: column;
}
.grid2x2 > div > div {
  display: flex;
  justify-content: center;
  flex-direction: row;
}

</style>