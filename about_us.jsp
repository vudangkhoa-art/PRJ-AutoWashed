

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About us</title>
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    </head>
    <style>
        jsp, body {
        margin: 0;
        padding: 0;
          }
        .page_img {
            display: flex;
            width: 100%;
        }
        .page_img img {
            flex: 1;            
            height: 100vh;
            object-fit: cover;
            border-radius: 12px;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.7);
        }
    </style>
    <body>
        <div class="page_img"> 
       <img src="${pageContext.request.contextPath}/assets/gos.png" alt="Anh de tam">
        </div>
    </body>
</html>
