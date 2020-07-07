package weatherweb;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletLogin",urlPatterns = "/login")
public class ServletLogin extends HttpServlet {
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
    	 //用户列表
        String user="user123";
        String pass="pass123";
        //获取客户端传来的参数
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println(username);
        System.out.println(password);
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
        //用户列表
        String user="user123";
        String pass="pass123";
        //获取客户端传来的参数
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
    }
}
