package cn.urs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import cn.urs.entity.Classes;
import cn.urs.entity.Major;
import cn.urs.entity.Page;
import cn.urs.service.classes.ClassesDataService;
import cn.urs.service.registering.AssignStudentIdService;
import cn.urs.untils.AssignClassUtil;

@Controller
@RequestMapping("classesController")
public class ClassesDataController {

	private static final Logger logger = Logger.getLogger(LoginController.class);
	
	@Resource
	private ClassesDataService classService;
	@Resource
	private AssignStudentIdService assignStuIdService;
	/**
	 * 用于主页面跳转
	 * @return
	 */
	@RequestMapping(value="/queryClasses")
	public String findClasses(){
		return "ClassesData/queryClasses";
	}
	
	
	/**
	 * 查询已有的班级信息
	 * @param page
	 * @param rows
	 * @param keyWord
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/showClasses")
	public String queryAllClasses(@RequestParam Integer page,
			@RequestParam Integer rows,
			@RequestParam(value="keyWord",required=false) String keyWord,
			HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception{
		
		Page<Classes> pageClasses = new Page<Classes>();
		
		pageClasses.setPage((page-1)*rows);

		pageClasses.setRows(rows);

		pageClasses.setKeyWord(keyWord);
		System.out.println("queryAllClasses:"+keyWord);
		
		pageClasses.setList(classService.queryAllClasses(pageClasses));
		
		int allRecord = classService.classTotalRecord(pageClasses, keyWord);
		
		pageClasses.setTotalRecord(allRecord);
		PrintWriter out = null;
		try {
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}

		Gson gson = new Gson();
		out.write(gson.toJson(pageClasses.getPageMap()));
		out.flush();
		out.close();
		return null;
	}
	
	
	/**
	 * 用于弹出录入班级数据的窗口
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value="/loadInsert")
	private ModelAndView LoadInsertClass(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		List<Major> majorList = assignStuIdService.quertMajor();
		for(Major m : majorList){
			System.out.println(m);
		}
		ModelAndView model = new ModelAndView();
		model.addObject("major",majorList);
		model.setViewName("ClassesData/insertClass");
		
		return model;
	}
	
	
	
	@RequestMapping(value = "insertClasses",method = RequestMethod.POST)
	public String insertClass(@RequestParam(value ="number",required=false) Integer number,
			@RequestParam(value ="majorid",required=false) String majorid,
			@RequestParam(value ="classtype",required=false) Integer classtype,
			HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
		
		System.out.println(">>>>>>>>>>>>>>>>>>Come into insertClass<<<<<<<<<<<<<<");
		System.out.println(">>>>>>>>>>>>>>>>>>Come into insertClass:classtype is   "+classtype);
		
		String classid = AssignClassUtil.assignClassId(majorid, number);
		
		Classes classes = new Classes();
		classes.setClassid(classid);
		classes.setMajorid(majorid);
		classes.setClasstype(classtype);
		
		System.out.println("=====insertClass------>"+classes);
		
		boolean flag = classService.insertClasses(classes);
		int str =0;
		if (flag) {
			str = 1;
		} else {
			str = 2;
		}
//		req.setAttribute("result", str);
//		req.getRequestDispatcher("/insertDepartment.jsp").forward(req, resp);
		System.out.println(str);
		PrintWriter out = resp.getWriter();
		out.print(str);
		out.flush();
		out.close();
		
		return "ClassesData/insertClass";
	}
	
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public void deleteClasses(@RequestParam String[] classid, HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		int[] cid = new int[classid.length];
		for (int i = 0; i < classid.length; i++) {
			cid[i] = Integer.parseInt(classid[i]);
			System.out.println("ClassesController:" + cid[i]);
		}

		int count = 0;
		boolean flag = false;

		for (int classId : cid) {
			flag = classService.deleteClasses(classId);
			if (flag) {
				count++;
			}
		}
		System.out.println("classesController:" + flag);
		System.out.println("classesController:" + count);
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.print(count);
		out.flush();
		out.close();
	}
	
	
	/**
	 * 加载修改页面
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value="/loadUpdate")
	private String LoadUpdateClass(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		return "ClassesData/updateClass";
	}
	
	
	@RequestMapping(value="/ensureUpdate")
	private void EnsureUpdate(
			@RequestParam String classid,@RequestParam String classtype,@RequestParam String majorid,
			HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		
		int Classtype = 0;
		if(classtype.equals("1")){
			Classtype = 1;
		}else{
			Classtype = 0;
		}
		
		Classes classes = new Classes();
		classes.setClassid(classid);
		classes.setClasstype(Classtype);
		classes.setMajorid(majorid);
		System.out.println("ensureUpdate:"+classes);
		
		boolean flag = classService.updateClasses(classes);
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		int count = 0;
		if (flag) {
			count = 1;
		}
		out.print(count);
		out.flush();
		out.close();
	}
}
