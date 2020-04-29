<<template>
  <div>
    <canvas id="radar"></canvas>
  </div>
</template>

<script>
import Chart from "chart.js";
import data from "../charts-object/gpa-terms";
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
        type: "line",
        data: {
          labels: ["Term 1", "Term 2", "Term 3"],
          datasets: [
            {
              type: "line",
              label: "2016",
              data: [this.gpa.y16[0], this.gpa.y16[1], this.gpa.y16[2]],
              borderWidth: 2,
              xAxisID: "x-axis-1",
              borderColor: "#414bd1",
              backgroundColor: "rgba(65, 75, 209, 0.05)",
              pointBackgroundColor: "#2d333b",

              pointHoverRadius: 5,
              pointHoverBackgroundColor: "#55bae7",
              pointHoverBorderColor: "#55bae7",
            },
            {
              type: "line",
              label: "2017",
              data: [this.gpa.y17[0], this.gpa.y17[1], this.gpa.y17[2]],
              borderWidth: 2,
              xAxisID: "x-axis-1",
              borderColor: "#db1887",
              backgroundColor: "rgba(219, 24, 135, 0.05)",
              pointBackgroundColor: "#2d333b",

              pointHoverRadius: 5,
              pointHoverBackgroundColor: "#55bae7",
              pointHoverBorderColor: "#55bae7",
            },
            {
              type: "line",
              label: "2018",
              data: [this.gpa.y18[0], this.gpa.y18[1], this.gpa.y18[2]],
              borderWidth: 2,
              xAxisID: "x-axis-1",
              borderColor: "#21eb64",
              backgroundColor: "rgba(33, 235, 100, 0.05)",
              pointBackgroundColor: "#2d333b",

              pointHoverRadius: 5,
              pointHoverBackgroundColor: "#55bae7",
              pointHoverBorderColor: "#55bae7",
            },
          ],
        },

        options: {
          tooltips: {
            mode: "index",
            intersect: true,
          },
          scales: {
            xAxes: [
              {
                display: true,
                tipe: "time",
                scaleLabel: {
                  display: true,
                },

                id: "x-axis-1",
                ticks: {
                  callback: function(label) {
                    var label = label.split("#")[0];
                    return label;
                  },
                },
              },
            ],
            yAxes: [
              {
                display: true,
                scaleLabel: {
                  display: true,
                  labelString: "GPA",
                },
              },
            ],
          },
        },
      });
    },
  },
  mounted() {
    this.createChart("radar");
  },
};
</script>

<style scoped></style>
