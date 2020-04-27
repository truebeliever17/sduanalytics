<<template>
    <div>
        <canvas id='pie'></canvas>
    </div>
</template>

<script>
import Chart from 'chart.js';
import data from '../charts-object/gpa_counts'
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
                type:'pie',
                data :{
                    labels: ["GPA < 1.67", "1.67<GPA<3", "GPA>3"],
                    datasets: [{
                        label: "2016",
                        backgroundColor: ["rgba(200,0,0,0.2)",'rgba(200,0,200,0.2)',"rgba(0,0,200,0.2)"],
                        data: [data.l, data.m, data.h]
                    }
                    ]
                    }

            })
        }
    },
    mounted() { 
        this.createChart('pie');
    }

}
</script>

<style scoped>
    
</style>