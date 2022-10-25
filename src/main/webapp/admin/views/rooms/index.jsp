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
<script type="text/javascript">
  const currentUrl = window.location.href.split("?")
  if (currentUrl.length>1){
    let message = currentUrl[1].split("&")[1].split("=")[1].split("%20").join(' ')
    if(currentUrl[1].split("&")[0].includes("true")){
      Swal.fire(
          "Awesome!!",
          message,
          'success'
      )
    }else{
      Swal.fire(
          "Try again!!",
            message,
          'error'
      )
    }
  }
  fetchData()
  function fetchData() {
    const tableRooms = document.getElementById("dataRooms-data");
    tableRooms.innerHTML = "<h2 class='text-green-500'>Data loading...</h2>"
    $.ajax({
      url : "/admin/room/get",
      type : "GET",
      success : function (response){
        const dataRooms = JSON.parse(response)
        console.log(dataRooms)
        let stringHtml=""
        for (const room of dataRooms) {
          stringHtml += "<tr class='bg-white border-b hover:bg-gray-50'><th scope='row' class='py-4 px-6 font-medium text-gray-900 whitespace-nowrap'>"+room.room_number+" </th> <td class='py-4 px-6'>"+room.floor_number+" </td> <td class='py-4 px-6'>"+room.type_room+"  <td class='py-4 px-6 text-right flex md:flex hidden'> <button type='button' onclick='deleteRoom("+room.id_room+")' > <svg width='18px' height='18px' viewBox='0 0 18 18' xmlns='http://www.w3.org/2000/svg'> <path fill='#FF0000' d='M13 18H5a2 2 0 0 1-2-2V7a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v9a2 2 0 0 1-2 2zm3-15a1 1 0 0 1-1 1H3a1 1 0 0 1 0-2h3V1a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v1h3a1 1 0 0 1 1 1z'></path> </svg> </button> <button type='button' onclick='editRoom("+room.id_room+")' class='ml-4'> <svg fill='#0000FF' width='24px' height='24px' viewBox='0 0 24 24' xmlns='http://www.w3.org/2000/svg'><path d='m18.988 2.012 3 3L19.701 7.3l-3-3zM8 16h3l7.287-7.287-3-3L8 13z'></path><path d='M19 19H8.158c-.026 0-.053.01-.079.01-.033 0-.066-.009-.1-.01H5V5h6.847l2-2H5c-1.103 0-2 .896-2 2v14c0 1.104.897 2 2 2h14a2 2 0 0 0 2-2v-8.668l-2 2V19z'/></svg> </button> </td> </tr>"
        }
        tableRooms.innerHTML = stringHtml;
      },
      error : function (error){
        console.error(error)
      }
    })
  }

  function fetchOneRoom(idRoom){

    $.ajax({
      url : "/admin/room/one",
      type : "POST",
      data: {
        id : idRoom,
      },
      success :  function (response) {
        const room = JSON.parse(response)[0];
        document.getElementById("number_room-edit").value = room.room_number
        document.getElementById("floor_number-edit").value = room.floor_number
        document.getElementById("type_room-edit").value = room.type_room
        document.getElementById("id_room").value = room.id_room
      },
      error : function (error){
        console.error(error)
      }
    })


  }
  // delete room
  function deleteRoom(idRoom){
    console.log(idRoom)
    $.ajax({
      url : "/admin/room/delete",
      type: "post",
      data: {
        id : idRoom,
      },
      success : function (response){
        const res = JSON.parse(response);
          Swal.fire(
              res.success,
              res.message,
              res.success,
          )
        if (res.success === "success"){
          fetchData()
        }
      },
      error : function (error){
        console.error(error)
      }
    })
  }
  function openModal(modalID){
    document.getElementById(modalID).classList.remove("hidden");
  }
  function closeModal(modalID){
    document.getElementById(modalID).classList.add("hidden");
  }
  // edit room
  function  editRoom(id){
    openModal("edit-room-modal")
    fetchOneRoom(id)
  }

</script>
</body>
</html>
