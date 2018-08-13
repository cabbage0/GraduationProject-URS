package cn.urs.service.login;

import cn.urs.entity.Administrator;
import cn.urs.entity.Student;

public interface LoginService {

	/**
	 * 管理人员通过账号登录
	 * @param userid
	 * @return
	 */
	public Administrator getAdminById(String userid);
	
	
	/**
	 * 学生通过考生号和密码登录
	 * @param candidatenumber
	 * @return
	 */
	public Student getStudentById(String candidatenumber);
}
