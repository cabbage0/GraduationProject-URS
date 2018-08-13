package cn.urs.service.login;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import cn.urs.dao.login.LoginMapper;
import cn.urs.entity.Administrator;
import cn.urs.entity.Student;

@Service
public class LoginServiceImpl implements LoginService{

	private static final Logger logger = Logger.getLogger(LoginServiceImpl.class);
	
	@Resource
	private LoginMapper loginMapper;
	
	@Override
	public Administrator getAdminById(String userid) {
		return loginMapper.getAdminById(userid);
	}

	@Override
	public Student getStudentById(String candidatenumber) {
		return loginMapper.getStudentById(candidatenumber);
	}
	
	
}
