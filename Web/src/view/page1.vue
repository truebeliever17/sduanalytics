<template>
    <div id='main'>
        <tabs :mode="mode">
            <tab title="Engineering & Natural Sciences"><ENG/></tab>
            <tab title="Education & Humanities"><eduhum/></tab>
            <tab title="Business School"><BS/></tab>
            <tab title="Law & Social Science"><Law/></tab>
        </tabs>
    </div>    
</template>

<script>
import Tab from '../components/Tab';
import Tabs from '../components/Tabs';
import ENG from '../TAb1 pages/ENG';
import eduhum from '../TAb1 pages/EduHuman';
import BS from '../TAb1 pages/BS';
import Law from '../TAb1 pages/Law';

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
        ENG,
        eduhum,
        BS,
        Law
    }
    
}
</script>

<style scoped>
    #main{
        height: 630px;
    }

    
</style>