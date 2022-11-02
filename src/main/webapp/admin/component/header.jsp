<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hotel</title>
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
                extend: {
                    colors: {
                        mainTextActive: '#b66dff',
                        mainBg : '#f2edf3',
                        bgWhite : '#ffffff',
                        mainText : "#9C9FA6"
                    }
                }
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
    <script>
        function toogleAsideBar() {
            const aside = document.querySelector(".aside-bar");
            aside.classList.toggle("hidden");
            console.log(aside)
        }
    </script>
</head>
<body>
<div class="h-screen w-full bg-white relative flex">
    <div class="w-full flex flex-col">
        <div class="w-full h-20">
            <!-- Header -->
            <header class="h-full w-full flex items-center space-x-10">
                <nav class="bg-white w-full flex relative justify-between items-center mx-auto px-4 h-20">
                    <!-- logo -->
                    <div class="flex justify-start md:justify-between item-center w-56">
                        <a class="_o6689fn" href="/admin/dashboard">
                            <div class="">
                               <img class="hidden md:block w-28 h-6 scale-150" src="/assets/logo.svg">
                                <img class="block md:hidden w-28 h-10" src="/assets/miniLogo.svg">
                            </div>
                        </a>
                        <div>
                            <svg onclick="toogleAsideBar()" class="mt-2 m ml-0 md:ml-0 md:my-auto cursor-pointer" width="25px" height="25px" fill="#494c4e" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <g>
                                    <path fill="none" d="M0 0h24v24H0z"/>
                                    <path d="M18 18v2H6v-2h12zm3-7v2H3v-2h18zm-3-7v2H6V4h12z"/>
                                </g>
                            </svg>
                        </div>
                    </div>
                    <!-- end logo -->
                    <div class="flex h-20 w-96 justify-between">
                        <%-- start profile --%>
                        <div class="flex items-center mr-2">
                            <button type="button" data-dropdown-toggle="language-dropdown-menu" class="inline-flex justify-center items-center p-2 text-sm rounded cursor-pointer">
                                <div class="relative">
                                    <img class="w-8 h-8 rounded-full mr-6" src="/assets/images/profileImg.svg" alt="">
                                    <span class="top-0 left-7 absolute  w-2.5 h-2.5 bg-green-400 border-1 border-white dark:border-gray-800 rounded-full"></span>
                                </div>
                                idriss@gmail.com
                            </button>
                        </div>
                        <!-- Dropdown profile -->
                        <div class="w-48 hidden z-50 my-4 text-base list-none bg-white rounded divide-y shadow" id="language-dropdown-menu">
                            <ul class="py-1" role="none">
                                <li>
                                    <a href="/admin/profile" class="block py-2 px-1 text-sm" role="menuitem">
                                        <div class="ml-3 w-full flex justify-start items-center">
                                            <svg width="18px" height="18px" viewBox="0 0 18 18" xmlns="http://www.w3.org/2000/svg">
                                                <path fill="#494c4e" d="M9 0a9 9 0 0 0-9 9 8.654 8.654 0 0 0 .05.92 9 9 0 0 0 17.9 0A8.654 8.654 0 0 0 18 9a9 9 0 0 0-9-9zm5.42 13.42c-.01 0-.06.08-.07.08a6.975 6.975 0 0 1-10.7 0c-.01 0-.06-.08-.07-.08a.512.512 0 0 1-.09-.27.522.522 0 0 1 .34-.48c.74-.25 1.45-.49 1.65-.54a.16.16 0 0 1 .03-.13.49.49 0 0 1 .43-.36l1.27-.1a2.077 2.077 0 0 0-.19-.79v-.01a2.814 2.814 0 0 0-.45-.78 3.83 3.83 0 0 1-.79-2.38A3.38 3.38 0 0 1 8.88 4h.24a3.38 3.38 0 0 1 3.1 3.58 3.83 3.83 0 0 1-.79 2.38 2.814 2.814 0 0 0-.45.78v.01a2.077 2.077 0 0 0-.19.79l1.27.1a.49.49 0 0 1 .43.36.16.16 0 0 1 .03.13c.2.05.91.29 1.65.54a.49.49 0 0 1 .25.75z"/>
                                            </svg>
                                            <span class="ml-2 text-sm">idriss profile</span>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <!-- Dropdown profile -->
                        <div class="w-48 hidden z-50 my-4 text-base list-none bg-white rounded divide-y shadow" id="language-dropdown-menu">
                            <ul class="py-1" role="none">
                                <li>
                                    <a href="/admin/profile" class="block py-2 px-1 text-sm" role="menuitem">
                                        <div class="ml-3 w-full flex justify-start items-center">
                                            <svg width="18px" height="18px" viewBox="0 0 18 18" xmlns="http://www.w3.org/2000/svg">
                                                <path fill="#494c4e" d="M9 0a9 9 0 0 0-9 9 8.654 8.654 0 0 0 .05.92 9 9 0 0 0 17.9 0A8.654 8.654 0 0 0 18 9a9 9 0 0 0-9-9zm5.42 13.42c-.01 0-.06.08-.07.08a6.975 6.975 0 0 1-10.7 0c-.01 0-.06-.08-.07-.08a.512.512 0 0 1-.09-.27.522.522 0 0 1 .34-.48c.74-.25 1.45-.49 1.65-.54a.16.16 0 0 1 .03-.13.49.49 0 0 1 .43-.36l1.27-.1a2.077 2.077 0 0 0-.19-.79v-.01a2.814 2.814 0 0 0-.45-.78 3.83 3.83 0 0 1-.79-2.38A3.38 3.38 0 0 1 8.88 4h.24a3.38 3.38 0 0 1 3.1 3.58 3.83 3.83 0 0 1-.79 2.38 2.814 2.814 0 0 0-.45.78v.01a2.077 2.077 0 0 0-.19.79l1.27.1a.49.49 0 0 1 .43.36.16.16 0 0 1 .03.13c.2.05.91.29 1.65.54a.49.49 0 0 1 .25.75z"/>
                                            </svg>
                                            <span class="ml-2 text-sm">idriss profile</span>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <%-- end profile --%>
                        <button type="button" class="inline-flex items-center relative px-2">
                            <svg fill="#9C9FA6" width="20px" height="20px" viewBox="0 0 32 32" id="icon" xmlns="http://www.w3.org/2000/svg"><defs><style>.cls-1{fill:none;}</style></defs><title>email--new</title><path d="M19,24H4L3.9966,8.9062l11.4341,7.9161a1.0008,1.0008,0,0,0,1.1386,0L28,8.9087,28,18h2V8a2.0027,2.0027,0,0,0-2-2H4A2.0023,2.0023,0,0,0,2,8V24a2.0027,2.0027,0,0,0,2,2H19ZM25.7986,8,16,14.7837,6.2014,8Z"/><circle cx="26" cy="24" r="4" fill="#FED713"/><rect id="_Transparent_Rectangle_" data-name="&lt;Transparent Rectangle&gt;" class="cls-1" width="32" height="32"/></svg>
                        </button>
                        <button type="button" class="inline-flex items-center relative px-2">
                            <svg fill="#9C9FA6" width="20px" height="20px" viewBox="0 0 32 32" id="icon" xmlns="http://www.w3.org/2000/svg">
                                <defs>
                                    <style>
                                        .cls-1 {
                                            fill: none;
                                        }
                                    </style>
                                </defs>
                                <path d="M26,16.5859V14H24v3a1,1,0,0,0,.293.707L27,20.4141V22H5V20.4141L7.707,17.707A1,1,0,0,0,8,17V13A7.9854,7.9854,0,0,1,20,6.0825V3.8467a9.896,9.896,0,0,0-3-.7959V1H15V3.0508A10.0136,10.0136,0,0,0,6,13v3.5859L3.293,19.293A1,1,0,0,0,3,20v3a1,1,0,0,0,1,1h7v1a5,5,0,0,0,10,0V24h7a1,1,0,0,0,1-1V20a1,1,0,0,0-.293-.707ZM19,25a3,3,0,0,1-6,0V24h6Z"/>
                                <circle cx="26" cy="8" r="4" fill="#FE7C96"/>
                                <rect id="_Transparent_Rectangle_" data-name="&lt;Transparent Rectangle&gt;" class="cls-1" width="32" height="32"/>
                            </svg>
                        </button>
                        <a href="/admin/logout" type="button" class="inline-flex items-center relative px-2">
                            <svg width="20px" height="20px" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path fill="none" stroke="#9C9FA6" stroke-width="2" d="M16,4 C19.3637732,5.43018182 22,8.98935065 22,13 C22,18.6008831 17.5273457,23 12,23 C6.47265429,23 2,18.6008831 2,13 C2,8.98935065 4.63622679,5.43018182 8,4 M12,1 L12,11"/>
                            </svg>
                        </a>
                    </div>
                    <!-- end login -->
                </nav>
            </header>

        </div>
        <div class="w-full flex justify-between">