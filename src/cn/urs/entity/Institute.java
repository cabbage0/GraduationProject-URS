package cn.urs.entity;
/**
 * 学院的实体类
 * @author cabbage
 *
 */
public class Institute {

	private int id;					//主键
	private String instituteid;		//学院编号
	private String institutename;	//学院名称
	private String description;		//学院简介
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getInstituteid() {
		return instituteid;
	}
	public void setInstituteid(String instituteid) {
		this.instituteid = instituteid;
	}
	public String getInstitutename() {
		return institutename;
	}
	public void setInstitutename(String institutename) {
		this.institutename = institutename;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Override
	public String toString() {
		return "Institute [id=" + id + ", instituteid=" + instituteid + ", institutename=" + institutename
				+ ", description=" + description + "]";
	}
	
	
}
