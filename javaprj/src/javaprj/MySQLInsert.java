package javaprj;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

public class MySQLInsert {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		String id="aaa22@daum.net";
		String pass="1234";
		String name="원빈";
		//String date="2022-01-01";
//		java.util.Date date = new java.util.Date();
//		java.sql.Date sqlDate = new java.sql.Date(date.getTime());	
		
		String url="jdbc:mysql://localhost:3306/mysns?serverTimezone=UTC";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,"root","1234");
		
		
		String sql="INSERT INTO user(id,password,name,ts) values (?,?,?,now())";
		PreparedStatement st=con.prepareStatement(sql);
		
		st.setString(1, id);
		st.setString(2, pass);
		st.setString(3, name);
		//st.setString(4, date);
		//st.setDate(4, sqlDate);
		
		int result=st.executeUpdate(); // 삽입한 레코드 개수
	       System.out.println(result);
		
		st.close();
		con.close();		
	}

}
