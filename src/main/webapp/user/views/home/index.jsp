<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Htel</title>
    <Link rel="stylesheet" href="user/css/index.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cabin&family=Dancing+Script&family=Fuzzy+Bubbles:wght@700&family=Lobster&family=Montserrat:wght@200&family=PT+Serif+Caption&family=Saira+Condensed:wght@100&family=Source+Code+Pro:wght@200&family=Ubuntu+Mono&display=swap" rel="stylesheet">
    <style>
        /* style of toogle button */
        /* From uiverse.io by @mrhyddenn */
        input {
            display: none
        }

        .on,.off {
            position: absolute;
            text-align: center;
            text-shadow: inset 1px 1px 1px black;
            width: 100%;
        }

        .on {
            color: #fff;
            top: 10px;
            transition: all 0.1s;
            font-family: sans-serif
        }

        .off {
            color: #636161;
            bottom: 5px;
            transition: all 0.1s;
            transform: scaleY(0.85);
        }

        .but {
            background-color: #000;
            border-radius: 400px 400px 400px 400px / 400px 400px 300px 300px;
            border-bottom-width: 0px;
            box-shadow: inset 8px 6px 5px -7px rgba(0,0,0,1)
            ,inset -8px 6px 5px -7px rgba(0,0,0,1)
            ,inset 0 -3px 2px -2px rgba(200,200,200,.5)
            ,0 3px 3px -2px rgba(0,0,0,1)
            ,inset 0 -230px 60px -200px rgba(255,255,255,.2)
            ,inset 0 220px 40px -200px rgba(0,0,0,.3);
            display: block;
            font-size: 17px;
            height: 60px;
            position: relative;
            transition: all 0.2s;
            width: 40px;
        }

        .back {
            background-color: #000;
            background-image: -webkit-linear-gradient(0deg, transparent 30%, transparent 65%)
            ,-webkit-linear-gradient(0deg, rgba(245, 245, 245, 0) 30%, rgba(150,150,150,.1) 50%, rgba(150,150,150,0) 70%);
            border-radius: 115px;
            box-sizing: border-box;
            height: 85px;
            padding: 4px 4px;
            transition: all 0.2s;
            width: 50px;
        }

        input:checked + .back .on,input:checked + .back .off {
            text-shadow: inset 1px 1px 1px black;
        }

        input:checked + .back .on {
            color: rgb(141, 141, 141);
            top: 10px;
            transform: scaleY(0.85);
        }

        input:checked + .back .off {
            color: #fff;
            bottom: 5px;
            transform: scaleY(1);
        }

        input:checked + .back .but {
            background: #232323;
            background-image: -webkit-radial-gradient(55% 18%,circle closest-corner,rgba(0,0,0,.3) ,rgba(0,0,0,0));
            border-radius: 410px 410px 410px 410px / 310px 310px 410px 410px;
            box-shadow: inset 8px -4px 5px -7px rgba(0,0,0,1)
            ,inset -8px -4px 5px -7px rgba(0,0,0,1)
            , 0 -3px 8px -4px rgba(250,250,250,.4)
            ,inset 0 3px 4px -2px rgba(10,10,10,1)
            ,inset 0 280px 40px -200px rgba(0,0,0,.2)
            ,inset 0 -200px 40px -200px rgba(180,180,180,.2);
            margin-top: 20px;
        }

        input:checked + .back {
            background-image: -webkit-linear-gradient(90deg, black 30%, transparent 65%)
            ,-webkit-linear-gradient(180deg, rgba(250,250,250,0) 0%, rgba(250,250,250,.4) 50%, rgba(150,150,150,0) 100%);
            box-shadow: 28px 28px 28px -28px rgba(0,0,0,.1)
            ,-28px 28px 28px -22px rgba(0,0,0,.1)
            ,0 30px 30px 0px rgba(0,0,0,.2)
            ,inset 0 1px 2px 0 rgba(0,0,0,.6);
            padding: 2px 4px;
        }

        .l,.r {
            margin: 0 auto;
            text-align: center;
        }

        .round,#onoff,.back,.but,.on,.off {
            user-select: none;
        }
    </style>
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
<jsp:include page="partails/promotion.jsp" />
<jsp:include page="partails/suite.jsp" />


    <div class="font-bold text-3xl mx-10  my-2 flex justify-center">The Most booked hotel</div>
    <div class="font-bold text-3xl mx-10 pb-4 mb-8 flex justify-center">
        <svg width="322" height="19" viewBox="0 0 322 19" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M0.999997 17V17C106.745 -2.82723 215.255 -2.82722 321 17V17" stroke="#FF8C32" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"></path>
        </svg>
    </div>
    <div class="flex justify-center w-11/12 mx-auto gap-4 mb-8">
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
<div class="font-bold text-3xl mx-10  my-2 flex justify-center">Thoughts from our guests </div>
<div class="font-bold text-3xl mx-10 pb-4 mb-8 flex justify-center">
    <svg width="322" height="19" viewBox="0 0 322 19" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M0.999997 17V17C106.745 -2.82723 215.255 -2.82722 321 17V17" stroke="#FF8C32" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"></path>
    </svg>
</div>

<div class="flex w-11/12 h-96 mx-auto gap-8">
    <jsp:include page="partails/reviewCart.jsp"/>
    <jsp:include page="partails/reviewCart.jsp"/>
    <jsp:include page="partails/reviewCart.jsp"/>
</div>
<jsp:include page="../../component/footer.jsp" />


<script src="https://unpkg.com/flowbite@1.5.3/dist/flowbite.js"></script>
</body>
</html>
