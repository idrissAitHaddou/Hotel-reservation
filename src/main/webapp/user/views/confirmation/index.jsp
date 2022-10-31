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
<div class="md:w-8/12 w-full px-6 mx-auto  my-6">
  <div class="w-1/2 border mx-auto">
   <h1 class="text-sm font-medium w-full text-center text-gray-800 my-4">Booking Details</h1>
    <div class="flex flex-col justify-around w-full flex-wrap text-xs my-4 ml-4">
        <span class="flex "><p class="text-[#958AA6] w-5/12 ">Full Name : </p> <p class="w-1/2">Abdelmajid EL AYACHI</p></span>
        <span class="flex"><p class="text-[#958AA6]  w-5/12">email : </p> <p class="w-1/2">elayachi@gmail.Com</p></span>
      <span class="flex"><p class="text-[#958AA6]  w-5/12">phone : </p><p class="w-1/2">0660606060</p> </span>
    </div>
    <div class="flex flex-col justify-around flex-wrap text-xs my-4 ml-4">
      <span class="flex"><p class="text-[#958AA6]  w-5/12">Room : </p> <p class="w-1/2"> Single Room</p></span>
      <span class="flex"><p class="text-[#958AA6]  w-5/12">check-in : </p><p class="w-1/2"> 05/12/2022, from 11:00 am </p></span>
      <span class="flex"><p class="text-[#958AA6]  w-5/12">check-out : </p><p class="w-1/2"> 05/14/2022, from 11:00 am</p> </span>
    </div>
    <div class="flex flex-col justify-around flex-wrap text-xs my-4 ml-4">

      <span class="flex"><p class="text-[#958AA6]  w-5/12">Arrival : </p><p class="w-1/2">10:00 - 11:00</p></span>
      <span class="flex"><p class="text-[#958AA6]  w-5/12">Additional Services : </p><p class="w-1/2"> breakfast</p></span>
      <span class="flex"><p class="text-[#958AA6] w-5/12">Requests : </p><p class="w-1/2"> I want some thing lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem </p></span>
    </div>
    <div class="flex flex-col justify-around flex-wrap text-sm my-4 ml-4">
      <span class="flex"><p class="font-semibold w-5/12">Total price : </p><p class="w-1/2">$200</p> </span>
    </div>
  </div>
    <div class="flex justify-center my-6">
        <button type="button" class="inline-flex items-center justify-center px-2 py-2 mx-6 border border-[#F97316] text-sm text-white font-medium rounded shadow-sm bg-[#F97316] hover:text-white hover:bg-[#F97316]">Print booking billet</button>
    </div>



</div>
<jsp:include page="../../component/footer.jsp"/>
<script src="https://unpkg.com/flowbite@1.5.3/dist/flowbite.js"></script>
</body>

</html>
