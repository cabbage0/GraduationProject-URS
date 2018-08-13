package cn.urs.entity;
/**
 * 学生家庭的实体类
 * @author cabbage
 *
 */
public class Family {

	private int id;				//主键
	private String studentid;	//该学生的学号
	private String address;		//家庭住址
	private String phonenumber;	//家庭联系电话
	private String zip;			//家庭邮政编码
	private String population;	//家庭人口数
	
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getPopulation() {
		return population;
	}
	public void setPopulation(String population) {
		this.population = population;
	}
	
	public String toString() {
		return "Family [id=" + id + ", studentid=" + studentid + ", address=" + address + ", phonenumber=" + phonenumber
				+ ", zip=" + zip + ", population=" + population + "]";
	}
	
}
