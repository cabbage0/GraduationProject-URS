package cn.urs.service.classes;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.urs.entity.Classes;
import cn.urs.entity.Page;

public interface ClassesDataService {

	//录入班级数据
	boolean insertClasses(@Param("classes")Classes classes);
	
	//修改数据
	boolean updateClasses(@Param("classes")Classes classes);
	
	//删除数据
	boolean deleteClasses(@Param("classid")int classid);
	
	//获取所有学生的总记录数用于分页,查询时用考生号或者身份证号查询
	int classTotalRecord(@Param("pageClasses")Page<Classes> pageClasses,@Param("classid")String classid);
	
	//查询录取的所有学生信息
	List<Classes> queryAllClasses(@Param("pageClasses")Page<Classes> pageClasses);
	
	//查询某个班级的信息
	Classes queryClasses(@Param("classid")String classid);
}
