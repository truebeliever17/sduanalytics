<template>
    <div>
<!-- <button class='change__style' @click='changeStyle()'>Change Style</button> -->
        <tabs :mode="mode">
            <tab id='tab1' title="Popular courses"><page1/></tab>
            <tab title="GPA"><page2/></tab>
            <tab title="Tab 3">Hello From Tab 3</tab>
            <tab title="Tab 4">Hello From Tab 4</tab>
        </tabs>
    </div>
</template>

<script>
import page1 from './page1.vue';
import page2 from './page2.vue'
import Tab from '../components/Tab.vue';
import Tabs from '../components/Tabs.vue';
export default {
    name:'tabpages',
    data(){ 
        return {
            mode: 'dark'
        }
    },
    components : {
        page2,
        page1,
        Tab,
        Tabs
    }
}
</script>

<style scoped>
    #tab1 {
        height: 800px;
    }
</style>