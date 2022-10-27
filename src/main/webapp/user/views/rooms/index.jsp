<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<html>
<head>
  <title>Rooms & Suites</title>
  <Link rel="stylesheet" href="user/css/index.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Cabin&family=Dancing+Script&family=Fuzzy+Bubbles:wght@700&family=Lobster&family=Montserrat:wght@200&family=PT+Serif+Caption&family=Saira+Condensed:wght@100&family=Source+Code+Pro:wght@200&family=Ubuntu+Mono&display=swap" rel="stylesheet">
  <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
  <link rel="stylesheet" href="https://unpkg.com/flowbite@1.5.3/dist/flowbite.min.css"/>
</head>
<body>

<jsp:include page="../../component/nav.jsp" >
    <jsp:param name="current" value="rooms"/>
</jsp:include>
<div  class="">
  <img class="object-cover" src="/assets/images/bg.jpg" alt="hotel room">
</div>
<div >
    <div class="md:text-4xl text-xl font-semibold text-gray-700 flex justify-center my-10">Our Best Rooms</div>
  <div id="rooms-grid" class="mt-12 md:w-10/12 w-full px-8 mx-auto grid gap-8 lg:grid-cols-4 lg:max-w-none">

  </div>

</div>
<script src="https://unpkg.com/flowbite@1.5.3/dist/flowbite.js"></script>
</body>
<script type="text/javascript">
    fetchRooms()
    function fetchRooms() {
        const tableRooms = document.getElementById("rooms-grid");
        tableRooms.innerHTML = "<h2 class='text-green-500'>Data loading...</h2>"
        $.ajax({
            url : "/admin/room/get",
            type : "GET",
            success : function (response){
                const dataRooms = JSON.parse(response)
                console.log(dataRooms)
                let stringHtml=""
                for (const room of dataRooms) {
                    stringHtml += "<div class='flex flex-col rounded-lg shadow-lg overflow-hidden'> <div class='flex-shrink-0'> <img class='h-52 w-full object-cover' src='/assets/images/rooms/room1.jpg' alt=''> </div> <div class='flex-1 bg-white p-6 flex flex-col justify-between'> <div class='flex justify-between items-center '> <a href='#' class='block mt-2 flex '> <p class='text-xl font-semibold text-gray-900'>"+room.type_room[0]+room.type_room.slice(1).toLowerCase()+(room.type_room !== 'SUITE'? ' Room':'')+"</p> </a><p class='text-lg font-bold my-6 '>$250</p> </div>  <button type='button' class='inline-flex items-center justify-center px-1 py-2 border border-[#F97316] text-base text-[#F97316] font-medium rounded-md shadow-sm bg-white hover:text-white hover:bg-[#F97316] '>Book Now</button> </div> </div>"
                }
                tableRooms.innerHTML = stringHtml;
            },
            error : function (error){
                console.error(error)
            }
        })
    }
</script>
</html>
