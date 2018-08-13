package cn.urs.service.arrival;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.urs.dao.arrival.ArrivalInformationDao;
import cn.urs.entity.Arrival;

@Service
public class ArrivalInformationServiceImpl implements ArrivalInformationService{

	@Resource
	private ArrivalInformationDao arrDao;
	
	public boolean insertArrival(Arrival arrival) {
		return arrDao.insertArrival(arrival);
	}

	public Arrival queryArrival(String studentid) {
		return arrDao.queryArrival(studentid);
	}
	
}
