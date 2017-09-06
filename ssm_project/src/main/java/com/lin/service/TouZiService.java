package com.lin.service;

import java.util.List;

import org.jfree.data.Value;

import com.lin.domain.ResultData;
import com.lin.domain.ValueNumber;

public interface TouZiService {
	
	 List<ResultData> selectSHXY(String city);
	 
	 List<ResultData> selectQYXY(String city);
	 
	 List<ResultData> selectYWCB(String city);
	 
	 //类别1的效益数据查询
	 List<ValueNumber> select_benefit_class1(String Name);
	//类别2的效益数据查询
	 List<ValueNumber> select_benefit_class2(String Name);
	//类别3的效益数据查询
	 List<ValueNumber> select_benefit_class3(String Name);
	 
	 //类别1的投入产出比
	 List<ValueNumber> benifit_cost_class1(String[] benifit,String[] cost);
	 //类别1显示的柱状图
	 List<ValueNumber> benifit_cost_select(String[] selectElement,String city);
	 
	 List<ValueNumber> benifit_cost_class2(String[] benifit,String[] cost);
	 
	 List<ValueNumber> benifit_cost_class3(String[] benifit,String[] cost);

}
