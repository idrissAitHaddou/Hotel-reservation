<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="bg-transparent absolute z-10 w-full ">
    <div class="max-w-7xl flex justify-center my-6 mx-auto px-2 sm:px-6 lg:px-8">
        <div class="relative flex justify-between h-16">
            <div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
                <!-- Mobile menu button -->
                <button type="button" class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-500" aria-controls="mobile-menu" aria-expanded="false">
                    <span class="sr-only">Open main menu</span>
                    <svg class="block h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
                    </svg>
                    <svg class="hidden h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                    </svg>
                </button>
            </div>
            <div class="flex-1 flex items-center justify-center gap-12 sm:items-stretch sm:justify-start">
                <div class="flex-shrink-0 flex items-center">
                    <img class="block h-12 w-auto" src="/assets/images/logo/logoHotel.png" alt="Hotel Holiday">
                    </div>
                <div class="sm:ml-6 sm:flex sm:space-x-20">
                    <!-- Current: "border-indigo-500 text-gray-900", Default: "border-transparent text-gray-500 hover:border-gray-300 hover:text-gray-700" -->
                    <c:choose>
                        <c:when test='${param.current.equals("home")}'>
                            <a href="/" class="border-indigo-500 text-gray-900 inline-flex items-center px-1 pt-1 border-b-2 text-lg font-medium"> Home </a>
                        </c:when>
                        <c:otherwise>
                            <a href="/" class="border-transparent text-gray-500 hover:border-gray-300 hover:text-gray-700 inline-flex items-center px-1 pt-1 border-b-2 text-lg font-medium"> Home </a>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test='${param.current.equals("rooms")}'>
                            <a href="/rooms-suites" class="border-indigo-500 text-gray-900 inline-flex items-center px-1 pt-1 border-b-2 text-lg font-medium"> Rooms & Suite </a>
                        </c:when>
                        <c:otherwise>
                            <a href="/rooms-suites" class="border-transparent text-gray-500 hover:border-gray-300 hover:text-gray-700 inline-flex items-center px-1 pt-1 border-b-2 text-lg font-medium"> Rooms & Suite </a>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test='${param.current.equals("booking")}'>
                            <a href="/booking" class="border-indigo-500 text-gray-900 inline-flex items-center px-1 pt-1 border-b-2 text-lg font-medium"> Booking </a>
                        </c:when>
                        <c:otherwise>
                            <a href="/booking" class="border-transparent text-gray-500 hover:border-gray-300 hover:text-gray-700 inline-flex items-center px-1 pt-1 border-b-2 text-lg font-medium"> Booking </a>
                        </c:otherwise>
                    </c:choose>
                    </div>
            </div>

        </div>
    </div>

    <!-- Mobile menu, show/hide based on menu state. -->

</nav>