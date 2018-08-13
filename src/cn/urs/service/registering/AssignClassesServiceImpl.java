package cn.urs.service.registering;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.urs.dao.registering.AssignClassesDao;
import cn.urs.entity.Classes;
import cn.urs.entity.Student;

@Service
public class AssignClassesServiceImpl implements AssignClassesService{

	@Resource
	private AssignClassesDao assignDao;
	
	
	public int classesRecordByMajor(String majorid) {
		return assignDao.classesRecordByMajor(majorid);
	}

	public List<Student> queryBoyStudentByMajor(String majorid) {
		return assignDao.queryBoyStudentByMajor(majorid);
	}

	public List<Student> queryGirlStudentByMajor(String majorid) {
		return assignDao.queryGirlStudentByMajor(majorid);
	}

	public boolean assignClass(Student student,String classid) {
		return assignDao.assignClass(student, classid);
	}

	public List<Classes> queryClassIdByMajor(String majorid) {
		return assignDao.queryClassIdByMajor(majorid);
	}

	
}
