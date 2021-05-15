// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Bar Chart Example
var ctx = document.getElementById("myBarChart");
var myLineChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: ["January", "February", "March", "April", "May", "June"],
    datasets: [
    /*{
      label: "Health",
      backgroundColor: "rgba(2,117,216,1)",
      borderColor: "rgba(2,117,216,1)",
      data: [4215, 5312, 6251, 7841, 9821, 14984],
    },*/
    {
      label: "Health",
      backgroundColor: "rgba(103,153,255,1)",
      borderColor: "rgba(103,153,255,1)",
      data: [4215, 5312, 6251, 7841, 9821, 14984],
    },{
      label: "Yoga",
      backgroundColor: "rgba(140,140,140, 1)",
      borderColor: "rgba(140,140,140,1)",
      data: [5215, 6312, 7251, 5841, 7821, 10984],
    },{
        label: "Food",
        backgroundColor: "rgba(255,94,0, 1)",
        borderColor: "rgba(255,94,0,1)",
        data: [6111, 2457, 6471, 4467, 5214, 7851],
      }
    ],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'month'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 6
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 15000,
          maxTicksLimit: 5
        },
        gridLines: {
          display: true
        }
      }],
    },
    legend: {
      display: false
    }
  }
});
