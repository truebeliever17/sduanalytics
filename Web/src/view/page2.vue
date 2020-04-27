<template>
    <div>
        <h1>General statistics of GPA</h1>
        <div id="l"><!-- <div><page2polar style="height:300px; width:300px;"/></div> -->
            <div>
                <div>
                    <h3>Average GPA by terms</h3>
                    <page2radar/>
                </div>
                <div>
                    <h3>Average GPA by year</h3>
                    <page2polar/>
                </div>
            </div>
            <div>
                <h3>GPA counts</h3>
                <page2pie/>
            </div>
        </div>
    </div>
</template>

<script>
import page2polar from '../Vcharts-component/page2polar';
import page2radar from '../Vcharts-component/page2radar';
import page2pie from '../Vcharts-component/page2pie';
export default {
    name: 'page2',
    components: {
        page2polar,
        page2radar,
        page2pie
    }

}
</script>

<style scoped>
    #l { min-height: 100%;
  display: flex;
  flex-direction: row;
    }
    #l > div{
  display: flex; 
  flex-basis: calc(49%);  
  justify-content: center;
  flex-direction: column;
  min-height: 300px;
    }
    div{text-align: center;}
</style>