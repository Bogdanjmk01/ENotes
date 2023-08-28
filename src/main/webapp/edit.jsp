<%@ page import="com.bogdanjmk.enotes.user.Note" %>
<%@ page import="com.bogdanjmk.enotes.dao.NoteDAO" %>
<%@ page import="com.bogdanjmk.enotes.db.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Edit Notes</title>
    <%@include file="all_component/allcss.jsp" %>
    <style>
        body {
            overflow-x: hidden;
        }
    </style>
</head>
<body>
<%@include file="all_component/navbar.jsp" %>

<%
    Long noteId = Long.parseLong(request.getParameter("note_id"));

    NoteDAO noteDAO = new NoteDAO(DBConnection.getConnection());
    Note note = noteDAO.getNoteById(noteId);
%>

<div class="text-center">
    <h1>Edit Your Notes</h1>
    <div class="row mt-1 justify-content-center">
        <div class="col-12 col-md-6">
            <form action="NoteEditServlet" method="post">
                <div class="form-group mb-3">
                    <input type="hidden" value="<%= noteId%>" name="noteId">
                    <label class="fs-5" for="title"><b>Title:</b></label>
                    <input type="text" class="form-control" id="title" name="title" value="<%= note.getTitle()%>" required minlength="2">
                </div>
                <div class="form-group mb-3">
                    <label class="fs-5" for="comment"><b>Comment:</b></label>
                    <textarea class="form-control" rows="5" id="comment" name="content" required minlength="5"><%= note.getContent()%></textarea>
                </div>
                <button type="submit" class="btn btn-outline-success btn-lg">Edit Note</button>
            </form>
        </div>
    </div>
</div>

<%@include file="all_component/footer.jsp" %>
</body>
</html>
