package com.NoteOnline.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.NoteOnline.db.UniDatabaseManager;
import com.NoteOnline.model.University;

/**
 * Servlet implementation class UniUrlHandler
 */
@WebServlet("/UniUrlHandler")
public class UniUrlHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UniUrlHandler() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		HttpSession session = request.getSession(true);
		session.setAttribute("id", id);
		UniDatabaseManager uDm = new UniDatabaseManager();
		List<University> ul = null;
		try {
			ul = uDm.universityList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<Integer> uIdList = new ArrayList<Integer>();
		List<String> uNameList = new ArrayList<String>();
		List<String> uLocationList = new ArrayList<String>();
		List<String> uIntroList = new ArrayList<String>();

		for (int i = 0; i < ul.size(); i++) {
			int uId = ul.get(i).getId();
			String uName = ul.get(i).getName();
			String uLocation = ul.get(i).getLocation();
			String uIntro = ul.get(i).getIntro();

			uIdList.add(uId);
			uNameList.add(uName);
			uLocationList.add(uLocation);
			uIntroList.add(uIntro);
		}

		for (int j = 0; j < uIdList.size(); j++) {
			int u_id = Integer.parseInt(id);
			if (u_id == uIdList.get(j)) {
				String uniName = uNameList.get(j);
				session.setAttribute("name", uniName);
				String uniLocation = uLocationList.get(j);
				session.setAttribute("location", uniLocation);
			}
		}

		response.sendRedirect("uni.jsp");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
