package cn.urs.service.arrival;

import org.apache.ibatis.annotations.Param;

import cn.urs.entity.Arrival;

public interface ArrivalInformationService {

	//录入到校信息
	boolean insertArrival(@Param("arrival")Arrival arrival);
	
	//查询某个学生的到校信息
	Arrival queryArrival(@Param("studentid")String studentid);
}
