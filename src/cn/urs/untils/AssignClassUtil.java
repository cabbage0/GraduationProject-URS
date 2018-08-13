package cn.urs.untils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import cn.urs.entity.Classes;
import cn.urs.entity.Page;
import cn.urs.entity.Student;
import cn.urs.service.registering.AssignClassesService;
import cn.urs.service.student.StudentDataService;

public class AssignClassUtil {
	
	@Resource
	private static StudentDataService stuService;
	@Resource
	private static AssignClassesService assignService;
	
	
	/**
	 * 把排好顺序的男女学生按照分班数分组, 先把男生按班数分组, 每组的第一个学生分到第一班, 第二个学生分到第二班, 直到将每组的每个学生分完为止
	 * @param classCount班级数量
	 * @param stuList   男生或女生的人数
	 * @return  含有班级信息的map
	 */
	public static Map assignClass(int classCount,List<Student> stuList){
		
		//男生或女生人数为i
		int i=stuList.size();
		
		//每组人数为m
//		int m = i/classCount;
		
		Map<Object, List<Student>> map = new HashMap<Object,List<Student>>();
		for (int j = 0; j < classCount ; j++) {
			List<Student> classes = new LinkedList<Student>();
			map.put("classes"+j, classes);
		}
		
		int ban = 1;//第几个班级
		int ren = 0;//第几个人
		for( ;ren<i;ren++,ban++ ){
			ban = ban % classCount;
			Student s = stuList.get(ren);
			//s放入第几个班级
			List<Student> list = map.get("classes"+ban);
			list.add(s);
			map.put("classes"+ban, list);
		}
		
		System.out.println(map);
		return map;
	}
	
	
	/**
	 * 生成班级编号，当年年份+专业编号+序号
	 * @param majorid
	 * @return
	 */
	public static String assignClassId(String majorid,int number){
		//获取现在的年份
		SimpleDateFormat sdf = new SimpleDateFormat();
		Date date = new Date();
		String year = (sdf.format(date)).substring(0, 2);
		String classid=null;
		if(number<10){
			classid = year+majorid+"0"+number;
		}else{
			classid = year+majorid+number;
		}
		return classid;
	}
}
