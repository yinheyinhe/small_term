package mvc.spring.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LoginController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String pattern;
	public String username;
	public String password;

	public String flag;
	public String imgname;
	public String json;
	
	
	
	public void setUsername(String username)
	{
		this.username=username;
	}
	
	public void setPassword(String password)
	{
		this.password=password;
	}
	
	public String getUsername() { return username; } 
	
	public String getPassword(){ return password; }
	
	public String setFlag(String Username,String Password) {
		
		
		return flag;
	}
	
	
}
