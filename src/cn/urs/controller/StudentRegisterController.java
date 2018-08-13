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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.urs.entity.Arrival;
import cn.urs.entity.Family;
import cn.urs.entity.FamilyMember;
import cn.urs.entity.Student;
import cn.urs.service.arrival.ArrivalInformationService;
import cn.urs.service.family.FamilyDataService;
import cn.urs.service.familymember.FamilyMemberService;
import cn.urs.service.student.StudentDataService;

@Controller
@RequestMapping("/studentRegister")
public class StudentRegisterController {

	private static final Logger logger = Logger.getLogger(LoginController.class);
	
	@Resource
	private StudentDataService stuService;
	@Resource
	private FamilyDataService familyService;
	@Resource 
	private FamilyMemberService familyMemberService;
	@Resource
	private ArrivalInformationService arrivalService;
	
	/**
	 * 学生登录时进入主界面
	 * @return
	 */
	@RequestMapping("/toIndex")
	public ModelAndView toIndex(){
		return new ModelAndView("studentRegister/index");
	}
	
	/**
	 * 学生自助报到时进入首页
	 * @return
	 */
	@RequestMapping("/toHome")
	public ModelAndView toHome(){
		return new ModelAndView("studentRegister/home");
	}
	
	/**
	 * 跳转到信息采集页面
	 * @return
	 */
	@RequestMapping("/complete")
	public ModelAndView toComplete(){
		System.out.println("come into studentRegister controller!");
		return new ModelAndView("studentRegister/completeIndex");
	}
	
	/**
	 * 跳转到进一步完善信息的页面,如果已经填写过信息则弹出提示
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/completeInfo")
	public ModelAndView completeInformation(HttpServletResponse resp,HttpSession session) throws IOException{
		
		String studentid = ((Student) session.getAttribute("student")).getStudentid();
		logger.debug("-------->studentid is:"+studentid);
		List<Family> familyList = familyService.queryFamily(studentid);
		logger.debug("-------->familyList is:"+familyList);
		List<FamilyMember> familyMemberList = familyMemberService.queryFamilyMember(studentid);
		logger.debug("-------->familyMemberList is:"+familyMemberList);
		
		if((familyList.size())==0&&(familyMemberList.size())==0){
			System.out.println("Come into the right if");
			return new ModelAndView("studentRegister/completeInfo");
		}else{
			int str =0;
			System.out.println(str);
			PrintWriter out = resp.getWriter();
			out.print(str);
			out.flush();
			out.close();
			return null;
		}
	}
	
	
	/**
	 * 完善信息的操作，同时对三个表操作
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/completeInformation",method = RequestMethod.POST)
	public String saveInformation(@RequestParam(value ="phonenumber",required=false) String phonenumber,
			@RequestParam(value ="isdisability",required=false) Integer isdisability,
			@RequestParam(value ="issingleparent",required=false) Integer issingleparent,
			@RequestParam(value ="ismartyrchild",required=false) Integer ismartyrchild,
			@RequestParam(value ="health",required=false) String health,
			@RequestParam(value ="address",required=false) String address,
			@RequestParam(value ="familyPhone",required=false) String familyPhone,
			@RequestParam(value ="zip",required=false) String zip,
			@RequestParam(value ="population",required=false) String population,
			@RequestParam(value ="membername",required=false) String membername,
			@RequestParam(value ="memberage",required=false) String memberage,
			@RequestParam(value ="relationship",required=false) String relationship,
			@RequestParam(value ="political",required=false) String political,
			@RequestParam(value ="company",required=false) String company,
			@RequestParam(value ="duty",required=false) String duty,
			@RequestParam(value ="memberphone",required=false) String memberphone,
			HttpServletRequest req, HttpServletResponse resp,HttpSession session) throws IOException{
		
		System.out.println(">>>>>>>>>>>>>>>>>>Come into completeInformation<<<<<<<<<<<<<<");
		System.out.println(">>>>>>>>>>>>>>>>>>Come into completeInformation:isdisability is   "+isdisability);
		String studentid = ((Student) session.getAttribute("student")).getStudentid();
		System.out.println(">>>>>>>>>>>>>>>>>>Come into completeInformation:studentid is   "+studentid);
		
		Family family =  new Family();
		family.setAddress(address);
		family.setPhonenumber(familyPhone);
		family.setZip(zip);
		family.setPopulation(population);
		family.setStudentid(studentid);
		System.out.println(">>>>>>>>>>>>>>>>>>Come into completeInformation<<<<<<<<<<<<<<: family is  "+family);
		
		FamilyMember familyMember = new FamilyMember();
		familyMember.setStudentid(studentid);
		familyMember.setMembername(membername);
		familyMember.setMemberage(memberage);
		familyMember.setRelationship(relationship);
		familyMember.setPolitical(political);
		familyMember.setCompany(company);
		familyMember.setDuty(duty);
		familyMember.setPhonenumber(memberphone);
		System.out.println(">>>>>>>>>>>>>>>>>>Come into completeInformation<<<<<<<<<<<<<<: familyMember is  "+familyMember);
		
		boolean flag1 = stuService.completeInformation(studentid, phonenumber, isdisability, issingleparent, ismartyrchild, health);
		boolean flag2 = familyService.insertFamily(family, studentid);
		boolean flag3 = familyMemberService.insertFamilyMember(familyMember, studentid);
		
		
		int str =0;
		if (flag1&&flag2&&flag3) {
			str = 1;
		} else {
			str = 2;
		}
		System.out.println(str);
		PrintWriter out = resp.getWriter();
		out.print(str);
		out.flush();
		out.close();
		
		return "studentRegister/completeIndex";
	}
	
	
	/**
	 * 学生自助报到时进入申请修改基本信息
	 * @return
	 */
	@RequestMapping("/toUpdateInfo")
	public ModelAndView toUpdateInfo(){
		return new ModelAndView("studentRegister/updateInfoApplication");
	}
	
