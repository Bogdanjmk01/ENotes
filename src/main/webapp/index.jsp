<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <style>
      .back-img {
        background: url("img/notes-image.jpg") no-repeat;
        width: 100%;
        height: 100vh;
        background-size: cover;
      }
  </style>
  <title>Home Page</title>
  <%@include file="all_component/allcss.jsp" %>
</head>
<body>
<%@include file="all_component/navbar.jsp" %>

<div class="back-img">
  <div class="text-center">
      <h1 class="text-white"><i class="bi bi-journals" aria-hidden="true"></i> E Notes-Save Your Notes</h1>
      <a href="login.jsp" class="btn btn-outline-light"><i class="fa-solid fa-circle-user"></i> Login</a>
      <a href="register.jsp" class="btn btn-outline-light"><i class="fa-solid fa-user-plus"></i> Register</a>
    </div>
</div>
  <%@include file="all_component/footer.jsp" %>
</body>
</html>