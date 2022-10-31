<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<jsp:include page="partails/checkRooms.jsp"/>
<div id="toast-success" class="absolute right-2 -top-2 flex items-center p-4 mb-4 w-full max-w-xs text-gray-500 rounded-lg shadow" role="alert"></div>
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
          <a href="#" class="ml-1 text-sm font-medium text-gray-700 hover:text-gray-900 md:ml-2 dark:text-gray-400 dark:hover:text-white">promotion</a>
        </div>
      </li>
    </ol>

  </nav>
  <div class="overflow-x-auto relative sm:rounded-lg px-6">
    <div class="flex flex-col md:flex-row justify-bewteen item-center">
      <img id="promo-image" class="w-full md:w-2/5 h-72 rounded-lg" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnKM_QNeI4X-o7yyJRpIzXixpu4NGvA_p4lA&usqp=CAU">
      <div class="w-full md:w-3/5 px-3 flex flex-col mt-4 md:mt-0">
        <%-- start upload info promotion --%>
          <form id="addPromotionForm" action="javascript:addPromotion()" method="post" enctype="multipart/form-data">
            <div class="w-full">
              <div class="mt-1 flex justify-center rounded-md border-2 border-dashed border-gray-300 px-6 pt-5 pb-6">
                <div class="space-y-1 text-center">
                  <svg class="mx-auto h-12 w-12 text-gray-400" stroke="currentColor" fill="none" viewBox="0 0 48 48" aria-hidden="true">
                    <path d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4H12a4 4 0 01-4-4v-4m32-4l-3.172-3.172a4 4 0 00-5.656 0L28 28M8 32l9.172-9.172a4 4 0 015.656 0L28 28m0 0l4 4m4-24h8m-4-4v8m-12 4h.02" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                  </svg>
                  <div class="flex text-sm text-gray-600">
                    <label for="file-upload" class="relative cursor-pointer rounded-md font-medium text-indigo-600 focus-within:outline-none focus-within:ring-2 focus-within:ring-indigo-500 focus-within:ring-offset-2 hover:text-indigo-500">
                      <span>Upload a file</span>
                      <input id="file-upload" accept="image/*" id="file-upload" name="file-upload" type="file" class="sr-only">
                    </label>
                    <p class="pl-1">or drag and drop</p>
                  </div>
                  <p class="text-xs text-gray-500">PNG, JPG, GIF up to 10MB</p>
                </div>
              </div>
            </div>
            <div class="flex my-6 justify-center">
              <div class="w-1/2 flex item-center">
                <input value="0" type="number" id="posentage" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
                <span class="font-bold mr-3 mt-1.5">%</span>
              </div>
              <div class="w-1/2">
                <button type="button" data-modal-toggle="get-all-modal" class="bg-white border focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full px-5 py-2.5 text-center">Choose rooms</button>
              </div>
            </div>
            <div class="flex my-6 justify-center">
              <div class="w-1/2 flex flex-col item-center">
                <span class="mr-3 mt-1.5">start date</span>
                <input value="0" type="date" id="start-date" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
              </div>
              <div class="w-1/2 flex flex-col item-center ml-2">
                <span class="mr-3 mt-1.5">end date</span>
                <input value="0" type="date" id="end-date" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
              </div>
            </div>
<%--            <input type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full px-5 py-2.5 text-center" value="Update">--%>
            <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full px-5 py-2.5 text-center">
              <svg id="loadingUpdate" role="status" class="inline mr-3 w-4 h-4 text-white animate-spin" viewBox="0 0 100 101" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z" fill="#E5E7EB"/>
                <path d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z" fill="currentColor"/>
              </svg>
              Update
              <span id="loadingNotes">...</span>
            </button>
          </form>
          <%-- end upload info promotion --%>
        </div>
      </div>
    </div>
  </div>
</div>
<script>
  // hide elemment when loading page
  $("#toast-success").hide()
  $("#loadingUpdate").hide()
  $("#loadingNotes").hide()
  // get promotion
  getPromotion()
  function getPromotion() {
    $.ajax({
      url  : "/admin/promotion/get",
      type : "get",
      success : function (response){
        const res = JSON.parse(response);
        console.log("----------")
        console.log(res)
        $("#promo-image").attr("src", "${pageContext.request.contextPath}/assets/uploads/"+ res[0].image_src);
        $("#end-date").val(res[0].end_date);
        $("#start-date").val(res[0].start_date);
        $("#posentage").val(res[0].percentage);
      },
      error : function (error){
        toastError("Connection failed !!!")
      }
    })
  }
  // get all rooms
  getAllRooms()
  function getAllRooms() {
    var ulRoomsHtml = '';
    $.ajax({
      url  : "/admin/room/get",
      type : "get",
      success : function (response){
        const res = JSON.parse(response);
        res.forEach((item) => {
          console.log(item.room_number)
          ulRoomsHtml += '<li class="w-full"> <div class="flex items-center pl-3">';
          ulRoomsHtml +='<input id="vue-checkbox-list" type="checkbox" value="' + item.id_room + '" class="w-4 h-4 bg-green-100 text-green-500 rounded checked:bg-green-500 focus:ring-green-500 focus:bg-green-500"';
          item.promo_id ? ulRoomsHtml +='checked>' : '>'
          ulRoomsHtml +='<label for="vue-checkbox-list" class="py-3 ml-2 w-full text-sm font-medium text-gray-900">' + item.room_number + '</label>';
          ulRoomsHtml +='</div> </li>';
        })
        $("#allRooms").html(ulRoomsHtml);
      },
      error : function (error){
        toastError("Connection failed !!!")
      }
    })
  }
  // validate add promotion
  validateAddPromotion();
  function validateAddPromotion(percentage, startDate, endDate, roomsId) {
    if(percentage == 0 || startDate == "" || endDate == "" || roomsId.length == 0) return 0
    return 1
  }
  // add promotion
 function addPromotion() {
    const formData = new FormData();
    let file = $("#file-upload")[0].files[0]
    let percentage = $("#posentage").val()
    let startDate = $("#start-date").val()
    let endDate = $("#end-date").val()
    var roomsId = Array();
    $('input[type=checkbox]:checked').each(function () {
      let sThisVal = (this.checked ? $(this).val() : "");
      roomsId.push(sThisVal)
    });
   let isValidat = validateAddPromotion(percentage, startDate, endDate, roomsId);
   if(isValidat == 1) {
     file ? formData.append("statusFile", "true") : formData.append("statusFile", "false")
     formData.append("fileSrc", file)
     formData.append("percentageParam", percentage)
     formData.append("startDateParam", startDate)
     formData.append("endDateParam", endDate)
     formData.append("roomsParam", JSON.stringify(roomsId))
     $("#loadingUpdate").show()
     $("#loadingNotes").show()
     $.ajax({
       url : "/admin/promotion/update",
       type: "post",
       data: formData,
       processData: false,
       contentType: false,
       enctype: 'multipart/form-data',
       success : function (response){
         const res = JSON.parse(response);
         $("#promo-image").attr("src", "${pageContext.request.contextPath}/assets/uploads/"+ res.src)
         $("#loadingUpdate").hide()
         $("#loadingNotes").hide()
         toastSuccess("Promotion added successfully.")
       },
       error : function (error){
         toastError("Connection failed !!!.")
       }
     })
   }else {
     toastError("All informations required.")
   }
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
