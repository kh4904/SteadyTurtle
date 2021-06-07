// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Bar Chart Example
var ctx = document.getElementById("myBarChart00");
var myLineChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"],
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
      data: [300, 150, 200, 80, 170, 800,661],
    },{
      label: "Yoga",
      backgroundColor: "rgba(140,140,140, 1)",
      borderColor: "rgba(140,140,140,1)",
      data: [482, 246, 297, 317, 200, 600,972],
    },{
        label: "Food",
        backgroundColor: "rgba(255,94,0, 1)",
        borderColor: "rgba(255,94,0,1)",
        data: [600, 127, 497, 257, 800, 247,634],
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
          max: 5000,
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
