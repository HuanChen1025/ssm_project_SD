package com.lin.dao;

import java.util.List;


import org.apache.ibatis.annotations.Param;

import com.lin.domain.ResultData;
import com.lin.domain.ValueNumber;

public interface TouziDao {
	
	List<ResultData> selectSHXY(@Param("selectArea") String area ,@Param("selectTime") String time);
	
	List<ResultData> selectQYXY(@Param("selectArea") String area ,@Param("selectTime") String time);
	
	List<ResultData> selectYWCB(@Param("selectArea") String area ,@Param("selectTime") String time);
	//查询类别1效益数据
	List<ValueNumber> select_benefit_class1(@Param("searchName") String Name,@Param("selectTime") String time);
	//查询类别2效益数据
	List<ValueNumber> select_benefit_class2(@Param("searchName") String Name,@Param("selectTime") String time);
	//查询类别3效益数据
	List<ValueNumber> select_benefit_class3(@Param("searchName") String Name,@Param("selectTime") String time);
	
	//查询类别1的投入产出比
	List<ValueNumber> benifit_cost_class1(@Param("benifit")String[] benifit,@Param("cost")String[] cost,@Param("selectTime") String time);
	
	List<ValueNumber> benifit_cost_select(@Param("selectElement")String[] selectElement, @Param("selectArea") String area);
	
	//查询类别2的投入产出比
	List<ValueNumber> benifit_cost_class2(@Param("benifit")String[] benifit,@Param("cost")String[] cost,@Param("selectTime") String time);
		
	//查询类别3的投入产出比
	List<ValueNumber> benifit_cost_class3(@Param("benifit")String[] benifit,@Param("cost")String[] cost,@Param("selectTime") String time);
	
	//查询关联分析按类查询的结果，类别1
	List<ValueNumber> benifit_link_cost1(@Param("selectElement") String element ,@Param("selectTime") String time);
	
	//查询关联分析按类查询的结果，类别1
	List<ValueNumber> benifit_link_cost2(@Param("selectElement") String element ,@Param("selectTime") String time);
		
	//查询关联分析按类查询的结果，类别1
	List<ValueNumber> benifit_link_cost3(@Param("selectElement") String element ,@Param("selectTime") String time);
	

}
