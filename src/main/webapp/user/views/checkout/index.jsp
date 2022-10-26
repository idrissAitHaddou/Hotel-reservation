<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<html>
<head>
  <title>Booking room</title>
  <Link rel="stylesheet" href="user/css/index.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Cabin&family=Dancing+Script&family=Fuzzy+Bubbles:wght@700&family=Lobster&family=Montserrat:wght@200&family=PT+Serif+Caption&family=Saira+Condensed:wght@100&family=Source+Code+Pro:wght@200&family=Ubuntu+Mono&display=swap" rel="stylesheet">
  <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
  <link rel="stylesheet" href="https://unpkg.com/flowbite@1.5.3/dist/flowbite.min.css"/>
</head>
<body>
<div class="bg-white">
  <!-- Background color split screen for large screens -->
  <div class="hidden lg:block fixed top-0 left-0 w-1/2 h-full bg-white" aria-hidden="true"></div>
  <div class="hidden lg:block fixed top-0 right-0 w-1/2 h-full bg-gray-100" aria-hidden="true"></div>

  <div class="relative grid grid-cols-1 gap-x-16 max-w-7xl mx-auto lg:px-8 lg:grid-cols-2 lg:pt-16">
    <h1 class="sr-only">Checkout</h1>

    <section aria-labelledby="summary-heading" class="bg-gray-100 text-gray-800 py-12 md:px-10 lg:max-w-lg lg:w-full lg:mx-auto lg:px-0 lg:pt-0 lg:pb-24 lg:bg-gray-100 lg:row-start-1 lg:col-start-2">
      <div class="max-w-2xl mx-auto px-4 lg:max-w-none lg:px-0">
        <h2 id="summary-heading" class="sr-only">Order summary</h2>

        <dl>
          <dt class="text-sm font-medium">Amount due</dt>
          <dd class="mt-1 text-3xl font-extrabold text-gray-800">$232.00</dd>
        </dl>

        <ul role="list" class="text-sm font-medium divide-y divide-white divide-opacity-10">
<%--          <li class="flex items-start py-6 space-x-4">--%>
<%--            <img src="https://tailwindui.com/img/ecommerce-images/checkout-page-07-product-01.jpg" alt="Front of zip tote bag with white canvas, white handles, and black drawstring top." class="flex-none w-20 h-20 rounded-md object-center object-cover">--%>
<%--            <div class="flex-auto space-y-1">--%>
<%--              <h3 class="text-white">High Wall Tote</h3>--%>
<%--              <p>White and black</p>--%>
<%--              <p>15L</p>--%>
<%--            </div>--%>
<%--            <p class="flex-none text-base font-medium text-white">$210.00</p>--%>
<%--          </li>--%>
  <div class="flex md:flex-row flex-col h-fit w-full mx-auto my-6 border">
    <div class="h-full">
      <img class="h-36 w-full object-cover" src="/assets/images/rooms/room1.jpg" alt="Front of men&#039;s Basic Tee in black." class="w-20 rounded-md">
    </div>

    <div class="flex-1 py-2 flex flex-col mx-3">
      <div class="flex">
        <div class="min-w-0 flex-1">
          <h4 class="text-sm">
            <a href="#" class="font-semibold text-xl text-gray-600 hover:text-gray-800"> Single Room </a>
          </h4>
          <p class="text-sm font-medium text-gray-500 w-2/3">
            Lorem ipsum dolor sit amet
          </p>
        </div>

        <div class="ml-4 flex-shrink-0 flow-root">
          <button type="button" class="-m-2.5 p-2.5 flex items-center justify-center text-gray-400 hover:text-gray-500">
            <span class="text-xl font-semibold">$199</span>
          </button>
        </div>
      </div>
    </div>
  </div>
          <!-- More products... -->
        </ul>

        <dl class="text-sm font-medium space-y-6 border-t border-white text-gray-700 border-opacity-10 pt-6">
          <div class="flex items-center justify-between">
            <dt>Subtotal</dt>
            <dd>$570.00</dd>
          </div>

          <div class="flex items-center justify-between">
            <dt>Shipping</dt>
            <dd>$25.00</dd>
          </div>

          <div class="flex items-center justify-between">
            <dt>Taxes</dt>
            <dd>$47.60</dd>
          </div>

          <div class="flex items-center justify-between border-t border-white border-opacity-10 text-gray-800 font-semibold pt-6">
            <dt class="text-base">Total</dt>
            <dd class="text-base">$642.60</dd>
          </div>
        </dl>
      </div>
    </section>

    <section aria-labelledby="payment-and-shipping-heading" class="py-16 lg:max-w-lg lg:w-full lg:mx-auto lg:pt-0 lg:pb-24 lg:row-start-1 lg:col-start-1">
      <h2 id="payment-and-shipping-heading" class="sr-only">Payment and shipping details</h2>

      <form>
        <div class="max-w-2xl mx-auto px-4 lg:max-w-none lg:px-0">
          <div>
            <h3 id="contact-info-heading" class="text-lg font-medium text-gray-900">Contact information</h3>

            <div class="mt-6">
              <label for="email-address" class="block text-sm font-medium text-gray-700">Email address</label>
              <div class="mt-1">
                <input type="email" id="email-address" name="email-address" autocomplete="email" class="block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
              </div>
            </div>
          </div>

          <div class="mt-10">
            <h3 class="text-lg font-medium text-gray-900">Payment details</h3>

            <div class="mt-6 grid grid-cols-3 sm:grid-cols-4 gap-y-6 gap-x-4">
              <div class="col-span-3 sm:col-span-4">
                <label for="card-number" class="block text-sm font-medium text-gray-700">Card number</label>
                <div class="mt-1">
                  <input type="text" id="card-number" name="card-number" autocomplete="cc-number" class="block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                </div>
              </div>

              <div class="col-span-2 sm:col-span-3">
                <label for="expiration-date" class="block text-sm font-medium text-gray-700">Expiration date (MM/YY)</label>
                <div class="mt-1">
                  <input type="text" name="expiration-date" id="expiration-date" autocomplete="cc-exp" class="block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                </div>
              </div>

              <div>
                <label for="cvc" class="block text-sm font-medium text-gray-700">CVC</label>
                <div class="mt-1">
                  <input type="text" name="cvc" id="cvc" autocomplete="csc" class="block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                </div>
              </div>
            </div>
          </div>

          <div class="mt-10">
            <h3 class="text-lg font-medium text-gray-900">Shipping address</h3>

            <div class="mt-6 grid grid-cols-1 gap-y-6 gap-x-4 sm:grid-cols-3">
              <div class="sm:col-span-3">
                <label for="address" class="block text-sm font-medium text-gray-700">Address</label>
                <div class="mt-1">
                  <input type="text" id="address" name="address" autocomplete="street-address" class="block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                </div>
              </div>

              <div>
                <label for="city" class="block text-sm font-medium text-gray-700">City</label>
                <div class="mt-1">
                  <input type="text" id="city" name="city" autocomplete="address-level2" class="block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                </div>
              </div>

              <div>
                <label for="region" class="block text-sm font-medium text-gray-700">State / Province</label>
                <div class="mt-1">
                  <input type="text" id="region" name="region" autocomplete="address-level1" class="block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                </div>
              </div>

              <div>
                <label for="postal-code" class="block text-sm font-medium text-gray-700">Postal code</label>
                <div class="mt-1">
                  <input type="text" id="postal-code" name="postal-code" autocomplete="postal-code" class="block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                </div>
              </div>
            </div>
          </div>

          <div class="mt-10">
            <h3 class="text-lg font-medium text-gray-900">Billing information</h3>

            <div class="mt-6 flex items-center">
              <input id="same-as-shipping" name="same-as-shipping" type="checkbox" checked class="h-4 w-4 border-gray-300 rounded text-indigo-600 focus:ring-indigo-500">
              <div class="ml-2">
                <label for="same-as-shipping" class="text-sm font-medium text-gray-900">Same as shipping information</label>
              </div>
            </div>
          </div>

          <div class="mt-10 flex justify-end pt-6 border-t border-gray-200">
            <button type="submit" class="bg-indigo-600 border border-transparent rounded-md shadow-sm py-2 px-4 text-sm font-medium text-white hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-50 focus:ring-indigo-500">Pay now</button>
          </div>
        </div>
      </form>
    </section>
  </div>
