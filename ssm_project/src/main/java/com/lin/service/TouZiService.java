package com.lin.service;

import java.util.List;

import com.lin.domain.ResultData;
import com.lin.domain.ValueNumber;


public interface TouZiService {
	
	 List<ResultData> selectSHXY(String city,String time);
	 
	 List<ResultData> selectQYXY(String city,String time);
	 
	 List<ResultData> selectYWCB(String city,String time);
	 
	 //类别1的效益数据查询
	 List<ValueNumber> select_benefit_class1(String Name,String time);
	//类别2的效益数据查询
	 List<ValueNumber> select_benefit_class2(String Name,String time);
	//类别3的效益数据查询
	 List<ValueNumber> select_benefit_class3(String Name,String time);
	 
	 //类别1的投入产出比
	 List<ValueNumber> benifit_cost_class1(String[] benifit,String[] cost,String time);
	 //类别1显示的柱状图
	 List<ValueNumber> benifit_cost_select(String[] selectElement,String city);
	 
	 List<ValueNumber> benifit_cost_class2(String[] benifit,String[] cost,String time);
	 
	 List<ValueNumber> benifit_cost_class3(String[] benifit,String[] cost,String time);
	 
	 //关联分析通用查询，类别1
	 List<ValueNumber> benifit_link_cost1(String Name,String time);
	 //关联分析通用查询，类别2
	 List<ValueNumber> benifit_link_cost2(String Name,String time);
	 //关联分析通用查询，类别3
	 List<ValueNumber> benifit_link_cost3(String Name,String time);
}
