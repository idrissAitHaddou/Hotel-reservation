<html>
<head>
    <Link rel="stylesheet" href="css/index.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="partails/starts.jsp"/>
<jsp:include page="partails/chartjsStatics.jsp"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js"></script>
<script src="js/chartsRooms.js"></script>
<script>
    // get all statics
    getAllStatics()
    function getAllStatics(){
        $.ajax({
            url : "/admin/get/statics",
            type : "get",
            success :  function (response) {
                const data = JSON.parse(response)
                $("#allRoomsNumber").html(data.roomscount)
                $("#allSuitesNumber").html(data.suitecount)
                $("#allBookingsNumber").html(data.bookingscount)

                $("#roomsCount").html(data.roomscount)
                $("#suitesCount").html(data.suitecount)
                $("#bookingsCount").html(data.bookingscount)

                $("#fullname").html(data.firstname + " " + data.lastname)
                $("#email").html(data.email)
            },
            error : function (error){
                console.log("st error")
                toastError("Connection failed !!!", "toast-success")
            }
        })
    }
    // get staticcs of type rooms
    getStaticsTypes()
    function getStaticsTypes(){
        $.ajax({
            url : "/admin/get/statics",
            type : "get",
            success :  function (response) {
                const data = JSON.parse(response)
                // chart js for types
                var yValues = [data.doubleCount, data.triplecount, data.singleCount, data.suitecount];
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
            },
            error : function (error){
                console.log("st error")
            }
        })
    }

</script>
</body>
</html>