</div>
<script src="https://unpkg.com/flowbite@1.5.3/dist/flowbite.js"></script>
<script type="text/javascript">
  fetchRooms()
  function fetchRooms() {
    const tableRooms = document.getElementById("rooms-list");
    tableRooms.innerHTML = "<h2 class='text-green-500'>Data loading...</h2>"
    $.ajax({
      url : "/admin/room/get",
      type : "GET",
      success : function (response){
        const dataRooms = JSON.parse(response)
        console.log(dataRooms)
        let stringHtml=""
        for (const room of dataRooms) {
          stringHtml += "<div class='flex md:flex-row flex-col h-fit md:w-11/12 w-full mx-auto my-6 border'><div class='h-full'><img class='h-48 w-full object-cover' src='/assets/images/rooms/room1.jpg' alt='Front of men&#039;s Basic Tee in black.' class='w-20 rounded-md'></div><div class='ml-6 flex-1 p-6 flex flex-col'><div class='flex'><div class='min-w-0 flex-1'><h4 class='text-sm'><a href='#' class='font-semibold text-2xl text-gray-600 hover:text-gray-800'> "+room.type_room[0]+room.type_room.slice(1).toLowerCase()+(room.type_room !== 'SUITE'? ' Room':'')+" </a></h4><p class='text-base font-medium text-gray-500 w-2/3 mt-4'>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod</p></div><div class='ml-4 flex-shrink-0 flow-root'><button type='button' class='-m-2.5 bg-white p-2.5 flex items-center justify-center text-gray-400 hover:text-gray-500'><span class='text-3xl font-semibold'>$199</span></button></div></div><div class='flex-1 pt-2 flex items-end w-full justify-end'><button type='button' class='inline-flex items-center justify-center px-4 py-2 border border-[#F97316] text-base text-[#F97316] font-medium rounded-md shadow-sm bg-white hover:text-white hover:bg-[#F97316] '>Book Now</button></div></div></div>";
        }
        tableRooms.innerHTML = stringHtml;
      },
      error : function (error){
        console.error(error)
      }
    })
  }
</script>
</body>
</html>
