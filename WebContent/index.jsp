<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.NoteOnline.model.*"%>
<%@ page import="com.NoteOnline.db.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="bootstrap_css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="customize_css/index.css" />
<link rel="icon" href="image/favicon.png" type="image/x-icon">
<script src="jquery/jquery-1.11.1.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<title>Home - NoteOnline</title>
</head>
<body>

	<%
		UniDatabaseManager dm = new UniDatabaseManager();
			List<University> ul = dm.universityList();
			List<Integer> uIdList = new ArrayList<Integer>();
			List<String> uNameList = new ArrayList<String>();
			List<String> uLocationList = new ArrayList<String>();
			List<String> uIntroList = new ArrayList<String>();
			
			for (int i=0; i<ul.size(); i++){
		int uId = ul.get(i).getId();
		String uName = ul.get(i).getName();
		String uLocation = ul.get(i).getLocation();
		String uIntro = ul.get(i).getIntro();
		
		uIdList.add(uId);
		uNameList.add(uName);
		uLocationList.add(uLocation);
		uIntroList.add(uIntro);
			}
	%>

	<div class="container header">
		<div class="masthead">
			<h1>
				<a href="index.jsp" style="color: black;">NoteOnline</a>
			</h1>
			<ul class="nav nav-pills pull-right top-nav">
				<li class="top-nav-item"><a href="#uni">University</a></li>
				<li class="top-nav-item"><a href="#mooc">MOOC</a></li>
				<li class="top-nav-item"><a href="#uni">Your notes</a></li>
				<li class="top-nav-item"><a href="#uni">Sign in</a></li>
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

	<div class="container uni-list" id="uni">
		<div class="row">
			<div class="uni-name">
				<h4 class="col-md-4">
					<img src="image/uni_icon/<%out.print(uIdList.get(0));%>.jpg"
						class="icon"><a
						href="uni.url?uni_id=<%out.print(uIdList.get(0));%>"
						style="color: #333333;"> <%
 	out.print(uNameList.get(0));
 %>
					</a>
				</h4>
				<h4 class="col-md-4">
					<img src="image/uni_icon/<%out.print(uIdList.get(1));%>.jpg"
						class="icon"><a
						href="uni.url?uni_id=<%out.print(uIdList.get(1));%>"
						style="color: #333333;"> <%
 	out.print(uNameList.get(1));
 %>
					</a>
				</h4>
				<h4 class="col-md-4">
					<img src="image/uni_icon/<%out.print(uIdList.get(2));%>.jpg"
						class="icon"><a
						href="uni.url?uni_id=<%out.print(uIdList.get(2));%>"
						style="color: #333333;"> <%
 	out.print(uNameList.get(2));
 %>
					</a>
				</h4>
			</div>
		</div>
		<div class="row">
			<div class="uni-intro">
				<div class="col-md-4">
					<%
						out.print(uIntroList.get(0));
					%>
				</div>
				<div class="col-md-4">
					<%
						out.print(uIntroList.get(1));
					%>
				</div>
				<div class="col-md-4">
					<%
						out.print(uIntroList.get(2));
					%>
				</div>
			</div>
		</div>
	</div>

	<div class="container uni-list">
		<div class="row">
			<div class="uni-name">
				<h4 class="col-md-4">
					<img src="image/uni_icon/<% out.print(uIdList.get(3)); %>.jpg" class="icon"><a
						href="uni.url?uni_id=<% out.print(uIdList.get(3)); %>"
						style="color: #333333;"> <%
 	out.print(uNameList.get(3));
 %>
					</a>
				</h4>
				<h4 class="col-md-4">Looking for your university?</h4>
				<h4 class="col-md-4"></h4>
			</div>
		</div>
		<div class="row">
			<div class="uni-intro">
				<div class="col-md-4">
					<%
						out.print(uIntroList.get(3));
					%>
				</div>
				<div class="col-md-4">Come and join us!</div>
				<div class="col-md-4"></div>
			</div>
		</div>
	</div>

	<div class="container horizontal-line"></div>

	<div class="container mooc" id="mooc">
		<div id="moocCarousel" class="carousel slide pull right"
			data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#moocCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#moocCarousel" data-slide-to="1"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<div class="container">
						<div class="row">
							<div class="col-md-3 mooc-logo">
								<img src="image/mooc/udacity.png">
							</div>
							<div class="col-md-9">
								<p class="mooc-intro">
									<i>"Udacity helped Brent, a business school student with a
										finance background, land his dream product management
										internship at Google. Brent recently turned his dream
										internship into his dream job, and is now a Product Manager at
										Google."</i>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="container">
						<div class="row">
							<div class="col-md-3 mooc-logo">
								<img src="image/mooc/coursera.jpg">
							</div>
							<div class="col-md-9">
								<p class="mooc-intro">
									<i>"Coursera works with universities to make some of their
										courses available online, and offers courses in physics,
										engineering, humanities, medicine, biology,social sciences,
										mathematics, business, computer science, and other subjects."</i>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container horizontal-line"></div>

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
			</div>
		</div>
	</div>
</body>
</html>