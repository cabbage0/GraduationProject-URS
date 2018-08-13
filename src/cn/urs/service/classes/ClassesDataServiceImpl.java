package cn.urs.service.classes;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.urs.dao.classes.ClassesDao;
import cn.urs.entity.Classes;
import cn.urs.entity.Page;

@Service
public class ClassesDataServiceImpl implements ClassesDataService{

	@Resource
	private ClassesDao classDao;
	
	public boolean insertClasses(Classes classes) {
		return classDao.insertClasses(classes);
	}

	public boolean updateClasses(Classes classes) {
		return classDao.updateClasses(classes);
	}

	public boolean deleteClasses(int classid) {
		return classDao.deleteClasses(classid);
	}

	public int classTotalRecord(Page<Classes> pageClasses, String classid) {
		return classDao.classTotalRecord(pageClasses, classid);
	}

	public List<Classes> queryAllClasses(Page<Classes> pageClasses) {
		return classDao.queryAllClasses(pageClasses);
	}

	public Classes queryClasses(String classid) {
		return classDao.queryClasses(classid);
	}
	

}
