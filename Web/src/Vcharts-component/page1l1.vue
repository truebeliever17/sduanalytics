<template>
    <div>
        <canvas id='chart13'></canvas>
    </div>
</template>


<script>

import Chart from 'chart.js';
import data from '../charts-object/law'
export default {
    name: 'chart1',
    data() {
        return {
            chartData : data.y16
        }
    },
    methods: {
        createChart(chartId) {
            const ctx = document.getElementById(chartId);
            const myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: this.chartData.labels,
                    datasets: [{
                        type: 'line',
                        borderColor: "#white",
                        label: '2016',
                        data: this.chartData.data,
                        borderWidth: 3,
                        xAxisID: "x-axis-1",
                        borderColor: "#bae755",
                        backgroundColor: "#e755ba",
                        pointBackgroundColor: "#55bae7",
                        pointBorderColor: "#55bae7",
                        pointHoverBackgroundColor: "#55bae7",
                        pointHoverBorderColor: "#55bae7",
                    },


                    ]

                },

                options: {
                    tooltips: {
                        mode: 'index',
                        intersect: true
                    },
                    scales: {
                        xAxes: [{
                            display: true,
                            tipe: "time",
                            scaleLabel: {
                                display: true,
                                labelString: '2016'
                            },
                            
                            id: "x-axis-1",
                            ticks:{
                                callback:function(label) {

                                var label = label.split("#")[0];
                                return label;

                                }
                            }
                            },
                        ],
                        yAxes: [{
                        display: true,
                        scaleLabel: {
                            display: true,
                            labelString: 'Student Count'
                        }
                        }]
                    }
                }
            });
        }
    },
    mounted() {
        this.createChart('chart13');
    }
    
}
</script>
<style scoped>
</style>