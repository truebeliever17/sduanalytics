<template>
  <div>
    <canvas id="chart7"></canvas>
  </div>
</template>

<script>
import Chart from "chart.js";
import data from "../charts-object/edu&human";
export default {
  name: "chart1",
  data() {
    return {
      chartData: data.y18,
    };
  },
  methods: {
    createChart(chartId) {
      const ctx = document.getElementById(chartId);
      const myChart = new Chart(ctx, {
        type: "line",
        data: {
          labels: this.chartData.labels,
          datasets: [
            {
              type: "line",
              borderColor: "#white",
              label: "2018",
              data: this.chartData.data,
              borderWidth: 2,
              xAxisID: "x-axis-1",
              borderColor: "#414bd1",
              backgroundColor: "rgba(65, 75, 209, 0.05)",
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
                  labelString: "Student Count",
                },
              },
            ],
          },
        },
      });
    },
  },
  mounted() {
    this.createChart("chart7");
  },
};
</script>
<style scoped></style>
