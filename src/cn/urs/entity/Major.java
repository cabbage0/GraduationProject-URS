package cn.urs.entity;
/**
 * 专业的实体类
 * @author cabbage
 *
 */
public class Major {

	private int id;				//主键
	private String majorid;		//专业编号
	private String institute;	//所属学院编号
	private String majorname;	//专业名称
	private String description;	//专业简介
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMajorid() {
		return majorid;
	}
	public void setMajorid(String majorid) {
		this.majorid = majorid;
	}
	public String getInstitute() {
		return institute;
	}
	public void setInstitute(String institute) {
		this.institute = institute;
	}
	public String getMajorname() {
		return majorname;
	}
	public void setMajorname(String majorname) {
		this.majorname = majorname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Override
	public String toString() {
		return "Major [id=" + id + ", majorid=" + majorid + ", institute=" + institute + ", majorname=" + majorname
				+ ", description=" + description + "]";
	}
	
	
}
