package cn.urs.entity;
/**
 * 学生信息的实体类，学生的信息分为基本信息和待完善信息
 * @author cabbage
 *
 */
public class Student {

	private int id;
	private String candidatenumber;		//考生号
	private String studentid;			//学号，由于是分班之后再编制，所以可以为空
	private String studentname;			//学生姓名
	private int gender;					//性别，0-女；1-男
	private String instituteid;			//所属学院，录取后分配，所以可为空
	private String majorid;				//专业，录取后分配
	private String classid;				//所属班级编号，录取后分班
	private String scores;				//高考成绩
	private String idcard;				//身份证号
	private String birthday;			//出生年月
	private String national;			//民族
	private String political;			//政治面貌
	private String studenttype;			//学生类别（本科）
	private String password;			//学生登录系统所用密码
	private String phonenumber;			//待完善信息，学生联系电话
	private int isdisability;			//待完善信息,是否残疾，0-否；1-是
	private int issingleparent;			//待完善信息，是否单亲，0-否；1-是
	private String health;					//待完善信息，健康状况
	private int ismartyrchild;			//待完善信息，是否烈士或优抚对象子女，0-否；1-是
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCandidatenumber() {
		return candidatenumber;
	}
	public void setCandidatenumber(String candidatenumber) {
		this.candidatenumber = candidatenumber;
	}
	public String getStudentid() {
		return studentid;
	}
	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}
	public String getStudentname() {
		return studentname;
	}
	public void setStudentname(String studentname) {
		this.studentname = studentname;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getInstituteid() {
		return instituteid;
	}
	public void setInstituteid(String instituteid) {
		this.instituteid = instituteid;
	}
	public String getMajorid() {
		return majorid;
	}
	public void setMajorid(String majorid) {
		this.majorid = majorid;
	}
	public String getClassid() {
		return classid;
	}
	public void setClassid(String classid) {
		this.classid = classid;
	}
	public String getScores() {
		return scores;
	}
	public void setScores(String scores) {
		this.scores = scores;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getNational() {
		return national;
	}
	public void setNational(String national) {
		this.national = national;
	}
	public String getPolitical() {
		return political;
	}
	public void setPolitical(String political) {
		this.political = political;
	}
	public String getStudenttype() {
		return studenttype;
	}
	public void setStudenttype(String studenttype) {
		this.studenttype = studenttype;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public int getIsdisability() {
		return isdisability;
	}
	public void setIsdisability(int isdisability) {
		this.isdisability = isdisability;
	}
	public int getIssingleparent() {
		return issingleparent;
	}
	public void setIssingleparent(int issingleparent) {
		this.issingleparent = issingleparent;
	}
	public String getHealth() {
		return health;
	}
	public void setHealth(String health) {
		this.health = health;
	}
	public int getIsmartyrchild() {
		return ismartyrchild;
	}
	public void setIsmartyrchild(int ismartyrchild) {
		this.ismartyrchild = ismartyrchild;
	}
	
	public String toString() {
		return "Student [id=" + id + ", candidatenumber=" + candidatenumber + ", studentid=" + studentid
				+ ", studentname=" + studentname + ", gender=" + gender + ", instituteid=" + instituteid + ", majorid="
				+ majorid + ", classid=" + classid + ", scores=" + scores + ", idcard=" + idcard + ", birthday="
				+ birthday + ", national=" + national + ", political=" + political + ", studenttype=" + studenttype
				+ ", password=" + password + ", phonenumber=" + phonenumber + ", isdisability=" + isdisability
				+ ", issingleparent=" + issingleparent + ", health=" + health + ", ismartyrchild=" + ismartyrchild
				+ "]";
	}
}
