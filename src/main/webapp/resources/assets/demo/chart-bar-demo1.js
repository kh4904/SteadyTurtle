// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Bar Chart Example
var ctx = document.getElementById("myBarChart1");
var myLineChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"],
    datasets: [
    
    {
      label: "Man",
      backgroundColor: "rgba(103,153,255,1)",
      borderColor: "rgba(103,153,255,1)",
      data: [1400, 2074, 2187, 971, 1247, 888,432],
    },{
      label: "Female",
      backgroundColor: "rgba(255,94,0, 1)",
      borderColor: "rgba(255,94,0,1)",
      data: [1347, 2014, 1274, 236, 400, 647,217],
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
