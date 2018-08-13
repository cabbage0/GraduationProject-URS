package cn.urs.dao.registering;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.urs.entity.Classes;
import cn.urs.entity.Student;

public interface AssignClassesDao {

	//获取本专业所有学生的总记录数用于分班
	int classesRecordByMajor(@Param("majorid")String majorid);
	
	//查询本专业录取的所有男学生信息
	List<Student> queryBoyStudentByMajor(@Param("majorid")String majorid);
	
	//查询本专业录取的所有女学生信息
	List<Student> queryGirlStudentByMajor(@Param("majorid")String majorid);
	
	//分配班级，即修改学生的班级编号这一属性
	boolean assignClass(@Param("student")Student student,@Param("classid")String classid);
	
	//查询本专业录取的所有班级编号
	List<Classes> queryClassIdByMajor(@Param("majorid")String majorid);
}
