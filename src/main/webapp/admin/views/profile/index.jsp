<html>
<head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
<div id="toast-success" class="absolute z-[999999] right-2 -top-2 flex items-center p-4 mb-4 w-full max-w-xs text-gray-500 rounded-lg shadow" role="alert"></div>
<div class="p-6">
  <nav class="flex justify-between mb-2" aria-label="Breadcrumb">
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
          <a href="#" class="ml-1 text-sm font-medium text-gray-700 hover:text-gray-900 md:ml-2 dark:text-gray-400 dark:hover:text-white">Profile</a>
        </div>
      </li>
    </ol>
  </nav>
  <div class="flex flex-col md:flex-row md:justify-around justify-center mt-6">
    <div class="mx-auto md:mx-0 bg-white p-4 rounded-lg border border-gray-100 md:w-1/3 w-1/2 h-64 mb-8 md:mb-0">
      <img class="mx-auto w-36 h-36 rounded-full" src="/assets/images/profileImg.svg" alt="">
      <div class="text-xs flex flex-col justify-center item-center text-left mt-2">
        <span class="text-center mb-1" id="spEmail"></span>
        <span class="text-center mb-1" id="spFirstname"></span>
        <span class="text-center" id="spLastname"></span>
      </div>
    </div>
    <div class="w-full md:w-1/2 mb-8">
      <%-- all information --%>
      <form class="space-y-6 bg-white p-4 rounded-lg border border-gray-100" method="post" action="javascript:editAdmin()">
        <div class="mb-6 flex md:flex-row flex-col justify-between">
          <div class="w-full">
            <label for="firstname" class="block mb-2 text-sm font-medium text-gray-700">First Name</label>
            <input type="text" id="firstname" class="w-full bg-gray-50 border border-gray-300 text-gray-900 placeholder-gray-700 rounded-lg">
          </div>
          <div class="w-full ml-2">
            <label for="lastname" class="block mb-2 text-sm font-medium text-gray-700">Last Name</label>
            <input type="text" id="lastname" class="w-full bg-gray-50 border border-gray-300 text-gray-900 placeholder-gray-700 rounded-lg">
          </div>
        </div>
        <div class="mb-6 flex md:flex-row flex-col justify-between">
          <div class="w-full">
            <label for="email" class="block mb-2 text-sm font-medium text-gray-700">Email</label>
            <input type="text" id="email" class="w-full bg-gray-50 border border-gray-300 text-gray-900 placeholder-gray-700 rounded-lg">
          </div>
        </div>
        <div class="flex justify-end">
          <button type="submit" class="w-auto text-center py-2 px-3 bg-blue-400 rounded-lg text-white">
            <svg id="loadingEdit" role="status" class="inline mb-0.5 mr-3 w-4 h-4 text-white animate-spin" viewBox="0 0 100 101" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z" fill="#E5E7EB"/>
              <path d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z" fill="currentColor"/>
            </svg>
            Update
          </button>
        </div>
      </form>
      <%-- chnage the password --%>
        <form class="relative space-y-6 bg-white p-4 rounded-lg border border-gray-100" method="post" action="javascript:validatePassword()">
          <div id="toast-success-password" class="absolute z-[999999] right-2 -top-2 flex items-center p-4 mb-4 w-full max-w-xs text-gray-500 rounded-lg shadow" role="alert"></div>
          <div class="mb-6 flex md:flex-row flex-col justify-between">
            <div class="w-full">
              <label for="old-password" class="block mb-2 text-sm font-medium text-gray-700">Old password</label>
              <input type="text" id="old-password" class="w-full bg-gray-50 border border-gray-300 text-gray-900 placeholder-gray-700 rounded-lg">
            </div>
          </div>
          <div class="mb-6 flex md:flex-row flex-col justify-between">
            <div class="w-full">
              <label for="newPassword" class="block mb-2 text-sm font-medium text-gray-700">New password</label>
              <input type="text" id="newPassword" class="w-full bg-gray-50 border border-gray-300 text-gray-900 placeholder-gray-700 rounded-lg">
            </div>
          </div>
          <div class="mb-6 flex md:flex-row flex-col justify-between">
            <div class="w-full">
              <label for="newPasswordConfirme" class="block mb-2 text-sm font-medium text-gray-700">Confirme new password</label>
              <input type="text" id="newPasswordConfirme" class="w-full bg-gray-50 border border-gray-300 text-gray-900 placeholder-gray-700 rounded-lg">
            </div>
          </div>
          <div class="flex justify-end">
            <button type="submit" class="w-auto text-center py-2 px-3 bg-blue-400 rounded-lg text-white">
              <svg id="loadingEditPassowrd" role="status" class="inline mb-0.5 mr-3 w-4 h-4 text-white animate-spin" viewBox="0 0 100 101" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z" fill="#E5E7EB"/>
                <path d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z" fill="currentColor"/>
              </svg>
              Change
            </button>
          </div>
        </form>
    </div>
  </div>
