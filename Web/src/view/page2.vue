<template>
    <div id="l">
        <canvas id='hist'></canvas>
    </div>
</template>

<script>
import Chart from 'chart.js';
var dataValues = [12, 19, 3, 5];
var dataLabels = [0, 1, 2, 3, 4];

export default {
    name: 'page2',
    methods: {
        createChart(chartId) {
            const ctx = document.getElementById(chartId);
            const myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: dataLabels,
                    datasets: [{
                        label: 'Group A',
                        data: dataValues,
                        backgroundColor: 'rgba(255, 99, 132, 1)',
                        }]
                },
                options: {
                    scales: {
                    xAxes: [{
                        display: false,
                        barPercentage: 1.3,
                        ticks: {
                            max: 3,
                        }},
                        {
                        display: true,
                        ticks: {
                            autoSkip: false,
                            max: 4,
                            }
                        }],
                    yAxes: [{
                        ticks: {
                        beginAtZero:true
                        }
                    }]
                    }
                }
                });
        }
    },
    mounted() {
        this.createChart('hist');
    }
}
</script>

<style scoped>
    #l {
        width:300px;
        height:100px;
    }
</style>