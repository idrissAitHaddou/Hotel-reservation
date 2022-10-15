var yValues = [35, 15, 15, 35];
var barColors = ["#567DF4", "#FFC700", "#4CE364", "#22215B"];

// var barColors = ["#567DF4", "#22215B", "#4CE364", "#FFC700"];

new Chart("myChart", {
    type: "doughnut",
    data: {
        datasets: [
            {
                backgroundColor: barColors,
                data: yValues,
            },
        ],
    },
    options: {
        title: {
            display: true,
            text: "World Wide Wine Production 2018",
        },
    },
});
