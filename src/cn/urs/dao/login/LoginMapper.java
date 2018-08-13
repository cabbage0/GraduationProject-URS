package cn.urs.dao.login;

import org.apache.ibatis.annotations.Param;

import cn.urs.entity.Administrator;
import cn.urs.entity.Student;

public interface LoginMapper {

	/**
	 * 管理人员通过账号登录
	 * @param userid
	 * @return
	 */
	public Administrator getAdminById(@Param("userid")String userid);

//	public Administrator getAdminByName(@Param("username")String username);
	
	/**
	 * 学生通过考生号和密码登录
	 * @param candidatenumber
	 * @return
	 */
	public Student getStudentById(@Param("candidatenumber")String candidatenumber);
	
	
}
