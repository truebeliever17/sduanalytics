<template>
    <div>
        <canvas id='chart1'></canvas>
    </div>
</template>


<script>

import Chart from 'chart.js';
export default {
    name: 'chart1',
    data() {
        return {
            chartData : JSON.parse('{"labels":["09\/01\/2018#02\/01\/2018","10\/01\/2018#03\/01\/2018","11\/01\/2018#04\/01\/2018","12\/01\/2018#05\/01\/2018","13\/01\/2018#06\/01\/2018","14\/01\/2018#07\/01\/2018","15\/01\/2018#08\/01\/2018"],"values_first":[190,128,59.5,171,66,102,132],"values_second":[342.81,752,1336.5,1999.07,1989.07,36,204]}'),
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
                        borderColor: "#E25F5F",
                        label: 'Period 1',
                        data: this.chartData.values_first,
                        borderWidth: 3,
                        xAxisID: "x-axis-1",
                    },
                    {

                        type: 'line',
                        borderColor: "#2793DB",
                        label: 'Period 2',
                        data: this.chartData.values_second,
                        borderWidth: 3,
                        xAxisID: "x-axis-2",
                        
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
                                labelString: 'Period 1'
                            },
                            time: {
                            displayFormats: {
                                'day': 'MMM DD',
                                'week': 'MMM DD',
                                'month': 'MMM DD',
                                'quarter': 'MMM DD',
                                'year': 'MMM DD',
                            }
                            },
                            id: "x-axis-1",
                            ticks:{
                                callback:function(label) {

                                var label = label.split("#")[0];
                                return label;

                                }
                            }
                            },
                            {
                            display: true,
                            tipe: "time",
                            id: "x-axis-2",
                            scaleLabel: {
                                display: true,
                                labelString: 'Period 2' 
                        }, 
                        id: "x-axis-2",
                        ticks:{
                                callback:function(label) {
                                var label = label.split("#")[1];
                                return label;
                                }
                            }
                    }
                        ],
                        yAxes: [{
                        display: true,
                        scaleLabel: {
                            display: true,
                            labelString: 'Totale'
                        },
                        ticks: {
                            callback: function(value, index, values) {
                                return value.toLocaleString("de-DE",{style:"currency", currency:"EUR"});
                            }
                        }
                        }]
                    }
                }
            });
        }
    },
    mounted() {
        this.createChart('chart1');
    }
    
}
</script>
<style scoped>
</style>