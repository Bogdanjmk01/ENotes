<%@ page import="com.bogdanjmk.enotes.user.UserDetails" %>
<style>
    .navbar .nav-item .nav-link {
        font-size: 20px;
        color: white;
    }

    .navbar-custom .nav-item:hover .nav-link {
        background: white;
        color: black;
        border-radius: 10px;
    }
</style>

<nav class="navbar navbar-expand-lg navbar-custom" style="background: #245caa;">
    <div class="container-fluid">
        <a class="navbar-brand" style="color: #ffff; font-size: 27px"><i class="bi bi-journals" aria-hidden="true"></i> ENotes</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="home.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="addNotes.jsp"><i class="fa fa-plus-circle" aria-hidden="true"></i> Add Notes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="showNotes.jsp"><i class="fa-solid fa-address-book"></i> Show Notes</a>
                </li>
            </ul>
            <div class="d-flex gap-2" role="search">
                <%
                    UserDetails user = (UserDetails) session.getAttribute("userDetails");

                    if (user != null) { %>
                        <a href="" class="btn btn-outline-light my-2 my-sm-0" data-bs-toggle="modal" data-bs-target="#exampleModal" type="button"><i class="fa-solid fa-circle-user"></i> <%= user.getName() %></a>
                        <a href="LogoutServlet" class="btn btn-outline-light my-2 my-sm-0" type="button"><i class="bi bi-door-closed-fill"></i> Logout</a>

                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Your Profile</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="container text-center">
                                    <i class="fa fa-user fa-3x"></i>
                                    &nbsp;
                                    <h5 class="text-dark">Hello, <%= user.getFirstName(user.getName()) %></h5>

                                    <table class="table">
                                        <tbody>
                                        <tr>
                                            <th>Full Name</th>
                                            <td><%= user.getName() %></td>
                                        </tr>
                                        <tr>
                                            <th>Email</th>
                                            <td><%= user.getEmail() %></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <%  } else { %>
                        <a href="login.jsp" class="btn btn-outline-light my-2 my-sm-0" type="button"><i class="fa-solid fa-circle-user"></i> Login</a>
                        <a href="register.jsp" class="btn btn-outline-light my-2 my-sm-0" type="button"><i class="fa-solid fa-user-plus"></i> Register</a>
                <% } %>
            </div>

        </div>
    </div>
</nav>