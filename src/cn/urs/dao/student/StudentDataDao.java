package cn.urs.dao.student;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.urs.entity.Page;
import cn.urs.entity.Student;

/**
 * 操作学生数据的接口
 * @author cabbage
 *
 */
public interface StudentDataDao {

	//录入学生数据
	boolean insertStudent(@Param("student")Student student);
	
	//修改数据
	boolean updateStudent(@Param("student")Student student);
	
	//查询某个学生的信息，用于审核修改请求时显示原来的信息
	Student queryStudentById(@Param("studentid")String studentid);
	
	//完善详细信息
	boolean completeInformation(@Param("studentid")String studentid,@Param("phonenumber")String phonenumber,@Param("isdisability")Integer isdisability,@Param("issingleparent")Integer issingleparent,@Param("ismartyrchild")Integer ismartyrchild,@Param("health")String health);
	
	//获取所有学生的总记录数用于分页,查询时用考生号或者身份证号查询
	int studentTotalRecord(@Param("pageStudent")Page<Student> pageStudent,@Param("idCardOrCdNumber")String idCardOrCdNumber);
	
	//查询录取的所有学生信息
	List<Student> queryAllStudent(@Param("pageStudent")Page<Student> pageStudent);
	
	//获取本专业所有学生的总记录数用于分页,查询时用考生号或者身份证号查询
	int studentRecordByMajor(@Param("pageStudent")Page<Student> pageStudent,@Param("majorid")String majorid);
	
	//查询本专业录取的所有学生信息
	List<Student> queryStudentByMajor(@Param("pageStudent")Page<Student> pageStudent,@Param("majorid")String majorid);
	
	//查询录取的所有学生信息按性别排序，用于分配班级时平衡男女人数
	List<Student> queryStudentOrder(@Param("pageStudent")Page<Student> pageStudent);
}