</div>
<script>
  // hide elemment when loading page
  $("#toast-success").hide()
  $("#toast-success-password").hide()
  $("#loadingEdit").hide()
  $("#loadingEditPassowrd").hide()
  // validate password from database
  function validatePassword(oldPassword) {
    let oldPasswordValid = $("#old-password").val()
    let newPasswordValid = $("#newPassword").val()
    let newPasswordConfirmeValid = $("#newPasswordConfirme").val()
    let validateValue = validateAdminInfo(oldPasswordValid, newPasswordValid, newPasswordConfirmeValid);
    if(validateValue == 1) {
      const formCheckPassword = new FormData();
      formCheckPassword.append("password", oldPassword)
      $.ajax({
        url : "/admin/check/password",
        type: "post",
        data: formCheckPassword,
        processData: false,
        contentType: false,
        success : function (response){
          const res = JSON.parse(response);
          console.log(res.message)
          res.message == "success" ? chnagePassword() : toastError("The password invalid !!!", "toast-success-password")
        },
        error : function (error){
          toastError("Connection failed !!!", "toast-success-password")
          $("#loadingEditPassowrd").hide()
        }
      })
    } else {
      $("#loadingEditPassowrd").hide()
      toastError("All informations required.", "toast-success-password")
    }
  }
  // change the password
  function chnagePassword() {
    const formData = new FormData();
    let oldPassword = $("#old-password").val()
    let newPassword = $("#newPassword").val()
    let newPasswordConfirme = $("#newPasswordConfirme").val()
      // if(message == "success") {
      //   formData.append("password", newPassword)
        toastSuccess("Password updated successfully.", "toast-success-password")
        // $("#loadingEdit").show()
        // $.ajax({
        //   url : "/admin/update",
        //   type: "post",
        //   data: formData,
        //   processData: false,
        //   contentType: false,
        //   success : function (response){
        //     getAdmin()
        //     $("#loadingEdit").hide()
        //     const res = JSON.parse(response);
        //     if(res.message == "success") {
        //       $("#spFirstname").html("Firstname : " + firstname)
        //       $("#spLastname").html("Lastname : " + lastname)
        //       $("#spEmail").html("Email : " + email)
        //       toastSuccess("Info updated successfully.", "toast-success-password")
        //     }else {
        //       toastError("Info not updated !!!", "toast-success-password")
        //     }
        //   },
        //   error : function (error){
        //     toastError("Connection failed !!!", "toast-success-password")
        //   }
        // })
  }
  // validate edit admin info
  function validateAdminInfo(firstname, lastname, email) {
    if(firstname == '' || lastname == '' || email == '') return 0
    return 1
  }
  // edit admin info
  function editAdmin() {
    const formData = new FormData();
    let firstname = $("#firstname").val()
    let lastname = $("#lastname").val()
    let email = $("#email").val()
    formData.append("firstname", firstname)
    formData.append("lastname", lastname)
    formData.append("email", email)
    let validateValue = validateAdminInfo(firstname, lastname, email);
    if(validateValue == 1) {
      $("#loadingEdit").show()
      $.ajax({
        url : "/admin/update",
        type: "post",
        data: formData,
        processData: false,
        contentType: false,
        success : function (response){
          getAdmin()
          $("#loadingEdit").hide()
          const res = JSON.parse(response);
          if(res.message == "success") {
            $("#spFirstname").html("Firstname : " + firstname)
            $("#spLastname").html("Lastname : " + lastname)
            $("#spEmail").html("Email : " + email)
            toastSuccess("Info updated successfully.", "toast-success")
          }else {
            toastError("Info not updated !!!", "toast-success")
          }
        },
        error : function (error){
          toastError("Connection failed !!!", "toast-success")
        }
      })
    } else {
      $("#loadingEdit").hide()
      toastError("All informations required.", "toast-success")
    }
  }
  // get all info admin
  getAdmin()
  function getAdmin(){

    $.ajax({
      url : "/admin/get",
      type : "get",
      success :  function (response) {
        const admin = JSON.parse(response)[0];
        $("#firstname").val(admin.firstname)
        $("#lastname").val(admin.lastname)
        $("#email").val(admin.email)

        $("#spFirstname").html("Firstname : " + admin.firstname)
        $("#spLastname").html("Lastname : " + admin.lastname)
        $("#spEmail").html("Email : " + admin.email)
      },
      error : function (error){
        toastError("Connection failed !!!", "toast-success")
      }
    })


  }
  function toastSuccess(message, id) {
    let   element ='<div class="inline-flex flex-shrink-0 justify-center items-center w-8 h-8 text-green-500 bg-green-100 rounded-lg">'
    element +='<svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path></svg>'
    element +='<span class="sr-only text-gray-600">Check icon</span></div>'
    element +='<div class="ml-3 text-sm font-normal">'
    element += message + ' </div>'
    $("#"+id+"").html(element)
    $("#"+id+"").addClass("bg-green-200")
    $("#"+id+"").removeClass("bg-red-200")
    $("#"+id+"").show(100)
    setTimeout(function () {
      $("#"+id+"").hide()
    },3000)
  }

  function toastError(message, id) {
    let   element ='<div class="inline-flex flex-shrink-0 justify-center items-center w-8 h-8 text-red-500 bg-red-100 rounded-lg">'
    element +='<svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path></svg>'
    element +='<span class="sr-only text-gray-600">Check icon</span></div>'
    element +='<div class="ml-3 text-sm font-normal">'
    element += message + ' </div>'
    $("#"+id+"").html(element)
    $("#"+id+"").addClass("bg-red-200")
    $("#"+id+"").removeClass("bg-green-200")
    $("#"+id+"").show(100)
    setTimeout(function () {
      $("#"+id+"").hide()
    },3000)
  }
</script>
</body>
</html>