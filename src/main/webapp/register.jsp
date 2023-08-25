<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register Page</title>
    <%@include file="all_component/allcss.jsp" %>
</head>
<body>
<%@include file="all_component/navbar.jsp" %>
<section class="vh-100 h-md-100 h-lg-100 h-xxl-100 d-flex justify-content-center align-items-center" style="background-color: #eee; overflow: hidden">
    <div class="container h-100">
        <div class="row d-flex justify-content-center align-items-center" style="height: 100%">
            <div class="col-lg-12 col-xl-12 col-xxl-12 mt-3" style="height: 100%;">
                <div class="card text-black" style="border-radius: 25px;">
                    <div class="card-body p-md-5">
                        <div class="row justify-content-center">
                            <div class="col-md-10 col-lg-4 col-xl-5 order-2 order-lg-1">
                                <%
                                    String failedMessage = (String) session.getAttribute("failed-message");
                                    if (failedMessage != null) {
                                %>
                                <div class="alert alert-danger w-100" role="alert"><%=failedMessage%></div>
                                <%
                                        session.removeAttribute("failed-message");
                                    }
                                %>
                                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4"><b>Register</b></p>

                                <form class="mx-1 mx-md-4" action="UserServlet" method="post">

                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                                        <div class="form-outline flex-fill mb-0">
                                            <input type="text" id="form3Example1c" class="form-control" placeholder="Enter your full name" name="fullName" />
                                        </div>
                                    </div>

                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                                        <div class="form-outline flex-fill mb-0">
                                            <input type="email" id="form3Example3c" class="form-control" placeholder="Enter your email" name="email" />
                                        </div>
                                    </div>

                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                                        <div class="form-outline flex-fill mb-0">
                                            <input type="password" id="form3Example4c" class="form-control" placeholder="Enter your password" name="password" />
                                        </div>
                                    </div>

                                    <div class="form-check d-flex justify-content-center mb-5">
                                        <p style="color: #1480aa">Already have an account? <a href="login.jsp"><b> Click here to login</b></a></p>
                                    </div>

                                    <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                        <button type="submit" class="btn btn-outline-dark btn-lg">Register</button>
                                    </div>

                                </form>

                            </div>
                            <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
                                     class="img-fluid" alt="Sample image">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
