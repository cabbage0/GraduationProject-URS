package cn.urs.dao.family;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.urs.entity.Family;


public interface FamilyDataDao {

	//录入家庭信息数据
	boolean insertFamily(@Param("family")Family family,@Param("studentid")String studentid);
	
	//查询某名学生的家庭信息，用于判断是否要继续填写家庭信息
	List<Family> queryFamily(@Param("studentid")String studentid);
}
