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
%>

<%
	CourseDatabaseManager cDm = new CourseDatabaseManager();
	List<Course> cl = null;
	int i_uniId = Integer.parseInt(uniId);
	cl = cDm.courseList(i_uniId);

	List<Integer> cIdList = new ArrayList<Integer>();
	List<String> cCodeList = new ArrayList<String>();
	List<String> cNameList = new ArrayList<String>();
	List<String> cIntroList = new ArrayList<String>();
	
	for (int k = 0; k < cl.size(); k++) {
		int cId = cl.get(k).getCourseId();
		String cCode = cl.get(k).getCourseCode();
		String cName = cl.get(k).getCourseName();
		String cIntro = cl.get(k).getCourseIntro();
		
		cIdList.add(cId);
		cCodeList.add(cCode);
		cNameList.add(cName);
		cIntroList.add(cIntro);
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="bootstrap_css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="customize_css/uni.css" />
<link rel="icon" href="image/favicon.png" type="image/x-icon">
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
				<li class="top-nav-item"><a href="index.jsp#uni">University</a></li>
				<li class="top-nav-item"><a href="index.jsp#mooc">MOOC</a></li>
				<li class="top-nav-item"><a href="#uni">Your notes</a></li>
				<li class="top-nav-item"><a href="#uni">Sign in</a></li>
			</ul>
		</div>
	</div>

	<div class="home"
		style="background-image: url(image/uni/<%out.print(uniId);%>/<%out.print(uniId);%>_view.jpg)"></div>

	<div class="container profile">
		<div class="row">
			<div class="col-md-4 uni-logo">
				<img
					src="image/uni/<%out.print(uniId);%>/<%out.print(uniId);%>_logo.jpg"
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
			</div>
		</div>
	</div>

	<div class="container course">
		<%
			for (int i=0; i<cIdList.size();i++){
		%>
		<div class="row" style="margin-bottom: 10px;">
			<div class="col-md-4"></div>
			<div class="col-md-8">
				<div class="panel panel-info">
					<p class="panel-heading"
						style="font-size: 20px; text-align: center; font-weight: bold;">
						<%
							out.print(cCodeList.get(i));
						%><br>
						<%
							out.print(cNameList.get(i));
						%>
					</p>

					<div class="panel-body">
						<ul class="override ul">
							<%
								NoteDatabaseManager nDm = new NoteDatabaseManager();
								List<Note> noteList = nDm.noteList(cIdList.get(i)); 
								for (int j=0; j<noteList.size(); j++){
									String noteName = noteList.get(j).getNoteName();
									int noteId = noteList.get(j).getNoteId();
							%>
							<li><a
								href="note.url?course_id=<%out.print(cIdList.get(i));%>&note_id=<%out.print(noteId);%>">
									<%
										out.print(noteName);
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
		<%
			}
		%>
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