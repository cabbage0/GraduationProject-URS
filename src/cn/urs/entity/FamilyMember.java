package cn.urs.entity;
/**
 * 家庭成员的实体类
 * @author cabbage
 *
 */
public class FamilyMember {
	
	private int id;				//主键
	private String studentid;	//该成员对应学生的学号
	private String membername;	//成员的姓名
	private String memberage;	//成员年龄
	private String relationship;	//该成员与学生的关系，如父母亲等
	private String political;		//政治面貌，如团员党员等
	private String company;			//工作单位
	private String duty;			//担任职务
	private String phonenumber;		//联系电话
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStudentid() {
		return studentid;
	}
	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}
	public String getMembername() {
		return membername;
	}
	public void setMembername(String membername) {
		this.membername = membername;
	}
	public String getMemberage() {
		return memberage;
	}
	public void setMemberage(String memberage) {
		this.memberage = memberage;
	}
	public String getRelationship() {
		return relationship;
	}
	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}
	public String getPolitical() {
		return political;
	}
	public void setPolitical(String political) {
		this.political = political;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getDuty() {
		return duty;
	}
	public void setDuty(String duty) {
		this.duty = duty;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	
	@Override
	public String toString() {
		return "FamilyMember [id=" + id + ", studentid=" + studentid + ", membername=" + membername + ", memberage="
				+ memberage + ", relationship=" + relationship + ", political=" + political + ", company=" + company
				+ ", duty=" + duty + ", phonenumber=" + phonenumber + "]";
	}
	
	
}
