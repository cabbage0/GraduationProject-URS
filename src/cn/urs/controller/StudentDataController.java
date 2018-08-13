package cn.urs.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import cn.urs.entity.Page;
import cn.urs.entity.Student;
import cn.urs.service.student.StudentDataService;
import cn.urs.untils.XslToSqlUtil;

@Controller
@RequestMapping("StudentController")
public class StudentDataController {

	private static final Logger logger = Logger.getLogger(LoginController.class);

	@Resource
	private StudentDataService studentService;

	/**
	 * 用于主页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(value = "/queryStudent")
	public String findStudent() {
		return "StudentData/queryStudent";
	}

	/**
	 * 进入学生数据操作时先显现已录取的学生信息
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
	@RequestMapping(value = "/showStudent")
	public String queryAllStudent(@RequestParam Integer page, @RequestParam Integer rows,
			@RequestParam(value = "keyWord", required = false) String keyWord, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		Page<Student> pageStudent = new Page<Student>();

		pageStudent.setPage((page - 1) * rows);

		pageStudent.setRows(rows);

		pageStudent.setKeyWord(keyWord);
		System.out.println("queryAllStudent:" + keyWord);

		pageStudent.setList(studentService.queryAllStudent(pageStudent));

		// ArrayList<Student> list = (ArrayList)
		// studentService.queryAllStudent(pageStudent);
		// for(Student s:list){
		// System.out.println("All Student:======>"+s);
		//
		// }

		int allRecord = studentService.studentTotalRecord(pageStudent, keyWord);

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
	 * 用于弹出录入新生数据的窗口
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "/loadInsert")
	private String LoadInsertStudent(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		return "StudentData/insertStudent";
	}

	@RequestMapping(value = "insertStudent", method = RequestMethod.POST)
	public String insertStudent(@RequestParam(value = "candidatenumber", required = false) String candidatenumber,
			@RequestParam(value = "gender", required = false) String gender,
			@RequestParam(value = "studentname", required = false) String studentname,
			@RequestParam(value = "scores", required = false) String scores,
			@RequestParam(value = "idcard", required = false) String idcard,
			@RequestParam(value = "instituteid", required = false) String instituteid,
			@RequestParam(value = "majorid", required = false) String majorid,
			@RequestParam(value = "birthday", required = false) String birthday,
			@RequestParam(value = "national", required = false) String national,
			@RequestParam(value = "political", required = false) String political,
			@RequestParam(value = "studenttype", required = false) String studenttype, HttpServletRequest req,
			HttpServletResponse resp) throws IOException {

		System.out.println(">>>>>>>>>>>>>>>>>>Come into insertStudent<<<<<<<<<<<<<<");
		System.out.println(">>>>>>>>>>>>>>>>>>Come into insertStudent:gender is   " + gender);
		int Gender = 0;
		if (gender.equals("1")) {
			Gender = 1;
		} else {
			Gender = 0;
		}

		String cdNumber = candidatenumber;
		String stuName = studentname;
		String idCard = idcard;
		String instituteId = instituteid;
		String majorId = majorid;
		String nation = national;
		String politic = political;
		String stuType = studenttype;
		String brithDay = birthday;
		// SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// Date birth = sdf.parse(brithDay);

		Student student = new Student();
		student.setCandidatenumber(cdNumber);
		student.setGender(Gender);
		student.setStudentname(stuName);
		student.setIdcard(idCard);
		student.setInstituteid(instituteId);
		student.setMajorid(majorId);
		student.setScores(scores);
		student.setNational(nation);
		student.setPolitical(politic);
		student.setStudenttype(stuType);
		student.setBirthday(brithDay);
		// 将密码设定为身份证号后6位，即默认密码
		student.setPassword(idCard.substring(12, 18));

		System.out.println("=====insertStudent------>" + student);

		boolean flag = studentService.insertStudent(student);
		int str = 0;
		if (flag) {
			str = 1;
		} else {
			str = 2;
		}
		System.out.println(str);
		PrintWriter out = resp.getWriter();
		out.print(str);
		out.flush();
		out.close();

		return null;
	}

	/**
	 * Excel文件上传
	 * 
	 * @param file
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/insertStuByExcel", method = RequestMethod.POST)
	public String insertStudentByExcel(MultipartFile insertStuByExcel, HttpServletRequest request, HttpSession session)
			throws IOException {

		System.out.println(">>>>>>>>>>>>>>>>>>>>fucku:" + insertStuByExcel.isEmpty());
		if (!(insertStuByExcel.isEmpty())) {
			// 先上传文件
			String path = request.getSession().getServletContext().getRealPath("/") + "statics\\upload";
			System.out.println("come into insertStuByExcel,path is:" + path);
			System.out.println("file is :" + insertStuByExcel);
			String fileName = insertStuByExcel.getOriginalFilename();
			//判读文件后缀名是不是xls
			if (XslToSqlUtil.isXlsFile(fileName)) {
				System.out.println("come into insertStuByExcel,fileName is:" + fileName);
				File dir = new File(path, fileName);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				// MultipartFile自带的解析方法
				insertStuByExcel.transferTo(dir);
				// 读取Excel文件中的数据
				String filePath = path + "\\" + fileName;
				System.out.println("come into insertStuByExcel,filePath is:" + filePath);
				List<List<String>> table = XslToSqlUtil.getTable(filePath, 0);
				for (int i = 1; i < table.size() - 1; i++) {
					List<String> stuList = table.get(i);
					Student student = new Student();
					for (int j = 0; j < stuList.size(); j++) {
						String birthDay = null;
						if (j == 0) {
							student.setCandidatenumber(stuList.get(j));
						}
						if (j == 1) {
							student.setStudentname(stuList.get(j));
						}
						if (j == 2) {
							if ((stuList.get(j)) != null && !(stuList.get(j)).equals("")) {
								int gender = Integer.valueOf(stuList.get(j));
								student.setGender(gender);
							}
						}
						if (j == 3) {
							student.setInstituteid(stuList.get(j));
						}
						if (j == 4) {
							student.setMajorid(stuList.get(j));
						}
						if (j == 5) {
							student.setScores(stuList.get(j));
						}
						if (j == 6) {
							String idcard = stuList.get(j);
							System.out.println("idcard is:" + idcard);
							if (idcard != null && !idcard.equals("")) {
								student.setIdcard(idcard);
								birthDay = idcard.substring(6, 10) + "-" + idcard.substring(10, 12) + "-"
										+ idcard.substring(12, 14);
								System.out.println("birthday is:" + birthDay);
								student.setBirthday(birthDay);
								student.setPassword(idcard.substring(12, 18));
							}
						}
						if (j == 7) {
							student.setNational(stuList.get(j));
						}
						if (j == 8) {
							student.setPolitical(stuList.get(j));
						}
						if (j == 9) {
							student.setStudenttype(stuList.get(j));
						}
					}
					studentService.insertStudent(student);
					// System.out.println("student "+i+" is:"+student);
				}
			}
			return "StudentData/queryStudent";
		} else {
			return "StudentData/queryStudent";
		}
	}
}
