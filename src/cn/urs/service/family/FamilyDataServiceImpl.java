package cn.urs.service.family;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.urs.dao.family.FamilyDataDao;
import cn.urs.entity.Family;

@Service
public class FamilyDataServiceImpl implements FamilyDataService{

	@Resource
	private FamilyDataDao familyDao;
	
	public boolean insertFamily(Family family, String studentid) {
		return familyDao.insertFamily(family, studentid);
	}

	public List<Family> queryFamily(String studentid) {
		return familyDao.queryFamily(studentid);
	}

}
