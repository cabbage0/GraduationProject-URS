package cn.urs.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cn.urs.entity.Administrator;
import cn.urs.entity.Student;



public class SysInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Student student = (Student)session.getAttribute("student");
		System.out.println("come into sysinterceptor,student is:"+student);
		Administrator admin = (Administrator)session.getAttribute("admin");
		System.out.println("come into sysinterceptor,admin is:"+admin);
		if(null!=student || null!=admin){
			return true;
			
		}else{
			System.out.println("<<<<<<<<<<<<<,come into sysinterceptor>>>>");
			response.sendRedirect(request.getContextPath()+"/loginController/redirectLogin");
			return false;
		}
	}
}
