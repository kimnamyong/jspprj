package webexam;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/students")
public class StudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    public StudentController() {
        super();        
        
    }    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudentDAO dao =new StudentDAO();       
		
		try {
			List<Student> s= dao.getAll();
				
			request.setAttribute("students", s);
			
			String url="StudentsList.jsp";
			
			RequestDispatcher dis=request.getRequestDispatcher(url);
			dis.forward(request, response);
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		
		
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
