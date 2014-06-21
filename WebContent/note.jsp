<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.NoteOnline.model.*"%>
<%@ page import="com.NoteOnline.db.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>

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
	int i_noteId = Integer.parseInt(noteId);
	String courseName = cDm.getCourseName(i_courseId);
	String courseCode = cDm.getCourseCode(i_courseId);
	String noteAuthor = nDm.getNoteAuthor(i_noteId);
	Timestamp noteUpdateTime = nDm.getNoteUpdateTime(i_noteId);
	DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	String nUT = "";
	nUT = sdf.format(noteUpdateTime);
	String noteName = nDm.getNoteName(i_noteId);
	String noteContent = nDm.getNoteContent(i_noteId);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="bootstrap_css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="customize_css/note.css" />
<link rel="icon" href="image/favicon.png" type="image/x-icon">
<!-- <link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">-->
<title>
	<%
		out.print(uniName);
	%> - NoteOnline
</title>
</head>
<body>

	<div class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.jsp" style="color: #000000">NoteOnline</a>
			</div>
			<form class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default"
					style="margin-left: 5px;">Submit</button>
			</form>
			<ul class="nav nav-pills pull-right top-nav" style="height: 50px;">
				<li class="top-nav-item"><a href="#uni">University</a></li>
				<li class="top-nav-item"><a href="#mooc">MOOC</a></li>
				<li class="top-nav-item"><a href="#uni">Your notes</a></li>
				<li class="top-nav-item"><a href="#uni">Sign in</a></li>
			</ul>
		</div>
	</div>

	<div class="home"
		style="background-image: url(image/uni/<%out.print(uniId);%>/<%out.print(uniId);%>_view.jpg)"></div>

	<div class="container profile">
		<div class="row">
			<div class="col-md-4">
				<img
					src="image/uni/<%out.print(uniId);%>/<%out.print(uniId);%>_logo.jpg"
					class="img-thumbnail">
				<h1>
					<a href="uni.jsp" style="color: #333333;"> <%
 	out.print(courseCode);
 %>
					</a>
				</h1>
				<h2>
					<%
						out.print(courseName);
					%>
				</h2>
				<div class="container horizontal-line"></div>

				<div class="bs-docs-sidebar hidden-print affix-top"
					role="complementary">
					<ul class="nav bs-docs-sidenav">
						<%
							List<String> results = nDm.getHeader(noteContent);
							List<String> r1 = nDm.getHref(noteContent);
							for (int i=0; i<results.size();i++){
						%>
						<li><a href="#<%out.print(r1.get(i));%>">
						<%
 							out.print(results.get(i));
						%>
						</a></li>
						<%
							}
						%>
					</ul>
				</div>


			</div>
		</div>
	</div>

	<div class="container content">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-8">
				<h1>
					<%
						out.print(noteName);
					%>
				</h1>
				<h2>
					<%
						out.print(noteAuthor);
					%>
					<strong>·</strong>
					<%
						out.print(nUT);
					%>
				</h2>
				<%
					out.print(noteContent);
				%>
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