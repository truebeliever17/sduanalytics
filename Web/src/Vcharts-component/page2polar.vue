<<template>
    <div>
        <canvas id='polar'></canvas>
    </div>
</template>

<script>
import Chart from 'chart.js';
import data from '../charts-object/mean-gpa';
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
                type:'polarArea',
                data : {
                    datasets: [{
                        borderColor: "rgba(0, 0, 0, 0.4)",
                        data: [this.gpa.y16, this.gpa.y17, this.gpa.y18, this.gpa.y19],
                        backgroundColor: [
                            "#035aa6",
                            "#40bad5",
                            "#fcbf1e",
                            "#120136"
                            ]
                    }],
                    labels: ['16','17','18','19']
                },
                options: {
                    legend: {
                        labels: {
                            fontColor: 'white'
                        }
                    }
                }

            })
        }
    },
    mounted() { 
        this.createChart('polar');
    }

}
</script>

<style scoped>
    
</style>