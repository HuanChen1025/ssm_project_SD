package com.lin.service;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.lin.dao.GuimoDao;
import com.lin.domain.DtuInfo;
import com.lin.domain.ResultData;


@Service
public class GuimoServiceImpl implements GuimoService {
	@Resource
	private GuimoDao guimoDao;

	@Override
	public List<DtuInfo> selectDFtu(String area, String time) {
		 List<DtuInfo> list = guimoDao.selectDFtu( area,time);
		return list;
	}

	@Override
	public List<ResultData> selectTXW(String area,String time) {
		
		List<ResultData> list = guimoDao.selectTXW(area,time);
		return list;
	}

	@Override
	public List<ResultData> selectPDZDHXT(String city) {
		
		List<ResultData> list = guimoDao.selectPDZDHXT(city);
		return list;
	}

	@Override
	public List<ResultData> selectYCSBGZ(String city) {
		List<ResultData> list = guimoDao.selectYCSBGZ(city);
		return list;
	}

	@Override
	public List<ResultData> selectXL(String city) {
		List<ResultData> list = guimoDao.selectXL(city);
		return list;
	}

	

}
