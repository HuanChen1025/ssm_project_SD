package com.lin.service;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.lin.dao.TouziDao;
import com.lin.domain.ResultData;

@Service
public class TouZiServiceImpl implements TouZiService {
	
	@Resource
	private TouziDao touziDao;
	
	

	@Override
	public List<ResultData> selectSHXY(String city) {
		List<ResultData> list = touziDao.selectSHXY(city);
		return list;
	}

	@Override
	public List<ResultData> selectQYXY(String city) {
		List<ResultData> list = touziDao.selectQYXY(city);
		return list;
	}

	@Override
	public List<ResultData> selectYWCB(String city) {
		List<ResultData> list = touziDao.selectYWCB(city);
		return list;
	}
	

}
