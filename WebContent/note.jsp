<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.NoteOnline.model.*"%>
<%@ page import="com.NoteOnline.db.*"%>
<%@ page import="java.util.*"%>

<%
	session = request.getSession();
	String uniId = (String) session.getAttribute("uni_id");
	String uniName = (String) session.getAttribute("uni_name");
	String uniLocation = (String) session.getAttribute("uni_location");
	String courseId = (String) session.getAttribute("course_id");
	String noteId = (String) session.getAttribute("note_id");
%>

<%
	CourseDatabaseManager cDm = new CourseDatabaseManager();
	NoteDatabaseManager nDm = new NoteDatabaseManager();
	int i_courseId = Integer.parseInt(courseId);
	String courseName = cDm.getCourseName(i_courseId);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="bootstrap_css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="customize_css/note.css" />
<link rel="icon" href="image/favicon.png" type="image/x-icon">
<title>
	<%
		out.print(uniName);
	%> - NoteOnline
</title>
</head>
<body>

	<div class="container header">
		<div class="masthead">
			<h1>
				<a href="index.jsp" style="color: black;">NoteOnline</a>
			</h1>
			<!--
			<ul class="nav nav-pills pull-right top-nav">
				<li class="top-nav-item"><a href="#university">University
						list</a></li>
				<li class="top-nav-item"><a href="#university">Your note</a></li>
				<li class="top-nav-item"><a href="#university">Contact us</a></li>
				<li class="top-nav-item"><a href="#university">Sign in</a></li>
			</ul>
			-->
		</div>
	</div>

	<div class="home"
		style="background-image: url(image/uni/<%out.print(uniId);%>/<%out.print(uniId);%>_view.jpg)"></div>

	<div class="container profile">
		<div class="row">
			<div class="col-md-4">
				<img src="image/uni/<%out.print(uniId);%>/<%out.print(uniId);%>_logo.jpg"
					class="img-thumbnail">
				<h1>
					<%
						out.print(uniName);
					%>
				</h1>
				<h2>
					<%
						out.print(uniLocation);
					%>
				</h2>
				<div><%
					out.print(courseName);
				%></div>
			</div>
		</div>
	</div>

	<div class="container content">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-8">
				<%
										int i_noteId = Integer.parseInt(noteId);
										String noteName = nDm.getNoteName(i_noteId);
										String noteContent = nDm.getNoteContent(i_noteId);
				%>
				<h1 style="text-align: center;">
					<%
						out.print(noteName);
					%>
				</h1>
				<div class="container horizontal-line"></div>
				<%
					out.print(noteContent);
				%>
				<div class="container horizontal-line"></div>
			</div>
		</div>
	</div>



	<div class="footer">
		<div class="container">
			<div class="row contact1">
				<!--
				<div class="col-md-2">Blog</div>
				<div class="col-md-2">Contact Us</div>
			-->
				<div class="col-md-12" id="social">
					<a target="_blank" href="https://www.facebook.com/changran.wei"><img
						src="image/32/facebook.png"></a> <a target="_blank"
						href="https://twitter.com/alanweichangran"><img
						src="image/32/twitter.png"></a>
				</div>
			</div>
			<div class="row contact2">
				<div class="col-md-12" id="copyright">Made by Alan Wei in
					Hangzhou China, June 2014</div>
				<!--<div class="col-md-6" id="copyright">© 2012-2014</div>-->
			</div>
		</div>
	</div>
</body>
</html>