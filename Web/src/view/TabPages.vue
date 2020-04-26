<template>
    <div>
<!-- <button class='change__style' @click='changeStyle()'>Change Style</button> -->
        <tabs :mode="mode">
            <tab title="Popular courses"><page1/></tab>
            <tab title="Tab 2"><page2/></tab>
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
    },methods : {
        changeStyle () {
        if (this.mode === 'dark') {
          this.mode = 'light'
        } else {
          this.mode = 'dark'
        }
      }
    }
}
</script>

<style scoped>

</style>