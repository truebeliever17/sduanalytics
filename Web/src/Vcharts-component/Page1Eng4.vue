<template>
  <div>
    <canvas id="chart4"></canvas>
  </div>
</template>

<script>
import Chart from "chart.js";
import data from "../charts-object/data";
export default {
  name: "chart1",
  data() {
    return {
      chartData: data.y19,
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
              borderColor: "#f4f4f4",
              label: "2020",
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
    this.createChart("chart4");
  },
};
</script>
<style scoped></style>
