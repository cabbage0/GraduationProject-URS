package cn.urs.entity;
/**
 * 到校信息表
 * @author cabbage
 *
 */
public class Arrival {

	private int id;
	private String station;			//到达站点
	private String arrivaldate;		//到达日期
	private String arrivaltime;		//到达时间
	private String peernumber;		//随行人数
	private String studentid;		//对应学生的信息
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStation() {
		return station;
	}
	public void setStation(String station) {
		this.station = station;
	}
	public String getArrivaldate() {
		return arrivaldate;
	}
	public void setArrivaldate(String arrivaldate) {
		this.arrivaldate = arrivaldate;
	}
	public String getArrivaltime() {
		return arrivaltime;
	}
	public void setArrivaltime(String arrivaltime) {
		this.arrivaltime = arrivaltime;
	}
	public String getPeernumber() {
		return peernumber;
	}
	public void setPeernumber(String peernumber) {
		this.peernumber = peernumber;
	}
	public String getStudentid() {
		return studentid;
	}
	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}
	
	public String toString() {
		return "Arrival [id=" + id + ", station=" + station + ", arrivaldate=" + arrivaldate + ", arrivaltime="
				+ arrivaltime + ", peernumber=" + peernumber + ", studentid=" + studentid + "]";
	}
}
