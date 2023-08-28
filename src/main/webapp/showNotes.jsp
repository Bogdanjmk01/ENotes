<%@ page import="com.bogdanjmk.enotes.user.UserDetails" %>
<%@ page import="com.bogdanjmk.enotes.dao.NoteDAO" %>
<%@ page import="com.bogdanjmk.enotes.db.DBConnection" %>
<%@ page import="com.bogdanjmk.enotes.user.Note" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    UserDetails userDetailsForShowNotesPage = (UserDetails) session.getAttribute("userDetails");

    if (userDetailsForShowNotesPage == null) {
        response.sendRedirect("login.jsp");
        session.setAttribute("login-error", "You have to login first to be able to access this page!");
    }
%>
<html>
<head>
    <title>Title</title>
    <%@include file="all_component/allcss.jsp"%>
    <style>
        body {
            margin-top:20px;
        }

        .card-big-shadow {
            max-width: 320px;
            position: relative;
        }

        .coloured-cards .card {
            margin-top: 30px;
        }

        .card[data-radius="none"] {
            border-radius: 0;
        }

        .card {
            border-radius: 8px;
            box-shadow: 0 2px 2px rgba(204, 197, 185, 0.5);
            background-color: #FFFFFF;
            color: #252422;
            margin-bottom: 20px;
            position: relative;
            z-index: 1;
        }

        .card[data-background="image"] .title, .card[data-background="image"] .stats, .card[data-background="image"] .category, .card[data-background="image"] .description, .card[data-background="image"] .content, .card[data-background="image"] .card-footer, .card[data-background="image"] small, .card[data-background="image"] .content a, .card[data-background="color"] .title, .card[data-background="color"] .stats, .card[data-background="color"] .category, .card[data-background="color"] .description, .card[data-background="color"] .content, .card[data-background="color"] .card-footer, .card[data-background="color"] small, .card[data-background="color"] .content a {
            color: #FFFFFF;
        }

        .card.card-just-text .content {
            padding: 50px 65px;
            text-align: center;
        }

        .card .content {
            padding: 20px 20px 10px 20px;
        }

        .card[data-color="blue"] {
            color: #7a9e9f;
        }

        .card , .card {
            font-size: 14px;
            margin-bottom: 0px;
        }

        .card-big-shadow:before {
            background-image: url("http://static.tumblr.com/i21wc39/coTmrkw40/shadow.png");
            background-position: center bottom;
            background-repeat: no-repeat;
            background-size: 100% 100%;
            bottom: -12%;
            content: "";
            display: block;
            left: -12%;
            position: absolute;
            right: 0;
            top: 0;
            z-index: 0;
        }

        h4 {
            font-size: 1.5em;
            font-weight: 600;
            line-height: 1.2em;
        }

        h6 {
            font-size: 0.9em;
            font-weight: 600;
            text-transform: uppercase;
        }

        .card .description {
            font-size: 16px;
        }

        .content-card{
            margin-top:30px;
            width: 400px;
        }

        .card-just-text .content {
            max-height: 250px;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        a:hover, a:focus {
            text-decoration: none;
        }

        .card[data-color="blue"] {
            background: #b8d8d8;
        }
        .card[data-color="blue"] .description {
            color: #506568;
        }
    </style>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>

<%
    if (userDetailsForShowNotesPage != null) {
        NoteDAO dao = new NoteDAO(DBConnection.getConnection());
        List<Note> notes = dao.getNote(userDetailsForShowNotesPage.getId());
%>

<%
    String updateMessageSuccess = (String) session.getAttribute("updatedMessage");
    if (updateMessageSuccess != null) {
%>
<div class="d-flex justify-content-center">
    <div class="alert alert-info mt-1 text-center w-50" role="alert"><%=updateMessageSuccess%></div>
</div>
<%
        session.removeAttribute("updatedMessage");
    } %>

<%
    String updateMessageFail = (String) session.getAttribute("errorUpdateMessage");
    if (updateMessageFail != null) {
%>
<div class="d-flex justify-content-center">
    <div class="alert alert-danger mt-1 text-center w-50" role="alert"><%=updateMessageFail%></div>
</div>
<%
        session.removeAttribute("errorUpdateMessage");
    } %>

<%
    String deleteMessageSuccess = (String) session.getAttribute("deleteNoteMessageSuccess");
    if (deleteMessageSuccess != null) {
%>
<div class="d-flex justify-content-center">
    <div class="alert alert-info mt-1 text-center w-50" role="alert"><%=deleteMessageSuccess%></div>
</div>
<%
        session.removeAttribute("deleteNoteMessageSuccess");
    } %>

<%
    String deleteMessageFail = (String) session.getAttribute("deleteNoteMessageFail");
    if (deleteMessageFail != null) {
%>
<div class="d-flex justify-content-center">
    <div class="alert alert-danger mt-1 text-center w-50" role="alert"><%=deleteMessageFail%></div>
</div>
<%
        session.removeAttribute("deleteNoteMessageFail");
    } %>

<div class="container bootstrap snippets bootdeys">
    <div class="row">
        <%
            for (Note note : notes) {
        %>
        <div class="col-md-4 col-sm-6 content-card">
            <div class="card-big-shadow">
                <div class="card card-just-text" data-background="color" data-color="blue" data-radius="none">
                    <div class="content">
                        <h4 class="title"><a href="edit.jsp?note_id=<%= note.getId()%>"><%= note.getTitle()%></a></h4>
                        <h6 style="color: #ffff"><b>Published Date: </b><%= note.getDate()%></h6>
                        <p class="description"><%=note.getContent() %></p>
                        <a href="DeleteServlet?note_id=<%= note.getId()%>" class="btn btn-outline-warning btn-lg"><i class="bi bi-trash-fill"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
</div>
<%
    }
%>
</body>
</html>
