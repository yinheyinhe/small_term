package mvc.spring.controller;

import mvc.spring.dao.LoginDao;
import mvc.spring.dao.RegisterDao;
import mvc.spring.pojo.User;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class LoginController {
	
	@RequestMapping("/login")  
	@Autowired
	 public ModelAndView login(String username,String password) { 
	User user = new User();
	user.setUsername(username);
	user.setPassword(password);
	   LoginDao loginDao = new LoginDao();
	  boolean flag = loginDao.login(user);
	  ModelAndView modelAndView = new ModelAndView();  
	  String me = "";
	  String url ="";
	  
	  if(flag){
		  me="登录成功！";

		  modelAndView.addObject("username", username);
		  
		  url = "loginSuccess.jsp";
	  }else{
		  me="用户名和密码有错误！请重新输入";
		  url ="loginError.jsp";
		   
	  }
	  
	  modelAndView.addObject("message", me);  
	  modelAndView.setViewName(url);  
	  return modelAndView;  
	     
	 }
	
	@RequestMapping("/register") 
	@Autowired
	 public ModelAndView register(String username,String password) { 
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		RegisterDao registerDao = new RegisterDao();
	  boolean flag = registerDao.register(user);
	  String me = "";
	  String url ="";
	  if(flag){
		  me="注册成功！";
		  url ="registerSuccess";
	  }else{
		  me="该用户名已经存在，请重新输入";
		  url ="registerError";
	  }
	  
	  ModelAndView modelAndView = new ModelAndView();  
	  modelAndView.addObject("message", me);  
	  modelAndView.setViewName(url);  
	  return modelAndView;   
	     
	 }
	@RequestMapping("/logout")  
	 public ModelAndView logout() { 
		
	  String me = "";
	  String url ="";
	  me="注销成功！";
	  url="registerSuccess";
	  ModelAndView modelAndView = new ModelAndView();  
	  modelAndView.addObject("message", me);  
	  modelAndView.setViewName(url);  
	  return modelAndView;   
	     
	 }
}
