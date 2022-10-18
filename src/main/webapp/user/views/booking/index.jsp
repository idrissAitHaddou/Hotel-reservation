<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Htel</title>
  <Link rel="stylesheet" href="user/css/index.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Cabin&family=Dancing+Script&family=Fuzzy+Bubbles:wght@700&family=Lobster&family=Montserrat:wght@200&family=PT+Serif+Caption&family=Saira+Condensed:wght@100&family=Source+Code+Pro:wght@200&family=Ubuntu+Mono&display=swap" rel="stylesheet">
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
<jsp:include page="patails/bookingHero.jsp" />
<jsp:include page="patails/booking.jsp" />
<jsp:include page="../../component/footer.jsp" />


<script src="https://unpkg.com/flowbite@1.5.3/dist/flowbite.js"></script>
</body>
</html>
