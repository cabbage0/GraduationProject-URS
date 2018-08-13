package cn.urs.dao.familymember;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.urs.entity.FamilyMember;

public interface FamilyMemberDao {

	//录入紧急联系人信息数据
	boolean insertFamilyMember(@Param("familyMember")FamilyMember familyMember,@Param("studentid")String studentid);
	
	//查询某名学生的紧急联系人信息，用于判断是否要继续填写
	List<FamilyMember> queryFamilyMember(@Param("studentid")String studentid);
}
