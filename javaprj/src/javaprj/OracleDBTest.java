package javaprj;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class OracleDBTest {
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		String url = "jdbc:oracle:thin:@//localhost:1521/orcl";
		String sql = "select * from STUDENTS";

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(url, "scott", "tiger");

		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);

		String str = "ID username univ\n";
		while (rs.next()) {
			str += rs.getString("username") + " ," + rs.getString("univ") + ", " + rs.getString("hisal");
			str += "\n";
		}
		System.out.println(str);

		rs.close();
		st.close();
		con.close();
	}
}
