package cn.urs.service.familymember;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.urs.dao.familymember.FamilyMemberDao;
import cn.urs.entity.FamilyMember;

@Service
public class FamilyMemberServiceImpl implements FamilyMemberService{

	@Resource
	private FamilyMemberDao familyMemberDao;
	
	public boolean insertFamilyMember(FamilyMember familyMember, String studentid) {
		return familyMemberDao.insertFamilyMember(familyMember, studentid);
	}

	public List<FamilyMember> queryFamilyMember(String studentid) {
		return familyMemberDao.queryFamilyMember(studentid);
	}

}
