<template>
    <div id='main'>
        <tabs :mode="mode">
            <tab title="Engeniering"><ENG/></tab>
            <tab title="Philo">TFL</tab>
            <tab title="BS">Hello From Tab 3</tab>
            <tab title="urfac">Hello From Tab 4</tab>
        </tabs>
    </div>    
</template>

<script>
import Tab from '../components/Tab';
import Tabs from '../components/Tabs';
import ENG from '../TAb1 pages/ENG';
export default {
    name: 'page1',
    data() {
        return {
            mode: 'dark'
        }
    },
    components: {
        Tab,
        Tabs,
        ENG
    }
    
}
</script>

<style scoped>
    
    
</style>