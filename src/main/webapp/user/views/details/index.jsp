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
<jsp:include page="patails/slider.jsp"/>
<div class="md:w-8/12 w-full px-6 mx-auto mt-16 flex">
    <div class="w-2/3">
        <div class='flex justify-between '>
            <h4 class='text-sm'>
                <a href='#' class='font-semibold text-lg text-gray-800 hover:text-gray-600'> Single Room </a>
            </h4>
            <h4 class='text-sm font-medium text-gray-500 '>
                <span class='text-lg font-semibold text-gray-800'>$15 <span class='text-sm text-gray-700'>/Per night</span></span>

            </h4>
        </div>
    <%--    text --%>
        <div class="text-[#858a99] text-sm mt-8">
            <p class="">
                Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit… Zril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur.
            </p>
            <ul class="list-disc ml-12 my-3">
                <li class="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>
                <li class="list">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>
                <li class="list">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>
            </ul>
            <p class="">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            </p>
        </div>
        <div class="text-[#858a99] text-sm">
            <h2 class="text-lg font-semibold text-gray-700 my-4">
                Room extra
            </h2>
            <p class="ml-6">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit sunt in culpa qui officia deserunt mollit anim id est laborum.
            </p>
            <ul class="list-disc ml-12 my-3">
                <li class="">Breakfast</li>
                <li class="">Breakfast</li>
                <li class="">Breakfast</li>
                <li class="">Breakfast</li>
                <li class="">Breakfast</li>
                <li class="">Breakfast</li>
                <li class="">Breakfast</li>
                <li class="">Breakfast</li>
                <li class="">Breakfast</li>
            </ul>
        </div>
    </div>
    <div class="w-1/3 ">
        <div class="ml-4 border flex flex-col h-fit px-6 py-3 gap-8">
        <h2 class="text-xl font-semibold text-800">Book Room</h2>
        <div class="flex flex-col">
            <label for="start-date">Check-in</label>
            <input id="start-date" type="date" name="start-date" class="block w-full pr-10 border-[#F97316] text placeholder-[#F97316] focus:outline-none focus:ring-[#F97316] focus:border-[#F97316] sm:text-sm rounded-md"/>
        </div>
        <div class="flex flex-col">
            <label for="end-date">Check-out</label>
            <input id="end-date" type="date" name="end-date" class="block w-full pr-10 border-[#F97316] text placeholder-[#F97316] focus:outline-none focus:ring-[#F97316] focus:border-[#F97316] sm:text-sm rounded-md"/>
        </div>
        <button type="button" class="inline-flex items-center justify-center px-2 py-2 border border-[#F97316] text-sm text-[#F97316] font-medium rounded-md shadow-sm bg-white hover:text-white hover:bg-[#F97316]" >Check Availability</button>
        </div>
        <div class=" my-4 ml-4">
            <img src="/assets/images/sea.jpg" class="max-w-full h-auto" alt="sea"/>
        </div>
    </div>

</div>
<jsp:include page="../../component/footer.jsp"/>

<script type="text/javascript" src="/user/js/roomApi.js"></script>
<script src="https://unpkg.com/flowbite@1.5.3/dist/flowbite.js"></script>
</body>

</html>
