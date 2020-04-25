<template>
    <div id='main'>
        <div id="first"><canvas id="planet-chart"></canvas></div>
        <div id='ss'>
            <div id="second"><canvas id="planet-chart2"></canvas></div>
            <div id="third"><canvas id='his'></canvas></div>
        </div>
    </div>    
</template>

<script>
import Chart from 'chart.js';
import planetChartData from '../charts-object/chart-data.js';
import dat from '../charts-object/hist.js'
export default {
    name: 'page1',
    data() {
        return {
            planetChartData: planetChartData,
            dat: dat
        }
    },
    methods: {
        createChart(chartId, chartData) {
            const ctx = document.getElementById(chartId);
            const myChart = new Chart(ctx, {
            type: chartData.type,
            data: chartData.data,
            options: chartData.options,
          });
        },
    },
    mounted() {
        this.createChart('planet-chart', this.planetChartData);
        this.createChart('planet-chart2', this.planetChartData);
        this.createChart('his', this.dat);
        
    }
}
</script>

<style scoped>
    #main {
        display: flex;
        flex-flow: wrap;
        justify-content: space-around;
    }
    #first{
        text-align: center;
        width: 60%;
        height:30vw;
    }
    #ss {
        width: 30%; 
        height: 30vw;
        margin-right: 5vh;
    }
    
</style>