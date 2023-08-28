<%@ page contentType="text/html;charset=UTF-8" %>

<%
    UserDetails userDetails = (UserDetails) session.getAttribute("userDetails");

    if (userDetails == null) {
        response.sendRedirect("login.jsp");
        session.setAttribute("login-error", "You have to login first to be able to access this page!");
    }
%>
<html>
<head>
    <title>Add Notes</title>
    <%@include file="all_component/allcss.jsp" %>
    <style>
        body {
            overflow-x: hidden;
        }
    </style>
</head>
<body>
    <%@include file="all_component/navbar.jsp" %>

    <div class="text-center">
        <h1>Add Your Notes</h1>
        <div class="row mt-1 justify-content-center">
            <div class="col-12 col-md-6">
                <form action="AddNotesServlet" method="post">
                    <div class="form-group mb-3">
                        <%
                            UserDetails loggedInUser = (UserDetails) session.getAttribute("userDetails");

                            if (loggedInUser != null) {
                        %>
                        <input type="hidden" value="<%=loggedInUser.getId()%>" name="userId">
                        <%
                            }
                        %>
                        <label class="fs-5" for="title"><b>Title:</b></label>
                        <input type="text" class="form-control" id="title" name="title" required minlength="2">
                    </div>
                    <div class="form-group mb-3">
                        <label class="fs-5" for="comment"><b>Comment:</b></label>
                        <textarea class="form-control" rows="5" id="comment" name="content" required minlength="5"></textarea>
                    </div>
                    <button type="submit" class="btn btn-outline-success btn-lg">Add Note</button>
                </form>
            </div>
        </div>
    </div>

</body>
</html>
