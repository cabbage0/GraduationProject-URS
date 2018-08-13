package cn.urs.service.registering;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.urs.dao.registering.AssignStudentIdDao;
import cn.urs.entity.Classes;
import cn.urs.entity.Major;
import cn.urs.entity.Student;

@Service
public class AssignStudentIdServiceImpl implements AssignStudentIdService{

	@Resource
	private AssignStudentIdDao assignStudentId;
	
	public int studentRecordByClass(String classid) {
		return assignStudentId.studentRecordByClass(classid);
	}

	public List<Student> queryStudentByClass(String classid) {
		return assignStudentId.queryStudentByClass(classid);
	}


	public List<Major> quertMajor() {
		return assignStudentId.quertMajor();
	}

	public List<Classes> queryClasses(String majorid) {
		return assignStudentId.queryClasses(majorid);
	}

	public boolean assignStudentId(Student student, String studentid) {
		return assignStudentId.assignStudentId(student, studentid);
	}
	
}
