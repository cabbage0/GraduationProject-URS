package cn.urs.service.student;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.urs.dao.student.StudentDataDao;
import cn.urs.entity.Page;
import cn.urs.entity.Student;

@Service
public class StudentDataServiceImpl implements StudentDataService{

	@Resource
	private StudentDataDao stuDao;
	
	public boolean insertStudent(Student student) {
		return stuDao.insertStudent(student);
	}

	public boolean updateStudent(Student student) {
		return stuDao.updateStudent(student);
	}

	public int studentTotalRecord(Page<Student> pageStudent, String idCardOrCdNumber) {
		return stuDao.studentTotalRecord(pageStudent, idCardOrCdNumber);
	}

	public List<Student> queryAllStudent(Page<Student> pageStudent) {
		return stuDao.queryAllStudent(pageStudent);
	}

	public int studentRecordByMajor(Page<Student> pageStudent, String majorid) {
		return stuDao.studentRecordByMajor(pageStudent, majorid);
	}

	public List<Student> queryStudentByMajor(Page<Student> pageStudent, String majorid) {
		return stuDao.queryStudentByMajor(pageStudent, majorid);
	}

	public List<Student> queryStudentOrder(Page<Student> pageStudent) {
		return stuDao.queryStudentOrder(pageStudent);
	}

	public boolean completeInformation(String studentid, String phonenumber, Integer isdisability,
			Integer issingleparent, Integer ismartyrchild, String health) {
		return stuDao.completeInformation(studentid, phonenumber, isdisability, issingleparent, ismartyrchild, health);
	}

	public Student queryStudentById(String studentid) {
		return stuDao.queryStudentById(studentid);
	}

}
