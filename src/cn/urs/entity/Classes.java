package cn.urs.entity;

/**
 * 班级实体类
 * @author cabbage
 *
 */
public class Classes {
	
	private int id;				//主键
	private String classid;		//班级编号
	private int classtype;		//班级类型,0:实验班;1:普通班
	private String majorid;		//该班级所属的专业
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getClassid() {
		return classid;
	}
	public void setClassid(String classid) {
		this.classid = classid;
	}
	public int getClasstype() {
		return classtype;
	}
	public void setClasstype(int classtype) {
		this.classtype = classtype;
	}
	public String getMajorid() {
		return majorid;
	}
	public void setMajorid(String majorid) {
		this.majorid = majorid;
	}
	
	public String toString() {
		return "Classes [id=" + id + ", classid=" + classid + ", classtype=" + classtype
				+ ", majorid=" + majorid + "]";
	}
	
	
	
}
