package cn.urs.service.registering;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.urs.entity.Classes;
import cn.urs.entity.Major;
import cn.urs.entity.Student;

public interface AssignStudentIdService {

	//获取本班级所有学生的总记录数用于分班
	int studentRecordByClass(@Param("classid")String classid);
	
	//查询本班级录取的所有学生信息
	List<Student> queryStudentByClass(@Param("classid")String classid);

	//查询所有的班级编号
	List<Classes> queryClasses(@Param("majorid")String majorid);
	
	//查询所有专业编号
	List<Major> quertMajor();
	
	//为学生分配学号
	boolean assignStudentId(@Param("student")Student student,@Param("studentid")String studentid);
}
