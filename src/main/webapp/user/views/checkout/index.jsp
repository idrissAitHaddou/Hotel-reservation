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
      <span class=""><span class="font-semibold">Full Name : </span> Abdelmajid EL AYACHI</span>
      <span class=""><span class="font-semibold">email : </span> elayachi@gmail.Com</span>
      <span class=""><span class="font-semibold">phone : </span> 0660606060</span>
    </div>
    <div class="flex flex-col justify-around flex-wrap text-sm my-4 ml-4">
      <span class=""><span class="font-semibold">Room : </span> Single Room</span>
      <span class=""><span class="font-semibold">check-in : </span> 05/12/2022, from 11:00 am </span>
      <span class=""><span class="font-semibold">check-out : </span> 05/14/2022, from 11:00 am </span>
    </div>
    <div class="flex flex-col justify-around flex-wrap text-sm my-4 ml-4">

      <span class=""><span class="font-semibold">Arrival : </span> 10:00 - 11:00</span>
      <span class=""><span class="font-semibold">Additional Services : </span> breakfast</span>
      <span class=""><span class="font-semibold">Requests : </span> I want some thing lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem </span>
    </div>
    <div class="flex flex-col justify-around flex-wrap text-sm my-4 ml-4">
      <span class=""><span class="font-semibold">Total price : </span> $200</span>
    </div>
  </div>
  <div class="w-1/2">
   <h1 class="text-lg font-medium text-gray-800 my-4">Payment</h1>
    <div class="flex flex-col text-sm my-4 ml-4 mx-5 border py-1.5">
      <div class="p-6">This is not a reservation but a simple request, our staff will get in touch with you.</div>
      <button type="button" class="inline-flex items-center justify-center px-1.5 py-1.5 mx-6 border border-[#F97316] text-xs text-white font-medium rounded shadow-sm bg-[#F97316] hover:text-white hover:bg-[#F97316]">Send request booking</button>

    </div>
  </div>

</div>
<jsp:include page="../../component/footer.jsp"/>
<script src="https://unpkg.com/flowbite@1.5.3/dist/flowbite.js"></script>
</body>

</html>
