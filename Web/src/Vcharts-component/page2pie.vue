<<template>
  <div>
    <canvas id="pie"></canvas>
  </div>
</template>

<script>
import Chart from "chart.js";
import data from "../charts-object/gpa_counts";
export default {
  name: "page2",
  data() {
    return {
      gpa: data,
    };
  },
  methods: {
    createChart(chartId) {
      const ctx = document.getElementById(chartId);
      const myChart = new Chart(ctx, {
        type: "bar",
        labels: ["GPA Count"],
        data: {
          datasets: [
            {
              label: "GPA < 1.67",
              borderColor: "rgba(65, 75, 209, 1)",
              borderWidth: 1,
              backgroundColor: "rgba(65, 75, 209, 0.2)",
              data: [data.l],
            },
            {
              label: "1.67 <= GPA <= 3",
              borderColor: "rgba(244, 3, 252, 1)",
              borderWidth: 1,
              backgroundColor: "rgba(244, 3, 252, 0.2)",
              data: [data.m],
            },
            {
              label: "GPA > 3",
              borderColor: "rgba(33, 235, 100, 1)",
              borderWidth: 1,
              backgroundColor: "rgba(33, 235, 100, 0.2)",
              data: [data.h],
            },
          ],
        },
        
      });
    },
  },
  mounted() {
    this.createChart("pie");
  },
};
</script>

<style scoped></style>
