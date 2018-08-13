package cn.urs.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.urs.entity.Administrator;
import cn.urs.entity.Student;
import cn.urs.service.login.LoginService;

@Controller
@RequestMapping("/loginController")
public class LoginController {

	private static final Logger logger = Logger.getLogger(LoginController.class);
	
	@Resource
	private LoginService loginService;
	
	/**
	 * 用于登录时重定向到后台页面
	 */
	@RequestMapping("/redirectAdmin")
	public ModelAndView backToAdmin(@RequestParam(required=false)Integer type){
		System.out.println("<<<<<<<Come Into redirectAdmin>>>>>>");
		if(type==0){
			return new ModelAndView("main/admin");
		}else if(type==1){
			return new ModelAndView("login/login");
		}else{
			return new ModelAndView("main/main");
		}
	}
	
	
	/**
	 * 处理用户登录的逻辑，管理人员登录后跳转到后台，学生登录后跳转到自助报到页面
	 * @param userid  学生登录的考生号或者管理员登录的账号
	 * @param password 密码
	 * @param session
	 * @return 处理后的视图
	 */
	@RequestMapping("/login")
	public String Login(@RequestParam(value="userid",required=false)String userid,
			@RequestParam(value="password",required=false)String password,
			HttpSession session) {
		logger.debug("------------>>userid:"+userid);
		logger.debug("------------>>password:"+password);
		
		Administrator admin = loginService.getAdminById(userid);
		Student student = loginService.getStudentById(userid);
		
		if(null != admin) {
			if(password.equals(admin.getPassword())) {
				session.setAttribute("admin", admin);
				return "redirect:/loginController/redirectAdmin?type=0";
//				mView = new ModelAndView("main/admin");
			}else {
//				mView = new ModelAndView("login/login");
				return "redirect:/loginController/redirectAdmin?type=1";
			}
		}else if(null != student){
			if(password.equals(student.getPassword())){
//				mView = new ModelAndView("main/main");
				session.setAttribute("student", student);
				return "redirect:/loginController/redirectAdmin?type=2";
			}else{
//				mView = new ModelAndView("login/login");
				return "login/login";
			}
		}
		return "login/login";
	}
	
	
	/**
	 * 用于安全退出时返回登录页面
	 * @return
	 */
	@RequestMapping("/redirectLogin")
	public ModelAndView backToLogin(){
		System.out.println("<<<<<<<Come Into redirectLogin>>>>>>");
		return new ModelAndView("login/login");
	}
	
	
	/**
	 * 用户安全退出
	 * @param session
	 * @return 返回到登录页面
	 */
	@RequestMapping("/loginOut")
	public ModelAndView LoginOut(HttpSession session){
		session.removeAttribute("admin");
		session.removeAttribute("student");
//		session.invalidate();
		System.out.println("loginOut:===========>"+session);
		return new ModelAndView("redirect:/loginController/redirectLogin");
	}
}
