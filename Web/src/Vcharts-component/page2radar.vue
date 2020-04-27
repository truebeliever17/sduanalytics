<<template>
    <div>
        <canvas id='radar'></canvas>
    </div>
</template>

<script>
import Chart from 'chart.js';
import data from '../charts-object/gpa-terms';
export default {
    name: 'page2',
    data() {
        return {
            gpa : data,
        }
    },
    methods: {
        createChart(chartId) {
            const ctx = document.getElementById(chartId);
            const myChart = new Chart(ctx, {
                type:'radar',
                data :{
                    labels: ["Term-1", "Term-2", "Term-3"],
                    datasets: [{
                        label: "2016",
                        backgroundColor: "rgba(12, 237, 185,0.3)",
                        data: [this.gpa.y16[0], this.gpa.y16[1], this.gpa.y16[2]]
                    }, {
                        label: "2017",
                        backgroundColor: "rgba(143, 79, 232, 0.5)",
                        data: [this.gpa.y17[0], this.gpa.y17[1], this.gpa.y17[2]]
                    },
                    {
                        label: "2018",
                        backgroundColor: "rgba(219, 4, 4, 0.5)",
                        data: [this.gpa.y18[0], this.gpa.y18[1], this.gpa.y18[2]]
                    },
                    {
                        label: "2019",
                        backgroundColor: "rgba(56, 14, 171, 0.2)",
                        data: [this.gpa.y19[0], this.gpa.y19[1], 1.7]
                    }
                    ]
                    },

                    options: {
                        legend: {
                            labels: {
                            }
                        }
                    }

            })
        }
    },
    mounted() { 
        this.createChart('radar');
    }

}
</script>

<style scoped>
    
</style>