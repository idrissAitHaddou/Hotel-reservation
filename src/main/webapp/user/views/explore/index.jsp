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
  <link
          rel="stylesheet"
          href="https://use.fontawesome.com/releases/v5.13.0/css/all.css"
          integrity="sha384-Bfad6CLCknfcloXFOyFnlgtENryhrpZCe29RTifKEixXQZ38WheV+i/6YWSzkz3V"
          crossorigin="anonymous"
  />
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
  <jsp:param name="current" value="explore"/>
</jsp:include>
<jsp:include page="patails/booking.jsp" />
<div class='text-gray-600 font-normal flex justify-between '><span class='border border-dashed p-1'><i class='fa fa-bath fa-lg text-gray-600'></i> </span></div>
<jsp:include page="../../component/footer.jsp" />


<script src="https://unpkg.com/flowbite@1.5.3/dist/flowbite.js"></script>
<script type="text/javascript">
  fetchRoomByDates()
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
      stringHtml += "<div class='flex md:flex-row flex-col h-fit md:w-11/12 w-full mx-auto my-6 shadow-md shadow-gray-400'><div class='h-full'><img class='h-48 w-full object-cover' src='/assets/images/rooms/room1.jpg' alt='Front of men&#039;s Basic Tee in black.' class='w-20 rounded-md'></div><div class='ml-2 flex-1 p-4 flex flex-col'><div class='flex'><div class='min-w-0 flex-1'><h4 class='text-sm'><a href='#' class='font-semibold text-lg text-gray-600 hover:text-gray-800'> "+room.type_room[0]+room.type_room.slice(1).toLowerCase()+(room.type_room !== 'SUITE'? ' Room':'')+" </a></h4><p class='text-xs font-medium text-gray-500 mt-4'>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod</p></div><div class='ml-4 flex-shrink-0 flow-root'><button type='button' class=' bg-white p-1 flex items-center justify-center text-gray-400 hover:text-gray-500'>Averge price : <span class='text-lg font-semibold text-gray-800'>$"+room.avg+"</span></button></div></div><div class='flex-1 pt-2 flex items-end w-full justify-between'><div class='text-[#858a99] text-sm font-normal flex items-center justify-between gap-4 '><span class='border border-dashed font-light p-2'><i class='fa fa-bath'></i> </span><span class='border border-dashed font-light p-2'><i class='fa fa-utensils'></i> </span><span class='border border-dashed font-light p-2'><i class='fa fa-wifi'></i> </span><span class='border border-dashed font-light p-2'><i class='fa fa-coffee'></i> </span><span class='border border-dashed font-light p-2'><i class='fa fa-mobile'></i> </span></div> <a href='http://localhost:8080/room-details?room="+room.id_room+"' class='inline-flex items-center justify-center px-2 py-1 border border-[#F97316] text-xs text-[#F97316] font-medium rounded-md shadow-sm bg-white hover:text-white hover:bg-[#F97316] '>View details >></a></div></div></div>";
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
