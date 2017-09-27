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
	public List<ResultData> selectSHXY(String city,String time) {
		List<ResultData> list = touziDao.selectSHXY(city,time);
		return list;
	}

	@Override
	public List<ResultData> selectQYXY(String city,String time) {
		List<ResultData> list = touziDao.selectQYXY(city,time);
		return list;
	}

	@Override
	public List<ResultData> selectYWCB(String city,String time) {
		List<ResultData> list = touziDao.selectYWCB(city,time);
		return list;
	}

	@Override
	public List<ValueNumber> select_benefit_class1(String Name,String time) {
		List<ValueNumber> list =touziDao.select_benefit_class1(Name,time);
		return list;
	}

	@Override
	public List<ValueNumber> select_benefit_class2(String Name,String time) {
		List<ValueNumber> list =touziDao.select_benefit_class2(Name,time);
		return list;
	}

	@Override
	public List<ValueNumber> select_benefit_class3(String Name,String time) {
		List<ValueNumber> list =touziDao.select_benefit_class3(Name,time);
		return list;
	}

	@Override
	public List<ValueNumber> benifit_cost_class1(String[] benifit, String[] cost,String time) {
		List<ValueNumber> list = touziDao.benifit_cost_class1(benifit, cost,time);
		return list;
	}

	@Override
	public List<ValueNumber> benifit_cost_class2(String[] benifit, String[] cost,String time) {
		List<ValueNumber> list = touziDao.benifit_cost_class2(benifit, cost,time);
		return list;
	}

	@Override
	public List<ValueNumber> benifit_cost_class3(String[] benifit, String[] cost,String time) {
		List<ValueNumber> list = touziDao.benifit_cost_class3(benifit, cost,time);
		return list;
	}

	@Override
	public List<ValueNumber> benifit_cost_select(String[] selectElement,
			String city) {
		List<ValueNumber> list = touziDao.benifit_cost_select(selectElement, city);
		return list;
	}

	/**
	 * 关联分析通用查询
	 */
	@Override
	public List<ValueNumber> benifit_link_cost1(String Name, String time) {
		List<ValueNumber> list = touziDao.benifit_link_cost1(Name, time);
		return list;
	}

	@Override
	public List<ValueNumber> benifit_link_cost2(String Name, String time) {
		List<ValueNumber> list = touziDao.benifit_link_cost2(Name, time);
		return list;
	}

	@Override
	public List<ValueNumber> benifit_link_cost3(String Name, String time) {
		List<ValueNumber> list = touziDao.benifit_link_cost3(Name, time);
		return list;
	}
	

}