	/**
	 * 提交修改信息申请，将修改后的信息放入session
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/submitApplication")
	public ModelAndView submitApplication(@RequestParam(value ="candidatenumber",required=false) String candidatenumber,
			@RequestParam(value ="gender",required=false) Integer gender,
			@RequestParam(value ="studentname",required=false) String studentname,
			@RequestParam(value ="scores",required=false) String scores,
			@RequestParam(value ="idcard",required=false) String idcard,
			@RequestParam(value ="classid",required=false) String classid,
			@RequestParam(value ="studentid",required=false) String studentid,
			@RequestParam(value ="birthday",required=false) String birthday,
			@RequestParam(value ="national",required=false) String national,
			@RequestParam(value ="political",required=false) String political,
			@RequestParam(value ="studenttype",required=false) String studenttype,
			HttpServletRequest req, HttpServletResponse resp,HttpSession session) throws IOException{
		
		//出生年月根据身份证号自动获取
		String birthDay = idcard.substring(6, 10)+"-"+idcard.substring(10,12)+"-"+idcard.substring(12,14);
		
		Student newStuInfo = new Student();
		newStuInfo.setCandidatenumber(candidatenumber);
		newStuInfo.setGender(gender);
		newStuInfo.setStudentname(studentname);
		newStuInfo.setScores(scores);
		newStuInfo.setIdcard(idcard);
		newStuInfo.setClassid(classid);
		newStuInfo.setStudentid(studentid);
		newStuInfo.setNational(national);
		newStuInfo.setPolitical(political);
		newStuInfo.setStudenttype(studenttype);
		newStuInfo.setBirthday(birthDay);
		//将修改后的学生数据放入session
		session.setAttribute("newStudentInfo", newStuInfo);
		
		int str =0;
		System.out.println(str);
		PrintWriter out = resp.getWriter();
		out.print(str);
		out.flush();
		out.close();
		return null;
	}
	
	/**
	 * 管理员审核请求时跳向修改页面
	 * @return
	 */
	@RequestMapping("/toCheckUpdate")
	public String toCheckUpdate(Model model,HttpSession session){
		
		if((session.getAttribute("newStudentInfo"))!=null){
			String studentid = ((Student) session.getAttribute("newStudentInfo")).getStudentid();
			Student oldStuInfo = stuService.queryStudentById(studentid);
			model.addAttribute("oldStudentInfo", oldStuInfo);
		}
		
		return "StudentData/checkUpdateApplication";
	}
	
	/**
	 * 管理员同意学生修改信息请求
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/ensureUpdate")
	public String ensureUpdate(HttpServletResponse resp,HttpSession session) throws IOException{

		Student student = (Student) (session.getAttribute("newStudentInfo"));
		System.out.println("come into ensureUpdate,student is:"+student);
		boolean flag = stuService.updateStudent(student);
		
		int str =0;
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
		
		return "StudentData/checkUpdateApplication";
	}
	
	
	/**
	 * 学生进入来校时间确认页面
	 * @return
	 */
	@RequestMapping("/toEnsureDate")
	public ModelAndView toEnsureDate(){
		return new ModelAndView("studentRegister/ensureDate");
	}
	
	/**
	 * 保存学生提交的来校确认信息
	 * @param station
	 * @param arrivaldate
	 * @param arrivaltime
	 * @param peernumber
	 * @param req
	 * @param resp
	 * @param session
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/arrivalInfo",method = RequestMethod.POST)
	public String arrivalInformation(@RequestParam(value ="station",required=false) String station,
			@RequestParam(value ="arrivaldate",required=false) String arrivaldate,
			@RequestParam(value ="arrivaltime",required=false) String arrivaltime,
			@RequestParam(value ="peernumber",required=false) String peernumber,
			HttpServletRequest req, HttpServletResponse resp,HttpSession session) throws IOException{
		
		System.out.println(">>>>>>>>>>>>>>>>>>Come into arrivalInformation<<<<<<<<<<<<<<");
		String studentid = ((Student) session.getAttribute("student")).getStudentid();
		System.out.println(">>>>>>>>>>>>>>>>>>Come into arrivalInformation:studentid is   "+studentid);
		
		Arrival arr = arrivalService.queryArrival(studentid);
		int str = 0;
		if(arr==null||arr.equals("")){
			Arrival arrival = new Arrival();
			arrival.setStation(station);
			arrival.setArrivaldate(arrivaldate);
			arrival.setArrivaltime(arrivaltime);
			arrival.setPeernumber(peernumber);
			arrival.setStudentid(studentid);
			
			boolean flag = arrivalService.insertArrival(arrival);
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
		}else{
			str=3;
			PrintWriter out = resp.getWriter();
			out.print(str);
			out.flush();
			out.close();
			return null;
		}
	}
	
	
	/**
	 * 学生进入报到单页面
	 * @return
	 */
	@RequestMapping("/toRegisterCard")
	public String toRegisterCard(Model model,HttpSession session){
		String studentid = ((Student) session.getAttribute("student")).getStudentid();
		Arrival arrival = arrivalService.queryArrival(studentid);
		model.addAttribute("arrival",arrival);
		
		return "studentRegister/registerCard";
	}
}
