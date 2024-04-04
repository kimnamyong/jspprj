package user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserSearchServlet")
public class UserSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserSearchServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userName = request.getParameter("userName");
						

		try {
			response.getWriter().write(getJSON(userName));
		} catch (ClassNotFoundException | IOException e) {
			e.printStackTrace();
		}
	}

	public String getJSON(String userName) throws ClassNotFoundException {

		if (userName == null)
			userName = "";

		StringBuffer result = new StringBuffer("");
		
		result.append("{\"result\":[");

	     UserDAO userDAO=new UserDAO();

	     ArrayList<User> userList= userDAO.search(userName);

	     for(int i=0;i<userList.size();i++) {
	        result.append("[{\"name\":\""+userList.get(i).getUserName()+"\"},");
	         result.append("{\"age\":\""+userList.get(i).getUserAge()+"\"},");
	         result.append("{\"gender\":\""+userList.get(i).getUserGender()+"\"},");
	         result.append("{\"email\":\""+userList.get(i).getUserEmail()+"\"}],");
	       }
	      result.append("]}");
	     return result.toString();
	}
} // end
