<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<html>
<head>
  <title>Room details</title>
  <Link rel="stylesheet" href="user/css/index.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Cabin&family=Dancing+Script&family=Fuzzy+Bubbles:wght@700&family=Lobster&family=Montserrat:wght@200&family=PT+Serif+Caption&family=Saira+Condensed:wght@100&family=Source+Code+Pro:wght@200&family=Ubuntu+Mono&display=swap" rel="stylesheet">
  <link
          rel="stylesheet"
          href="https://use.fontawesome.com/releases/v5.13.0/css/all.css"
          integrity="sha384-Bfad6CLCknfcloXFOyFnlgtENryhrpZCe29RTifKEixXQZ38WheV+i/6YWSzkz3V"
          crossorigin="anonymous"
  />
  <link rel="stylesheet" href="https://unpkg.com/flowbite@1.5.3/dist/flowbite.min.css" />
  <style type="text/tailwindcss">
    @layer utilities {
      .content-auto {
        content-visibility: auto;
      }
    }
  </style>
  <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
  <link rel="stylesheet" href="https://unpkg.com/flowbite@1.5.3/dist/flowbite.min.css"/>
</head>
<body>
<jsp:include page="../../component/nav.jsp"/>
<jsp:include page="patails/step.jsp"/>
<div class="md:w-8/12 w-full px-6 mx-auto flex">
  <div class="w-1/2">
   <h1 class="text-lg font-medium text-gray-800 my-4">Booking Details</h1>
    <div class="flex flex-col justify-around flex-wrap text-sm my-4 ml-4">
      <span class=""><span class="font-semibold">Full Name : </span><span id="full-name"></span></span>
      <span class=""><span class="font-semibold">email : </span><span id="email"></span></span>
      <span class=""><span class="font-semibold">phone : </span> <span id="tel"></span></span>
    </div>
    <div class="flex flex-col justify-around flex-wrap text-sm my-4 ml-4">
      <span class=""><span class="font-semibold">Room : </span> <span id="room-number"></span></span>
      <span class=""><span class="font-semibold">check-in : </span> <span id="start-date"></span></span>
      <span class=""><span class="font-semibold">check-out : </span> <span id="end-date"></span></span>
    </div>
    <div class="flex flex-col justify-around flex-wrap text-sm my-4 ml-4">

      <span class=""><span class="font-semibold">Arrival : </span> 10:00 - 11:00</span>
      <span class=""><span class="font-semibold">Additional Services : </span> <span id="extras"></span></span>
      <span class=""><span class="font-semibold">Requests : </span> I want some thing lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem </span>
    </div>
    <div class="flex flex-col justify-around flex-wrap text-sm my-4 ml-4">
      <span class=""><span class="font-semibold">Total price : </span>$<span id="total-rate"></span></span>
    </div>
  </div>
  <div class="w-1/2">
   <h1 class="text-lg font-medium text-gray-800 my-4">Payment</h1>
    <div class="flex flex-col text-sm my-4 ml-4 mx-5 border py-1.5">
      <div class="p-6">This is not a reservation but a simple request, our staff will get in touch with you.</div>
      <button type="button" onclick="getPayBooking()" class="inline-flex items-center justify-center px-1.5 py-1.5 mx-6 border border-[#F97316] text-xs text-white font-medium rounded shadow-sm bg-[#F97316] hover:text-white hover:bg-[#F97316]">Send request booking</button>

    </div>
  </div>

</div>
<jsp:include page="../../component/footer.jsp"/>
<script src="https://unpkg.com/flowbite@1.5.3/dist/flowbite.js"></script>
<script type="text/javascript">
    getBookingData()
    function getBookingData(){
        // url = http://localhost:8080/checkout?matricule=BO-13603997&start=2022-11-26&end=2022-11-27&room=64
        let url = new URL(window.location.href);
        let matricule = url.searchParams.get("matricule");
        console.log(matricule);
        $.ajax({
            url : "/booking/room/details",
            type : "GET",
            data:{
                matricule: matricule
            },
            success : function (response){
                if(JSON.parse(response).status === 'success'){
                    if(JSON.parse(response).data.length >0){
                        const dataRoom = JSON.parse(response).data[0];
                        if(dataRoom.paid === true){
                            window.location.href = "/confirmation?matricule="+matricule;
                        }
                        const extras = dataRoom.extras;
                        console.log(dataRoom);
                        $("#full-name").text(dataRoom.firstname + " " + dataRoom.lastname)
                        $("#email").text(dataRoom.email)
                        $("#tel").text(dataRoom.tel)
                        $("#room-number").text(dataRoom.room_number)
                        $("#start-date").text(dataRoom.start_date)
                        $("#end-date").text(dataRoom.end_date)

                        $("#total-rate").text(dataRoom.rate)
                        let result = "";
                        for (const extra in extras) {
                            result += extras[extra].type_extra + ", ";
                        }
                        result = result.substring(0, result.length - 2);
                        $("#extras").text(result)
                    }else{
                        console.log("redirect...")
                        window.location.href = "/explore";
                    }
                }else{
                    console.log("redirect...")
                    window.location.href = "/explore";
                }


            },
            error : function (error){
                console.error(error)
            }
        })

    }
    function getPayBooking(){
        let url = new URL(window.location.href);
        let matricule = url.searchParams.get("matricule");
        $.ajax({
            url : "/booking/room/pay",
            type : "GET",
            data:{
                matricule: matricule
            },
            success : function (response){
                console.log(response)
                window.location.href = "/confirmation?matricule="+matricule;
            },
            error : function (error){
                console.error(error)
            }
        })
    }

</script>
</body>


</html>
