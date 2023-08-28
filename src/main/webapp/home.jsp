<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="all_component/allcss.jsp" %>
</head>
<body>
    <%@include file="all_component/navbar.jsp" %>

    <div>
        <div class="mt-3">
            <div class="card-body text-center">
                <img src="img/taking_notes.jpg" alt="" class="img-fluid mx-auto" style="max-width: 80%;">
                <h1>Start Taking Your Notes</h1>
                <a href="addNotes.jsp" class="btn btn-outline-dark btn-lg">Start Here</a>
            </div>
        </div>
    </div>

    <div class="mt-5">
        <%@include file="all_component/footer.jsp" %>
    </div>
</body>
</html>
