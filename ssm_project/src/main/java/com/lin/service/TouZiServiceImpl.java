package com.lin.service;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.lin.dao.TouziDao;
import com.lin.domain.ResultData;
import com.lin.domain.ValueNumber;

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

	@Override
	public List<ValueNumber> select_benefit_class1(String Name) {
		List<ValueNumber> list =touziDao.select_benefit_class1(Name);
		return list;
	}

	@Override
	public List<ValueNumber> select_benefit_class2(String Name) {
		List<ValueNumber> list =touziDao.select_benefit_class2(Name);
		return list;
	}

	@Override
	public List<ValueNumber> select_benefit_class3(String Name) {
		List<ValueNumber> list =touziDao.select_benefit_class3(Name);
		return list;
	}

	@Override
	public List<ValueNumber> benifit_cost_class1(String[] benifit, String[] cost) {
		List<ValueNumber> list = touziDao.benifit_cost_class1(benifit, cost);
		return list;
	}

	@Override
	public List<ValueNumber> benifit_cost_class2(String[] benifit, String[] cost) {
		List<ValueNumber> list = touziDao.benifit_cost_class2(benifit, cost);
		return list;
	}

	@Override
	public List<ValueNumber> benifit_cost_class3(String[] benifit, String[] cost) {
		List<ValueNumber> list = touziDao.benifit_cost_class3(benifit, cost);
		return list;
	}

	@Override
	public List<ValueNumber> benifit_cost_select(String[] selectElement,
			String city) {
		List<ValueNumber> list = touziDao.benifit_cost_select(selectElement, city);
		return list;
	}
	

}
