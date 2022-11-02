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
                console.log("st success")
                $("#allRoomsNumber").html(data.roomscount)
                $("#allSuitesNumber").html(data.suitecount)
                $("#allBookingsNumber").html(data.bookingscount)
            },
            error : function (error){
                console.log("st error")
                toastError("Connection failed !!!", "toast-success")
            }
        })
    }
</script>
</body>
</html>

