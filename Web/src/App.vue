<template>
  <div id="app">
    <div class="wrapper">
      <tabs :mode="mode">
        <tab title="Tab 1"><canvas id="planet-chart"></canvas></tab>
        <tab title="Tab 2">Hello From Tab 2</tab>
        <tab title="Tab 3">Hello From Tab 3</tab>
        <tab title="Tab 4">Hello From Tab 4</tab>
      </tabs>
    </div>
  </div>
</template>

<script>
import Chart from 'chart.js';

import planetChartData from './charts/chart-data.js';
import Tab from './components/Tab.vue';
import Tabs from './view/Tabs.vue';
export default {
  name: 'App',
  data() {
        return {
            planetChartData: planetChartData,
            mode: 'dark',
        }
    },
    components: {
        Tab,
        Tabs
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
        changeStyle () {
          if (this.mode === 'dark') {
            this.mode = 'light'
          } else {
            this.mode = 'dark'
          }
        }
    },
    mounted() {
        this.createChart('planet-chart', this.planetChartData);
    }
}
</script>

<style>
#app{width:100vh;height:100vw;}
.wrapper {
    width: 100%;
    min-height: 100vh;
    background-color: #f8f8f8;
    margin: 0;
    padding: 20px;
  }
</style>
