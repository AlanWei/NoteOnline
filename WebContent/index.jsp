<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.NoteOnline.model.*"%>
<%@ page import="com.NoteOnline.db.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="bootstrap_css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="customize_css/index.css" />
<link rel="icon" href="image/favicon.png" type="image/x-icon">
<title>Home - NoteOnline</title>
</head>
<body>


	<div class="container header">
		<div class="masthead">
			<h1>
				<a href="index.jsp" style="color: black;">NoteOnline</a>
			</h1>
			<ul class="nav nav-pills pull-right top-nav">
				<li class="top-nav-item"><a href="#university">University
						list</a></li>
				<li class="top-nav-item"><a href="#university">Your note</a></li>
				<li class="top-nav-item"><a href="#university">Contact us</a></li>
				<li class="top-nav-item"><a href="#university">Sign in</a></li>
			</ul>
		</div>
	</div>

	<div class="home"
		style="background-image: url(image/Library-Books.jpg)">
		<div class="intro">
			<h3>Share Notes with the World</h3>
			<p class="subtitle">Knowledge needs spreading.</p>
			<button id="start-btn" class="btn btn-success btn-lg">Get
				Started Free</button>
		</div>
	</div>
	<%
		UniDatabaseManager dm = new UniDatabaseManager();
		List<University> ul = dm.universityList();
		
		int uId0 = ul.get(0).getId();
		String uName0 = ul.get(0).getName();
		String uLocation0 = ul.get(0).getLocation();
		String uIntro0 = ul.get(0).getIntro();
		
		int uId1 = ul.get(1).getId();
		String uName1 = ul.get(1).getName();
		String uLocation1 = ul.get(1).getLocation();
		String uIntro1 = ul.get(1).getIntro();
	%>
	<div class="container university-list" id="university">
		<div class="university-name">
			<h4 class="col-md-4">
				<img src="image/uni_icon/otago.ico" class="icon"><a
					href="university_of_otago.jsp" style="color: #333333;"> <%
 	out.print(uName0);
 %>
				</a>
			</h4>
			<h4 class="col-md-4">
				<img src="image/uni_icon/rice.ico" class="icon"><a
					href="rice_university.jsp" style="color: #333333;"> <%
 	out.print(uName1);
 %>
				</a>
			</h4>
			<h4 class="col-md-4">
				<img src="image/book-icon.png" class="icon">Looking for you university?
			</h4>
		</div>
		<div class="uni-intro">
			<div class="col-md-4">
				<%
					out.print(uIntro0);
				%>
			</div>
			<div class="col-md-4">
				<%
					out.print(uIntro1);
				%>
			</div>
			<div class="col-md-4">Come and join us!</div>
		</div>
	</div>

	<!--
	<div class="container row2">
		<div class="university-name">
			<h4 class="col-md-4">
				<img src="image/book-icon.png" class="icon">To be continued...
			</h4>
			<h4 class="col-md-4">
				<img src="image/book-icon.png" class="icon">To be continued...
			</h4>
			<h4 class="col-md-4">
				<img src="image/book-icon.png" class="icon">To be continued...
			</h4>
		</div>
		<div class="book-intro">
			<div class="col-md-4"></div>
			<div class="col-md-4"></div>
			<div class="col-md-4"></div>
		</div>
	</div>
	-->

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