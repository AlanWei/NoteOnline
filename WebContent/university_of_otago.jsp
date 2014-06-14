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
<link rel="stylesheet" type="text/css"
	href="customize_css/university_of_otago.css" />
<link rel="icon" href="image/favicon.png" type="image/x-icon">
<title>University of Otago - NoteOnline</title>
</head>
<body>

	<%
		UniDatabaseManager dm = new UniDatabaseManager();
		List<University> ul = dm.universityList();
		
		int uId0 = ul.get(0).getId();
		String uName0 = ul.get(0).getName();
		String uLocation0 = ul.get(0).getLocation();
		String uIntro0 = ul.get(0).getIntro();
	%>
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
		style="background-image: url(image/otago/otago_view.jpg)"></div>

	<div class="container content">
		<div class="row">
			<div class="col-md-4">
				<div class="profile">
					<img src="image/otago/otago_logo.png" class="img-thumbnail">
					<h1>
						<%
							out.print(uName0);
						%>
					</h1>
					<h2>
						<%
							out.print(uLocation0);
						%>
					</h2>
				</div>
			</div>
			<div class="col-md-8">
				<div class="panel panel-info">
					<p class="panel-heading"
						style="font-size: 20px; text-align: center; font-weight: bold;">
						INFO211<br>Systems Analysis, Design and Modelling
					</p>
					<div class="panel-body">
						<ul class="override ul">
							<li>Revision Checklist 2013</li>
							<li>Revision Checklist 2013 Preparation</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-8">
				<div class="panel panel-info">
					<p class="panel-heading"
						style="font-size: 20px; text-align: center; font-weight: bold;">
						INFO213<br>Business ICT Strategy
					</p>
					<div class="panel-body">
						<ul class="override ul">
							<li>Final Revision 2013</li>
							<li>Things will be tested</li>
						</ul>
					</div>
				</div>
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