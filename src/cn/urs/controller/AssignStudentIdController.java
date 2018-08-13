package cn.urs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;

import cn.urs.entity.Classes;
import cn.urs.entity.Major;
import cn.urs.entity.Page;
import cn.urs.entity.Student;
import cn.urs.service.registering.AssignStudentIdService;

@Controller
@RequestMapping("AssignStudentId")
public class AssignStudentIdController {

	private static final Logger logger = Logger.getLogger(LoginController.class);
	
	@Resource
	private AssignStudentIdService assignStudentId;
	
	/**
	 * 用于主页面跳转,同时给下拉框赋初始值
	 * @return
	 */
	@RequestMapping(value="/queryStudent")
	public ModelAndView findStudent(){
		List<Major> majorList = assignStudentId.quertMajor();
		for(Major m : majorList){
			System.out.println(m);
		}
		ModelAndView model = new ModelAndView();
		model.addObject("major",majorList);
		model.setViewName("registering/studentByClasses");
		return model;
	}
	
	/**
	 * 
	 * @param page
	 * @param rows
	 * @param keyWord
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "showStudentByClass")
	public String showStudentByClass(@RequestParam Integer page,
			@RequestParam Integer rows,
			@RequestParam(value="keyWord",required=false) String keyWord,
			HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception{
		
		Page<Student> pageStudent = new Page<Student>();
		pageStudent.setPage((page-1)*rows);
		pageStudent.setRows(rows);
		pageStudent.setKeyWord(keyWord);
		System.out.println("showStudentByClass   classid is:"+keyWord);
		pageStudent.setList(assignStudentId.queryStudentByClass(keyWord));
		
//		ArrayList<Student> list = (ArrayList) studentService.queryStudentByMajor(pageStudent, keyWord);
//		for(Student s:list){
//			System.out.println("All Student:======>"+s);
//			
//		}
		
		int allRecord = assignStudentId.studentRecordByClass(keyWord);
		
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
		System.out.println("showStudentByClass:"+gson.toJson(pageStudent.getPageMap()));
		out.flush();
		out.close();
		return null;
	}
	
	/**
	 * 查询全部的班级编号，用于给下拉框动态赋值
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "getClassId")
	public void getClassId(@RequestParam String majorid,HttpServletRequest request,HttpServletResponse response){
		
		response.setContentType("application/json;charset=UTF-8");
		
		System.out.println("Come into getClassId,majorid is:"+majorid);
		
		List<Classes> classIdList = assignStudentId.queryClasses(majorid);
		
		JSONObject json = new JSONObject();
		String result = json.toJSONString(classIdList);
		System.out.println("Come into getClassId,classIdList is:"+classIdList);
		System.out.println("Come into getClassId,result is:"+result);
		
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.write(result);
		out.flush();
		out.close();
	}
	
	/**
	 * 查询全部的专业编号，用于给下拉框动态赋值
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "getMajorId")
	public void getMajorId(HttpServletRequest request,HttpServletResponse response){
		
		System.out.println("Come into getMajorId");
		response.setContentType("application/json;charset=UTF-8");
		 
		
		JSONObject json = new JSONObject();
		
		List<Major> majorIdList = assignStudentId.quertMajor();
		
		String result = json.toJSONString(majorIdList);
		System.out.println("Come into getMajorId,majorIdList is:"+majorIdList);
		System.out.println("Come into getMajorId,result is:"+result);
		
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.write(result);
		out.flush();
		out.close();
	}
	
	
	@RequestMapping(value="/assignStudentId")
	public void assignStudentId(@RequestParam String classid,
			HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
		
		System.out.println("Come into assignStudentId,classid is:"+classid);
		
		//先获取本班所有学生的集合
		List<Student> stuList = assignStudentId.queryStudentByClass(classid);
		
		//定义每个学生的学号为他的班级编号加上他在班级排名的序号
		String stuId = null;
		boolean flag = false;
		for(int i=1;i<=stuList.size();i++){
			if(i<10){
				stuId = classid+"0"+i;
				flag = assignStudentId.assignStudentId(stuList.get(i-1), stuId);
				System.out.println("Come into assignStudentId,stuId is:"+stuId+",flag is:"+flag);
			}else{
				stuId = classid+i;
				flag = assignStudentId.assignStudentId(stuList.get(i-1), stuId);
				System.out.println("Come into assignStudentId,stuId is:"+stuId+",flag is:"+flag);
			}
		}
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(flag);
		out.flush();
		out.close();
	}
}
