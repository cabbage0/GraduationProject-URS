package cn.urs.entity;
/**
 * 
 * 管理人员的实体类
 * @author cabbage
 *
 */
public class Administrator {

	private int id;		
	private String userid;			//用户名，即登录用的账号
	private String username;		//姓名
	private String password;		//密码
	private int type;				//身份，0-老师；1-管理员
	private String instituteid;		//所属学院编号
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getInstituteid() {
		return instituteid;
	}
	public void setInstituteid(String instituteid) {
		this.instituteid = instituteid;
	}
	
	@Override
	public String toString() {
		return "Administrator [id=" + id + ", username=" + username + ", password=" + password + ", type=" + type
				+ ", instituteid=" + instituteid + "]";
	}
	
	
}
