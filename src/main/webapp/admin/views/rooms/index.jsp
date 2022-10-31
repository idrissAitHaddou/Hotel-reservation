<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>rooms</title>
</head>
<body>
<jsp:include page="partails/add.jsp"/>
<jsp:include page="partails/edit.jsp"/>
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
            <a href="#" class="ml-1 text-sm font-medium text-gray-700 hover:text-gray-900 md:ml-2 dark:text-gray-400 dark:hover:text-white">Rooms</a>
          </div>
        </li>
      </ol>
      <button type="button" data-modal-toggle="add-rooms-modal" class="flex py-1 px-3 bg-blue-400 rounded-lg text-white md:flex hidden">
        Add
        <svg class="ml-3" fill="#fff" width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path fill="none" d="M0 0h24v24H0z"></path><path d="M11 11V5h2v6h6v2h-6v6h-2v-6H5v-2z"></path></svg>
      </button>
    </nav>
    <div class="overflow-x-auto relative sm:rounded-lg">
      <table class="w-full text-sm text-left">
        <thead class="bg-white text-xs text-gray-700 uppercase">
        <tr>
          <th scope="col" class="py-3 px-6">
            Room number
          </th>
          <th scope="col" class="py-3 px-6">
            Floor number
          </th>
          <th scope="col" class="py-3 px-6">
            type
          </th>
          <th scope="col" class="py-3 px-6 md:block hidden">
            Actions
          </th>
        </tr>
        </thead>
        <tbody id="dataRooms-data">
        </tbody>
      </table>
    </div>
