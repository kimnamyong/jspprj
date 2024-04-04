package com;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/userControl")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserController() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			List<User> users = UserDAO.findAll();
			
			request.setAttribute("users", users);
			
			RequestDispatcher dis = request.getRequestDispatcher("UserList2.jsp");
			dis.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
