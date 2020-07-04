package mvc.spring.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import mvc.spring.jdbc.JDBC;
import mvc.spring.pojo.User;

public class LoginDao {
	Connection conn = null;
	ResultSet rs = null;
	Statement s = null;
	public boolean login(User user){
		boolean flag = false;
		try {
			conn = JDBC.getConnection();
			s = conn.createStatement();
			rs = s.executeQuery("select * from users where username ='"+user.getUsername()+"' and password ='"+user.getPassword()+"'");
			if(rs.next()){
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
}
