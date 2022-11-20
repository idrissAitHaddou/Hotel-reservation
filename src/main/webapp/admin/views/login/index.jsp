<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap"
            rel="stylesheet"
    />
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {}
            }
        }
    </script>
    <style type="text/tailwindcss">
        @layer utilities {
            .content-auto {
                content-visibility: auto;
            }
        }
    </style>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    <link rel="stylesheet" href="https://unpkg.com/flowbite@1.5.3/dist/flowbite.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
    <div id="loadingValidateLogin" class="bg-blue-500 absolute z-[9999] right-10 top-8 flex items-center px-4 py-2 text-gray-500 rounded-lg shadow" role="alert">
        <button
                type="submit"
                class="text-white font-semibold"
        >
        <svg role="status" class="inline mb-0.5 mr-1 w-4 h-4 text-white animate-spin" viewBox="0 0 100 101" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z" fill="#E5E7EB"/>
            <path d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z" fill="currentColor"/>
        </svg>
        Login...
        </button>
    </div>
    <div id="toast-success" class="absolute z-[999999] right-2 top-6 flex items-center p-4 mb-4 w-full max-w-xs text-gray-500 rounded-lg shadow" role="alert"></div>
    <div class="flex items-center min-h-screen p-4 bg-gray-100 lg:justify-center">
        <div class="flex flex-col overflow-hidden bg-white rounded-md shadow-lg max md:flex-row md:flex-1 lg:max-w-screen-md">
            <div class="p-4 py-6 text-white bg-blue-500 md:w-80 md:flex-shrink-0 md:flex md:flex-col md:items-center md:justify-evenly">
                <div class="my-3 text-4xl font-bold tracking-wider text-center">
                    <a href="#">Hotel - IDMA</a>
                </div>
                <p class="mt-6 font-normal text-center text-gray-300 md:mt-0">
                    Garantie de prix sur les hôtels les mieux notés. Réservez vite pour faire des économies ! Choisissez des
                    hôtels avec annulation gratuite pour être remboursé si vos plans changent.
                </p>
                <p class="mt-6 text-sm text-center text-gray-300">
                    Your welcome in Hotel - IDMA
                </p>
            </div>
            <div class="p-5 bg-white md:flex-1">
                <h3 class="my-4 text-2xl font-semibold text-gray-700">Account Login</h3>
                <form method="post" action="javascript:login()" class="flex flex-col space-y-5">
                    <div class="flex flex-col space-y-1">
                        <label for="email" class="text-sm font-semibold text-gray-500">Email address</label>
                        <input
                                type="email"
                                id="email"
                                autofocus
                                class="px-4 py-2 transition duration-300 border border-gray-300 rounded focus:border-transparent focus:outline-none focus:ring-4 focus:ring-blue-200"
                        />
                    </div>
                    <div class="flex flex-col space-y-1">
                        <div class="flex items-center justify-between">
                            <label for="password" class="text-sm font-semibold text-gray-500">Password</label>
                            <a href="#" class="text-sm text-blue-600 hover:underline focus:text-blue-800">Forgot Password?</a>
                        </div>
                        <input
                                type="password"
                                id="password"
                                class="px-4 py-2 transition duration-300 border border-gray-300 rounded focus:border-transparent focus:outline-none focus:ring-4 focus:ring-blue-200"
                        />
                    </div>
                    <div class="flex items-center space-x-2">
                        <input
                                type="checkbox"
                                id="remember"
                                class="w-4 h-4 transition duration-300 rounded focus:ring-2 focus:ring-offset-0 focus:outline-none focus:ring-blue-200"
                        />
                        <label for="remember" class="text-sm font-semibold text-gray-500">Remember me</label>
                    </div>
                    <div>
                        <button
                                type="submit"
                                class="w-full px-4 py-2 text-lg font-semibold text-white transition-colors duration-300 bg-blue-500 rounded-md shadow hover:bg-blue-600 focus:outline-none focus:ring-blue-200 focus:ring-4"
                        >
                            Log in
                        </button>
                    </div>
                    <div class="flex flex-col space-y-5">
                  <span class="flex items-center justify-center space-x-2">
                    <span class="h-px bg-gray-400 w-14"></span>
                    <span class="font-normal text-gray-500">or login with</span>
                    <span class="h-px bg-gray-400 w-14"></span>
                  </span>
                        <div class="flex flex-col space-y-4">
                            <a
                                    href="#"
                                    class="flex items-center justify-center px-4 py-2 space-x-2 transition-colors duration-300 border border-gray-800 rounded-md group hover:bg-gray-800 focus:outline-none"
                            >
                      <span>
                        <svg
                                class="w-5 h-5 text-gray-800 fill-current group-hover:text-white"
                                viewBox="0 0 16 16"
                                version="1.1"
                                aria-hidden="true"
                        >
                          <path
                                  fill-rule="evenodd"
                                  d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0016 8c0-4.42-3.58-8-8-8z"
                          ></path>
                        </svg>
                      </span>
                                <span class="text-sm font-medium text-gray-800 group-hover:text-white">Github</span>
                            </a>
                            <a
                                    href="#"
                                    class="flex items-center justify-center px-4 py-2 space-x-2 transition-colors duration-300 border border-blue-500 rounded-md group hover:bg-blue-500 focus:outline-none"
                            >
                      <span>
                        <svg class="text-blue-500 group-hover:text-white" width="20" height="20" fill="currentColor">
                          <path
                                  d="M6.29 18.251c7.547 0 11.675-6.253 11.675-11.675 0-.178 0-.355-.012-.53A8.348 8.348 0 0020 3.92a8.19 8.19 0 01-2.357.646 4.118 4.118 0 001.804-2.27 8.224 8.224 0 01-2.605.996 4.107 4.107 0 00-6.993 3.743 11.65 11.65 0 01-8.457-4.287 4.106 4.106 0 001.27 5.477A4.073 4.073 0 01.8 7.713v.052a4.105 4.105 0 003.292 4.022 4.095 4.095 0 01-1.853.07 4.108 4.108 0 003.834 2.85A8.233 8.233 0 010 16.407a11.616 11.616 0 006.29 1.84"
                          ></path>
                        </svg>
                      </span>
                                <span class="text-sm font-medium text-blue-500 group-hover:text-white">Twitter</span>
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
<script>
    // hide elemment when loading page
    $("#toast-success").hide()
    $("#loadingValidateLogin").hide()
    // login
    function login() {
        let password = $("#password").val()
        let email = $("#email").val()
        let validateValue = validateAdminInfo(password, email);
        if(validateValue == 1) {
            $("#loadingValidateLogin").show()
                const formCheckPassword = new FormData();
                formCheckPassword.append("password", password)
                formCheckPassword.append("email", email)
                $.ajax({
                    url : "/admin/validate/login",
                    type: "post",
                    data: formCheckPassword,
                    processData: false,
                    contentType: false,
                    success : function (response){
                        const res = JSON.parse(response);
                        $("#loadingValidateLogin").hide()
                        res.message == "success" ? window.location = "http://localhost:8080/admin/dashboard" : toastError("Password or Email not invalid !!!", "toast-success")
                    },
                    error : function (error){
                        $("#loadingValidateLogin").hide()
                        toastError("Connection failed !!!", "toast-success")
                    }
                })
        } else {
            toastError("All informations required.", "toast-success")
        }
    }
    // validate admin info for login
    function validateAdminInfo(password, email) {
        if(password == '' || email == '') return 0
        return 1
    }
    // view errors like toast
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
