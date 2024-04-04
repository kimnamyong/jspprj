package com;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

@WebServlet("/studentControl")
public class StudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	StudentDAO dao;

	public StudentController() {
		super();

	}

	public void init(ServletConfig config) throws ServletException {
		dao = new StudentDAO();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");

		String action = request.getParameter("action");
		//System.out.print(action);
		String view = "";

		if (action == null) {
			
//			getServletContext().getRequestDispatcher("/studentControl?action=list")
//			.forward(request, response);
			RequestDispatcher dis = request.getRequestDispatcher("/studentControl?action=list");
			dis.forward(request , response);
			
		} else {
			
			switch(action) {
		       case "list": 
		    	   view = list(request, response);	  // studentInfo.jsp	    	   
		    	   break;
		       case "insert": view = insert(request, response);
		       System.out.print(view);
		       break;
			};			
			//getServletContext().getRequestDispatcher(view).forward(request, response);
			//  studentInfo.jsp
			RequestDispatcher dis = request.getRequestDispatcher(view);
			dis.forward(request , response);	
		}		

	} //

	public String insert(HttpServletRequest request, HttpServletResponse response){
		Student s = new Student();

		try {
			
//			String name=request.getParameter("name");
//			String univ=request.getParameter("univ");
//			String birth=request.getParameter("birth");
//			String email=request.getParameter("email");
//			
//			s.setUsername(name);
//			s.setUniv(univ);
//			s.setBirth(birth);
//			s.setEmail(email);
						

			
			 BeanUtils.populate(s, request.getParameterMap());
			
			
		} catch (IllegalAccessException | InvocationTargetException e) {
			
			e.printStackTrace();
		}
		  dao.insert(s);
		return list(request, response); // studentInfo.jsp 리턴
	}

	public String list(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("students", dao.getAll());		
		return "studentInfo.jsp";
	}

}
