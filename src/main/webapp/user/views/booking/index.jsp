<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<html>
<head>
  <title>Htel</title>
  <Link rel="stylesheet" href="user/css/index.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Cabin&family=Dancing+Script&family=Fuzzy+Bubbles:wght@700&family=Lobster&family=Montserrat:wght@200&family=PT+Serif+Caption&family=Saira+Condensed:wght@100&family=Source+Code+Pro:wght@200&family=Ubuntu+Mono&display=swap" rel="stylesheet">
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

<jsp:include page="../../component/nav.jsp" >
  <jsp:param name="current" value="booking"/>
</jsp:include>
<jsp:include page="patails/hero.jsp" />
<jsp:include page="patails/booking.jsp" />
<jsp:include page="../../component/footer.jsp" />


<script src="https://unpkg.com/flowbite@1.5.3/dist/flowbite.js"></script>
<script type="text/javascript">
    function fetchRoomByDates() {
      const startDate = $("#start-date").val();
      const endDate = $("#end-date").val();

    $.ajax({
    url : "/admin/room/details",
    type : "GET",
    data: {
      start_date : startDate,
      end_date : endDate,

    },
    success : function (response){
    const dataRooms = JSON.parse(response)
    console.log(dataRooms)
      let stringHtml = ""
    for (const room of dataRooms) {
      stringHtml += "<div class='flex md:flex-row flex-col h-fit md:w-11/12 w-full mx-auto my-6 border'><div class='h-full'><img class='h-48 w-full object-cover' src='file:///C:/Users/YC/OneDrive/Documents/java/briefs/Hotel-reservation/target/hotelHolidayv1-1.0-SNAPSHOT/assets/uploads/rooms/room1666866868.jpg' alt='Front of men&#039;s Basic Tee in black.' class='w-20 rounded-md'></div><div class='ml-6 flex-1 p-6 flex flex-col'><div class='flex'><div class='min-w-0 flex-1'><h4 class='text-sm'><a href='#' class='font-semibold text-2xl text-gray-600 hover:text-gray-800'> "+room.type_room[0]+room.type_room.slice(1).toLowerCase()+(room.type_room !== 'SUITE'? ' Room':'')+" </a></h4><p class='text-base font-medium text-gray-500 w-2/3 mt-4'>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod</p></div><div class='ml-4 flex-shrink-0 flow-root'><button type='button' class='-m-2.5 bg-white p-2.5 flex items-center justify-center text-gray-400 hover:text-gray-500'><span class='text-3xl font-semibold'>$"+room.rate+"</span></button></div></div><div class='flex-1 pt-2 flex items-end w-full justify-end'><a href='http://localhost:8080/booking-room?room="+room.id_room+"' class='inline-flex items-center justify-center px-4 py-2 border border-[#F97316] text-base text-[#F97316] font-medium rounded-md shadow-sm bg-white hover:text-white hover:bg-[#F97316] '>Book Now</a></div></div></div>";
    }
      $("#rooms-list").html(stringHtml)
  },
    error : function (error){
    console.error(error)
  }
  })
  }
</script>
</body>
</html>
