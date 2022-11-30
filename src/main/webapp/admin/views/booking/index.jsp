<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="partails/details.jsp"/>
<div id="toast-success" class="absolute z-[999999] right-2 -top-2 flex items-center p-4 mb-4 w-full max-w-xs text-gray-500 rounded-lg shadow" role="alert"></div>
<div class="p-6">
  <nav class="flex justify-between mb-8" aria-label="Breadcrumb">
    <ol class="inline-flex items-center space-x-1 md:space-x-3">
      <li class="inline-flex items-center">
        <a href="#" class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white">
          <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"></path></svg>
          Home
        </a>
      </li>
      <li>
        <div class="flex items-center">
          <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
          <a href="#" class="ml-1 text-sm font-medium text-gray-700 hover:text-gray-900 md:ml-2 dark:text-gray-400 dark:hover:text-white">Booking</a>
        </div>
      </li>
    </ol>

  </nav>
  <div class="overflow-x-auto relative sm:rounded-lg">
    <table class="w-full text-sm text-left">
      <thead class="bg-white text-xs text-gray-700 uppercase">
      <tr>
        <th scope="col" class="py-3 px-6">
          Matriculate
        </th>
        <th scope="col" class="py-3 px-6">
          Email
        </th>
        <th scope="col" class="py-3 px-6">
          Rate
        </th>
        <th scope="col" class="py-3 px-6">
          date start
        </th>
        <th scope="col" class="py-3 px-6">
          date end
        </th>
        <th scope="col" class="py-3 px-6 md:block hidden text-center">
          Actions
        </th>
      </tr>
      </thead>
      <tbody></tbody>
    </table>
    <div id="dataBooking-data"></div>
  </div>
</div>
<%-- start modael for delete one room --%>
<button data-modal-toggle="delete-booking-modal" hidden id="btnToogleDeleteBookingModal">show modal</button>
<div id="delete-booking-modal" tabindex="-1" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 md:inset-0 h-modal md:h-full">
  <div class="relative p-4 w-full max-w-md h-full md:h-auto">
    <div class="relative bg-white rounded-lg shadow">
      <button data-modal-toggle="delete-booking-modal" type="button" class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center">
        <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
        <span class="sr-only">Close modal</span>
      </button>
      <div class="p-6 text-center">
        <svg aria-hidden="true" class="mx-auto mb-4 w-14 h-14 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
          <h3 class="mb-5 text-lg font-normal text-gray-500">Are you sure you want to delete this room?</h3>
        <button id="btnDeleteBooking" type="button" class="text-white bg-red-600 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm inline-flex items-center px-5 py-2.5 text-center mr-2">
          Yes, I'm sure
        </button>
        <button data-modal-toggle="delete-booking-modal" type="button" class="text-gray-500 bg-white hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-gray-200 rounded-lg border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10">No, cancel</button>
      </div>
    </div>
  </div>
</div>
<script>
  // hide elemment when loading page
  $("#toast-success").hide()
  $("#loadingEdit").hide()
  $("#dataBooking-data").hide()
  // validate add extrax
  function validateExtrax(type_extra, rate) {
    if(rate <=0 || type_extra == '') return 0
    return 1
  }
  // get all extraxs
  fetchDataBooking()
  function fetchDataBooking() {
    let element = '<div class="flex justify-center overflow-hidden"><div class="mx-auto mt-10 w-8 h-8 border-4 border-dashed rounded-full animate-spin dark:border-violet-400"></div></div>'
    $("#dataBooking-data").html(element)
    $("#dataBooking-data").show()
    $.ajax({
      url : "/admin/booking/get",
      type : "GET",
      success : function (response){
        const bookings = JSON.parse(response)
        console.log(bookings)
        let stringHtml=""
        for (const booking of bookings) {
          stringHtml += "<tr class='bg-white border-b hover:bg-gray-50'>"
          stringHtml += "<td class='py-4 px-6'>"+booking.matricule+" </td>"
          stringHtml += "<td class='py-4 px-6'>"+booking.email+" </td>"
          stringHtml += "<td class='py-4 px-6'>"+booking.rate+" </td>"
          stringHtml += "<td class='py-4 px-6'>"+booking.start_date+" </td>"
          stringHtml += "<td class='py-4 px-6'>"+booking.end_date+" </td>"
          stringHtml += "<td><div class='flex justify-center'><button type='button' onclick='showModalDeleteBooking("+booking.id_booking+")' > <svg width='18px' height='18px' viewBox='0 0 18 18' xmlns='http://www.w3.org/2000/svg'> <path fill='#FF0000' d='M13 18H5a2 2 0 0 1-2-2V7a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v9a2 2 0 0 1-2 2zm3-15a1 1 0 0 1-1 1H3a1 1 0 0 1 0-2h3V1a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v1h3a1 1 0 0 1 1 1z'></path> </svg> </button></div>"
          stringHtml += " </td></tr>"
        }
        $("#dataBooking-data").hide()
        $("tbody").html(stringHtml)
      },
      error : function (error){
        toastError("Connection failed !!!")
      }
    })
  }

  // delete booking
  function showModalDeleteBooking(idBooking) {
    $("#btnDeleteBooking").attr("onclick", "deleteBooking(" + idBooking + ")")
    $("#btnToogleDeleteBookingModal").click()
  }

  function deleteBooking(idBooking){
    $.ajax({
      url : "/admin/booking/delete",
      type: "post",
      data: {
        id : idBooking,
      },
      success : function (response){
        const res = JSON.parse(response);
        if (res.message === "success"){
          fetchDataBooking()
          $("#btnToogleDeleteBookingModal").click()
          toastSuccess("Booking deleted successfully")
        }else {
          toastError("Booking not deleted !!!")
        }
      },
      error : function (error){
        toastError("Connection failed !!!")
      }
    })
  }

  function fetchOneExtra(idExtra){

    $.ajax({
      url : "/admin/extra/one",
      type : "POST",
      data: {
        id : idExtra,
      },
      success :  function (response) {
        const room = JSON.parse(response)[0];
        $("#edit-type-extra").val(room.type_extra)
        $("#edit-rate").val(room.rate)
        $("#id-extra-edit").val(room.id_extra)
      },
      error : function (error){
        console.error(error)
      }
    })


  }
  function toastSuccess(message) {
    let   element ='<div class="inline-flex flex-shrink-0 justify-center items-center w-8 h-8 text-green-500 bg-green-100 rounded-lg">'
    element +='<svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path></svg>'
    element +='<span class="sr-only text-gray-600">Check icon</span></div>'
    element +='<div class="ml-3 text-sm font-normal">'
    element += message + ' </div>'
    $("#toast-success").html(element)
    $("#toast-success").addClass("bg-green-200")
    $("#toast-success").removeClass("bg-red-200")
    $("#toast-success").show(100)
    setTimeout(function () {
      $("#toast-success").hide()
    },3000)
  }

  function toastError(message) {
    let   element ='<div class="inline-flex flex-shrink-0 justify-center items-center w-8 h-8 text-red-500 bg-red-100 rounded-lg">'
    element +='<svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path></svg>'
    element +='<span class="sr-only text-gray-600">Check icon</span></div>'
    element +='<div class="ml-3 text-sm font-normal">'
    element += message + ' </div>'
    $("#toast-success").html(element)
    $("#toast-success").addClass("bg-red-200")
    $("#toast-success").removeClass("bg-green-200")
    $("#toast-success").show(100)
    setTimeout(function () {
      $("#toast-success").hide()
    },3000)
  }
</script>
</body>
</html>

