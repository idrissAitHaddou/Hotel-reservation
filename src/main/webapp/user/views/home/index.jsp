<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Htel</title>
    <Link rel="stylesheet" href="user/css/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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

<jsp:include page="../../component/header.jsp" />
<jsp:include page="partails/hero.jsp" />

<div class="px-4 py-10 m-8 ">

    <div class="font-bold text-3xl mx-10  my-2 flex justify-center">The Most booked hotel</div>
    <div class="font-bold text-3xl mx-10 pb-4 mb-8 flex justify-center">
        <svg width="322" height="19" viewBox="0 0 322 19" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M0.999997 17V17C106.745 -2.82723 215.255 -2.82722 321 17V17" stroke="#FF8C32" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"></path>
        </svg>
    </div>
    <div class="flex justify-center gap-4 mb-8">
        <%--        <c:forech var="instanceVar" items="${roomsUrls}">--%>
        <jsp:include page="partails/roomCart.jsp">
            <jsp:param name="myVar" value="argana.jpg"/>
        </jsp:include>
        <jsp:include page="partails/roomCart.jsp">
            <jsp:param name="myVar" value="casablanca-hotel.jpg"/>
        </jsp:include>
        <jsp:include page="partails/roomCart.jsp">
            <jsp:param name="myVar" value="marakech-hotel.jpg"/>
        </jsp:include>
        <jsp:include page="partails/roomCart.jsp">
            <jsp:param name="myVar" value="marzouga-hotel.jpg"/>
        </jsp:include>
        <%--        </c:forech>--%>
    </div>

</div>
<div class="font-bold text-3xl mx-10  my-2 flex justify-center">Thoughts from our guests </div>
<div class="font-bold text-3xl mx-10 pb-4 mb-8 flex justify-center">
    <svg width="322" height="19" viewBox="0 0 322 19" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M0.999997 17V17C106.745 -2.82723 215.255 -2.82722 321 17V17" stroke="#FF8C32" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"></path>
    </svg>
</div>
<div class="flex justify-center mx-52 space-x-4">
    <jsp:include page="partails/reviewCart.jsp"/>
    <jsp:include page="partails/reviewCart.jsp"/>
    <jsp:include page="partails/reviewCart.jsp"/>

</div>

<script src="https://unpkg.com/flowbite@1.5.3/dist/flowbite.js"></script>
</body>
</html>
