package cn.urs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import cn.urs.entity.Classes;
import cn.urs.entity.Major;
import cn.urs.entity.Page;
import cn.urs.entity.Student;
import cn.urs.service.registering.AssignClassesService;
import cn.urs.service.registering.AssignStudentIdService;
import cn.urs.service.student.StudentDataService;
import cn.urs.untils.AssignClassUtil;

@Controller
@RequestMapping("AssignClass")
public class AssignClassController {

	private static final Logger logger = Logger.getLogger(LoginController.class);
	
	@Resource
	private StudentDataService studentService;
	@Resource
	private AssignClassesService assignService;
	@Resource
	private AssignStudentIdService assignStuIdService;
	
	/**
	 * 用于主页面跳转
	 * @return
	 */
	@RequestMapping(value="/queryStudent")
	public ModelAndView findStudent(){
		List<Major> majorList = assignStuIdService.quertMajor();
		for(Major m : majorList){
			System.out.println(m);
		}
		ModelAndView model = new ModelAndView();
		model.addObject("major",majorList);
		model.setViewName("registering/studentByMajor");
		return model;
	}
	
	
	/**
	 * 根据专业编号显示学生信息
	 * @param page
	 * @param rows
	 * @param keyWord
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "showStudentByMajor")
	public String showStudentByMajor(@RequestParam Integer page,
			@RequestParam Integer rows,
			@RequestParam(value="keyWord",required=false) String keyWord,
			HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception{
		
		Page<Student> pageStudent = new Page<Student>();
		pageStudent.setPage((page-1)*rows);
		pageStudent.setRows(rows);
		pageStudent.setKeyWord(keyWord);
		System.out.println("showStudentByMajor   mojorid is:"+keyWord);
		pageStudent.setList(studentService.queryStudentByMajor(pageStudent, keyWord));
		
		ArrayList<Student> list = (ArrayList) studentService.queryStudentByMajor(pageStudent, keyWord);
		for(Student s:list){
			System.out.println("All Student:======>"+s);
			
		}
		
		int allRecord = studentService.studentRecordByMajor(pageStudent, keyWord);
		
		pageStudent.setTotalRecord(allRecord);
		PrintWriter out = null;
		try {
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}

		Gson gson = new Gson();
		out.write(gson.toJson(pageStudent.getPageMap()));
		out.flush();
		out.close();
		return null;
	}
	
	/**
	 * 分配班级
	 * @param majorid 专业编号
	 * @param request
	 * @param response
	 * @param session
	 * @throws IOException
	 */
	@RequestMapping(value="/assignClass")
	public void assignClass(@RequestParam String majorid,
			HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
		
		System.out.println("Come into assignClass,majorid is:"+majorid);
		//获取本专业班级数量
		int classCount = assignService.classesRecordByMajor(majorid);
		
		//男女各自分班
		List<Student> boyList = assignService.queryBoyStudentByMajor(majorid);
		List<Student> girlList = assignService.queryGirlStudentByMajor(majorid);
		
		Map boyMap = AssignClassUtil.assignClass(classCount, boyList);
		Map girlMap = AssignClassUtil.assignClass(classCount, girlList);
		
		//获取本专业的班级编号的集合
		List<Classes> classid = assignService.queryClassIdByMajor(majorid);
		
		boolean flag = false;
		
		for (int i = 0; i < boyMap.size() ; i++) {
			List<Student> classBoy = (List<Student>) boyMap.get("classes"+i);
			for(int j=0;j<classBoy.size();j++){
				Student s = classBoy.get(j);
				System.out.println("assignClass========>"+s);
				flag = assignService.assignClass(s,(classid.get(i)).getClassid());
				System.out.println("assignClass========>"+flag);
			}
		}
		
		for (int i = 0; i < girlMap.size() ; i++) {
			List<Student> classGirl = (List<Student>) girlMap.get("classes"+i);
			for(int j=0;j<classGirl.size();j++){
				Student s = classGirl.get(j);
				System.out.println("assignClass========>"+s);
				flag = assignService.assignClass(s,(classid.get(i)).getClassid());
				System.out.println("assignClass========>"+flag);
			}
		}
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(flag);
		out.flush();
		out.close();
		
	}
}
