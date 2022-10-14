<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        clifford: '#da373d',
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
       <%-- <jsp:include page="component/header.jsp"/> --%>
        <div class="w-full h-20">
            <jsp:include page="component/header.jsp"/>
        </div>
        <div class="w-full flex justify-between">
            <jsp:include page="component/sidebar.jsp"/>
            <%--<jsp:include page="component/sidebar.jsp"/>--%>
            <!-- Main -->
            <main class="w-full h-full relative bg-[#F2EDF3]">
                <h1 class="h-96">hello world</h1>
                <h1 class="h-96">hello world</h1>
                <h1 class="h-96">hello world</h1>
            </main>
        </div>
    </div>

</div>
<script src="https://unpkg.com/flowbite@1.5.3/dist/flowbite.js"></script>
</body>
</html>