</div>
<div id="data">
</div>
<%-- start modael for delete one room --%>
<button data-modal-toggle="delete-room-modal" hidden id="btnToogleDeleteModal">show modal</button>
<div id="delete-room-modal" tabindex="-1" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 md:inset-0 h-modal md:h-full">
  <div class="relative p-4 w-full max-w-md h-full md:h-auto">
    <div class="relative bg-white rounded-lg shadow">
      <button data-modal-toggle="delete-room-modal" type="button" class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center">
        <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
        <span class="sr-only">Close modal</span>
      </button>
      <div class="p-6 text-center">
        <svg aria-hidden="true" class="mx-auto mb-4 w-14 h-14 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
        <h3 class="mb-5 text-lg font-normal text-gray-500">Are you sure you want to delete this room?</h3>
        <button id="btnDeleteRoom" type="button" class="text-white bg-red-600 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm inline-flex items-center px-5 py-2.5 text-center mr-2">
          Yes, I'm sure
        </button>
        <button data-modal-toggle="delete-room-modal" type="button" class="text-gray-500 bg-white hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-gray-200 rounded-lg border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10">No, cancel</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
  // hide elemment when loading page
  $("#toast-success").hide()
  $("#loadingAdd").hide()
  $("#loadingEdit").hide()
  // validate add room
  validateRoom();
  function validateRoom(fileUpload, roomNumber, floorNumber, typeRoom) {
    if(fileUpload== null || roomNumber <= 0 || floorNumber <= 0 || typeRoom == "" || typeRoom == null) return 0
    return 1
  }
  function validateEditRoom(roomNumber, floorNumber, typeRoom) {
    if(roomNumber <= 0 || floorNumber <= 0 || typeRoom == "" || typeRoom == null) return 0
    return 1
  }
  function editRoom() {
    var v= 0
    const formData = new FormData();
    let file = $("#edit-file-upload")[0].files[0]
    let numberRoom = $("#edit-number-room").val()
    let floorNumber = $("#edit-floor-number").val()
    let typeRoom = $("#edit-type-room").val()
    let id_room = $("#id_room").val()
    formData.append("file-upload", file)
    formData.append("room_number", numberRoom)
    formData.append("floor_number", floorNumber)
    formData.append("type_room", typeRoom)
    formData.append("id_room", id_room)
    let validateValue = validateEditRoom(numberRoom, floorNumber, typeRoom);
    if(validateValue == 1) {
      $("#loadingAdd").show()
      $.ajax({
        url : "/admin/room/update",
        type: "post",
        data: formData,
        processData: false,
        contentType: false,
        enctype: 'multipart/form-data',
        success : function (response){
          $("#loadingEdit").hide()
          // $("#edit-rooms-modal").toggleClass("hidden")
          // $("#btnToogleEditModal").click()
          const res = JSON.parse(response);
          if(res.message == "success"){
            fetchOneRoom()
            toastSuccess("Room added successfully.")
          } else {
            toastError("Room not added !!!")
          }
          fetchOneRoom(id_room)
        },
        error : function (error){
          toastError("Connection failed !!!")
        }
      })
    } else {
      // $("#loadingAdd").hide()
      toastError("All informations required.")
    }
  }
  function addRoom() {
    const formData = new FormData();
    let file = $("#file-upload")[0].files[0]
    let numberRoom = $("#number_room").val()
    let floorNumber = $("#floor_number").val()
    let typeRoom = $("#type_room").val()
    formData.append("file_upload", file)
    formData.append("room_number", numberRoom)
    formData.append("floor_number", floorNumber)
    formData.append("type_room", typeRoom)
    let validateValue = validateRoom(file, numberRoom, floorNumber, typeRoom);
    if(validateValue == 1) {
      $("#loadingAdd").show()
      $.ajax({
        url : "/admin/room/store",
        type: "post",
        data: formData,
        processData: false,
        contentType: false,
        enctype : "multipart/form-data",
        success : function (response){
          fetchData()
          $("#loadingAdd").hide()
          $("#btn-colse-model").click()
          const res = JSON.parse(response);
          res.message == "success" ? toastSuccess("Room added successfully.") : toastError("Room not added !!!")
        },
        error : function (error){
          toastError("Connection failed !!!")
        }
      })
    } else {
      $("#loadingAdd").hide()
      toastError("All informations required.")
    }
  }

  // get rooms data
  fetchData()
  function fetchData() {
    const tableRooms = document.getElementById("dataRooms-data");
    tableRooms.innerHTML = "<h2 class='text-green-500'>Data loading...</h2>"
    $.ajax({
      url : "/admin/room/get",
      type : "GET",
      success : function (response){
        const dataRooms = JSON.parse(response)
        let stringHtml=""
        for (const room of dataRooms) {
          stringHtml += "<tr class='bg-white border-b hover:bg-gray-50'><th scope='row' class='py-4 px-6 font-medium text-gray-900 whitespace-nowrap'>"+room.room_number+" </th> <td class='py-4 px-6'>"+room.floor_number+" </td> <td class='py-4 px-6'>"+room.type_room+"  <td class='py-4 px-6 text-right flex md:flex hidden'> <button type='button' onclick='showModalDeleteRoom("+room.id_room+")' > <svg width='18px' height='18px' viewBox='0 0 18 18' xmlns='http://www.w3.org/2000/svg'> <path fill='#FF0000' d='M13 18H5a2 2 0 0 1-2-2V7a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v9a2 2 0 0 1-2 2zm3-15a1 1 0 0 1-1 1H3a1 1 0 0 1 0-2h3V1a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v1h3a1 1 0 0 1 1 1z'></path> </svg> </button> <button type='button' onclick='showModalEditRoom("+room.id_room+")' class='ml-4'> <svg fill='#0000FF' width='24px' height='24px' viewBox='0 0 24 24' xmlns='http://www.w3.org/2000/svg'><path d='m18.988 2.012 3 3L19.701 7.3l-3-3zM8 16h3l7.287-7.287-3-3L8 13z'></path><path d='M19 19H8.158c-.026 0-.053.01-.079.01-.033 0-.066-.009-.1-.01H5V5h6.847l2-2H5c-1.103 0-2 .896-2 2v14c0 1.104.897 2 2 2h14a2 2 0 0 0 2-2v-8.668l-2 2V19z'/></svg> </button> </td> </tr>"
        }
        tableRooms.innerHTML = stringHtml;
      },
      error : function (error){
        toastError("Connection failed !!!")
      }
    })
  }

  function fetchOneRoom(idRoom){
    $.ajax({
      url : "/admin/room/one",
      type : "get",
      data: {
        id : idRoom,
      },
      success :  function (response) {
        const data = JSON.parse(response);
        const rooms = data.rooms[0];
        const images = data.images;
        $("#edit-number-room").val(rooms.room_number)
        $("#edit-floor-number").val(rooms.floor_number)
        $("#edit-type-room").val(rooms.type_room)
        $("#id_room").val(rooms.id_room)
        var element = ""
        images.forEach(image => {
          element += "<div class='relative'><span onclick='deleteImageRoom("+image.id_image+","+rooms.id_room+")' class='cursor-pointer font-bold absolute top-1 right-1 bg-gray-700 text-white px-1 py-0 rounded-lg'>X</span><img class='w-28 h-28 mr-4 border rounded-lg shadow' src='${pageContext.request.contextPath}/assets/uploads/rooms/" + image.src + " '></div>"
          console.log(image.src)
        })
        $("#ImagesEditRoom").html(element)
      },
      error : function (error){
       console.log("error")
      }
    })
  }
  function deleteImageRoom(idImage, id_room) {
    $.ajax({
      url : "/admin/room/delete/image",
      type: "post",
      data: {
        id : idImage,
      },
      success : function (response){
        const res = JSON.parse(response);
        if (res.message === "success"){
          fetchOneRoom(id_room)
          toastSuccess("Image deleted successfully")
        }else {
          toastError("Image not deleted !!!")
        }
      },
      error : function (error){
        toastError("Connection failed !!!")
      }
    })
  }
  // show modal for validate delete room
  function showModalDeleteRoom(idRoom) {
    $("#btnDeleteRoom").attr("onclick", "deleteRoom(" + idRoom + ")")
    $("#btnToogleDeleteModal").click()
  }
  // show modal for edit room
  function showModalEditRoom(idRoom) {
    $("#btnEditRoom").attr("onclick", "editRoom(" + idRoom + ")")
    fetchOneRoom(idRoom)
    $("#btnToogleEditModal").click()
  }
  // delete room
  function deleteRoom(idRoom){
    $.ajax({
      url : "/admin/room/delete",
      type: "post",
      data: {
        id : idRoom,
      },
      success : function (response){
        const res = JSON.parse(response);
        if (res.success === "success"){
          fetchData()
          $("#btnToogleDeleteModal").click()
          toastSuccess("Room deleted successfully")
        }else {
          toastError("Room not deleted !!!")
        }
      },
      error : function (error){
        toastError("Connection failed !!!")
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
