package mvc.spring.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import mvc.spring.jdbc.JDBC;
import mvc.spring.pojo.User;


public class RegisterDao {
	Connection conn = null;
	Statement s = null;
	ResultSet rs = null;
	public boolean register(User user){
		boolean flag = false;
		try {
			conn = JDBC.getConnection();
			s = conn.createStatement();
			rs = s.executeQuery("select * from users where username ='"+user.getUsername()+"'");
			if(!rs.next()){
				s.execute("insert into users(username,password) values('"+user.getUsername()+"','"+user.getPassword()+"')");
				flag =true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
}
