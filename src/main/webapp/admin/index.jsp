<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Htel</title>
    <Link rel="stylesheet" href="css/index.css">
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
</head>
<body>
<div class="h-screen w-full bg-white relative flex">
    <div class="w-full flex flex-col">
        <div class="w-full h-20">
            <jsp:include page="component/header.jsp"/>
        </div>
        <div class="w-full flex justify-between">
            <jsp:include page="component/sidebar.jsp"/>
            <!-- Main -->
            <main class="w-full h-full relative bg-[#f2edf3]">
               <jsp:include page="views/home/index.jsp"/>
            </main>
        </div>
    </div>
</div>
<script src="https://unpkg.com/flowbite@1.5.3/dist/flowbite.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>
<script src="js/index.js"></script>
<script src="js/chartsRooms.js"></script>
</body>
</html>