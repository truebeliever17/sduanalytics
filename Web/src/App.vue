<template>
  <div id="app">
    Hello
    <canvas id="planet-chart"></canvas>
  </div>
</template>

<script>
import Chart from 'chart.js';


import planetChartData from './chart-data.js';
export default {
  name: 'App',
  data() {
        return {
            planetChartData: planetChartData,
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
        }
    },
    mounted() {
        this.createChart('planet-chart', this.planetChartData);
    }
}
</script>

<style>

</style>
