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
<div class="flex flex-col md:flex-row md:w-8/12 w-full px-6 mx-auto mt-16">
  <div class="md:w-2/3 w-full">
    <div class="">
      <h2 class="text-xl text-800 my-4" >Additional service</h2>
      <ul class="space-y-4">
        <li>
          <label for="extra-breakfast" class="flex justify-between items-center text-sm p-2 rounded text-[#8E8E8E] border hover:bg-green-100">
            <span class="">
              <input id="extra-breakfast" type="checkbox" class="rounded-full text-green-600 border-green-600 border-green-600 focus:outline-none focus:border-none focus:ring-0 ">
              <label  for="extra-breakfast">
                Breakfast
              </label>
            </span>
            <span >$5</span>
            <span class="">
              <i class="far fa-question-circle"></i>
            </span>
          </label>
        </li>
        <li>
          <label for="extra-lunch" class="flex justify-between items-center text-sm p-2 rounded text-[#8E8E8E] border hover:bg-green-100">
            <span>
              <input id="extra-lunch" type="checkbox" class="rounded-full text-green-600 border-green-600 border-green-600 focus:outline-none focus:border-none focus:ring-0 ">
              <label class="ml-2 w-32" for="extra-breakfast">
                Lunch
              </label>
            </span>
            <span  >$15</span>
            <span class="">
              <i class="far fa-question-circle"></i>
            </span>
          </label>
        </li>
        <li>
          <label for="extra-dinner" class="flex justify-between items-center text-sm p-2 rounded text-[#8E8E8E] border hover:bg-green-100">
            <span>
              <input id="extra-dinner" type="checkbox" class="rounded-full text-green-600 border-green-600 border-green-600 focus:outline-none focus:border-none focus:ring-0 ">
              <label class="ml-2 w-32" for="extra-dinner">
                Lunch
              </label>
            </span>
            <span>$12</span>
            <span class="">
              <i class="far fa-question-circle"></i>
            </span>
          </label>
        </li>
        <li>
          <label for="extra-massage" class="flex justify-between items-center text-sm p-2 rounded text-[#8E8E8E] border hover:bg-green-100">
            <span>
              <input id="extra-massage" type="checkbox" class="rounded-full text-green-600 border-green-600 border-green-600 focus:outline-none focus:border-none focus:ring-0 ">
              <label class="ml-2 w-32" for="extra-massage">
                Massage
              </label>
            </span>
            <span>$50</span>
            <span class="">
              <i class="far fa-question-circle"></i>
            </span>
          </label>
        </li>
        <li>
          <label for="extra-fruit" class="flex justify-between items-center text-sm p-2 rounded text-[#8E8E8E] border hover:bg-green-100">
            <span>
              <input id="extra-fruit" type="checkbox" class="rounded-full text-green-600 border-green-600 border-green-600 focus:outline-none focus:border-none focus:ring-0 ">
              <label class="ml-2 w-32" for="extra-fruit">
                Fruits
              </label>
            </span>
            <span>$25</span>
            <span class="">
              <i class="far fa-question-circle"></i>
            </span>
          </label>
        </li>
        <li>
          <label for="extra-soin" class="flex justify-between items-center text-sm p-2 rounded text-[#8E8E8E] border hover:bg-green-100">
            <span>
              <input id="extra-soin" type="checkbox" class="rounded-full text-green-600 border-green-600 border-green-600 focus:outline-none focus:border-none focus:ring-0 ">
              <label class="ml-2 w-32" for="extra-fruit">
                Soin
              </label>
            </span>
            <span>$15</span>
            <span class="">
              <i class="far fa-question-circle"></i>
            </span>
          </label>
        </li>
      </ul>
    </div>
      <h2 class="text-xl text-800 my-4" >Billing Details</h2>
      <div class="flex flex-col md:flex-row w-full gap-4">
        <div class="w-full md:w-1/2">
          <label for="firstname" class="block text-sm font-medium text-gray-700">First Name</label>
          <div class="mt-1">
            <input type="text" name="firstname" id="firstname" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-xs border-gray-300 rounded-md" placeholder="JOHN">
          </div>
        </div>
        <div class="w-full md:w-1/2">
          <label for="lastname" class="block text-sm font-medium text-gray-700">Last Name</label>
          <div class="mt-1">
            <input type="text" name="lastname" id="lastname" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-xs border-gray-300 rounded-md" placeholder="DOAE">
          </div>
        </div>
      </div>
    <div class="flex flex-col md:flex-row w-full gap-4 mt-6">
        <div class="w-full md:w-1/2">
          <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
          <div class="mt-1">
            <input type="email" name="email" id="email" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-xs border-gray-300 rounded-md" placeholder="john@example.com">
          </div>
        </div>
        <div class="w-full md:w-1/2">
          <label for="tel" class="block text-sm font-medium text-gray-700">Number</label>
          <div class="mt-1">
            <input type="tel" name="tel" id="tel" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-xs border-gray-300 rounded-md" placeholder="+212 600-00 00 00">
          </div>
        </div>
      </div>
    <div class="flex flex-col w-full gap-4 mt-6">
          <label for="about" class="text-sm font-medium text-gray-700">Special Requests</label>
          <textarea id="about" name="about" placeholder="Write what you wish here..." rows="3" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border border-gray-300 rounded-md"></textarea>
    </div>
    <h2 class="text-xl text-800 my-4" >Billing Details</h2>
    <fieldset>

    <ul class="flex flex-col md:flex-row md:space-x-4 md:space-y-0 space-y-3">
      <li>
        <label for="time-10-11" class="flex justify-between items-center text-sm p-2 rounded text-[#8E8E8E] border hover:bg-green-100">
            <span class="">
              <input id="time-10-11" type="radio" name="time" class="rounded-full text-green-600 border-green-600 border-green-600 focus:outline-none focus:border-none focus:ring-0 ">
              <label  for="time-10-11">
                10:00-11:00
              </label>
            </span>
        </label>
      </li>
      <li>
        <label for="time-14-15" class="flex justify-between items-center text-sm p-2 rounded text-[#8E8E8E] border hover:bg-green-100">
            <span class="">
              <input id="time-14-15" type="radio" name="time" class="rounded-full text-green-600 border-green-600 border-green-600 focus:outline-none focus:border-none focus:ring-0 ">
              <label  for="time-14-15">
                14:00-15:00
              </label>
            </span>
        </label>
      </li>
      <li>
        <label for="time-17-18" class="flex justify-between items-center text-sm p-2 rounded text-[#8E8E8E] border hover:bg-green-100">
            <span class="">
              <input id="time-17-18" type="radio" name="time" class="rounded-full text-green-600 border-green-600 border-green-600 focus:outline-none focus:border-none focus:ring-0 ">
              <label  for="time-17-18">
                17:00-18:00
              </label>
            </span>
        </label>
      </li>
      <li>
        <label for="time-20-21" class="flex justify-between items-center text-sm p-2 rounded text-[#8E8E8E] border hover:bg-green-100">
            <span class="">
              <input id="time-20-21" type="radio" name="time" class="rounded-full text-green-600 border-green-600 border-green-600 focus:outline-none focus:border-none focus:ring-0 ">
              <label  for="time-20-21">
                20:00-21:00
              </label>
            </span>
        </label>
      </li>
    </ul>
    </fieldset>
    <div class="relative flex items-start mt-6 mb-12">
      <div class="flex items-center h-5">
        <input id="comments" aria-describedby="comments-description" name="comments" type="checkbox" class="rounded text-green-600 border-green-600 border-green-600 focus:outline-none focus:border-none focus:ring-0 ">
      </div>
      <div class="ml-3 text-sm">
        <label for="comments" class="font-medium text-gray-700">I agree to the</label>
        <span id="comments-description" class="text-gray-500"><span class="sr-only">I agree to the</span><a class="text-[#626890]]" href="#">Terms and Conditions</a></span>
      </div>
    </div>
  </div>
  <div class="w-full md:w-1/3 mt-16">
    <div class="ml-4 border flex flex-col h-fit gap-8">
      <img src="/assets/images/room1.jpeg" class="w-full" alt="...">
      <div class=" px-4">
        <h1 class="text-[#606060] text-sm font-medium">Booking Details</h1>
        <div class="flex justify-between text-xs text-[#958A99] py-2">
          <span class="">Room</span>
          <span class="">1</span>
        </div>
        <div class="flex justify-between text-xs text-[#958A99] py-2">
          <span class="">Check-in</span>
          <span class="">05/12/2022, from 11:00 am</span>
        </div>
        <div class="flex justify-between text-xs text-[#958A99] py-2">
          <span class="">Check-out</span>
          <span class="">05/14/2022, from 10:00 am</span>
        </div>
        <div class="flex justify-between text-xs text-[#958A99] py-2">
          <span class="">Days</span>
          <span class="">2</span>
        </div>
      </div>
    <div class="flex justify-center my-6">
      <button type="button" class="inline-flex items-center justify-center px-2 py-2 mx-6 border border-[#F97316] text-sm text-white font-medium rounded shadow-sm bg-[#F97316] hover:text-white hover:bg-[#F97316]">PROCEED TO CHECKOUT</button>
    </div>
    </div>

  </div>

</div>
<jsp:include page="../../component/footer.jsp"/>

<script src="https://unpkg.com/flowbite@1.5.3/dist/flowbite.js"></script>
</body>

</html>
