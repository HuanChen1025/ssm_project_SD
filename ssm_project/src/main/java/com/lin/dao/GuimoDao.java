package com.lin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lin.domain.DtuInfo;
import com.lin.domain.ResultData;



public interface GuimoDao {
	
List<DtuInfo>  selectDFtu(@Param("selectArea") String area,@Param("selectTime")String time); //采用@Param的参数传递方式会更加直接，但是其中的jdbdType仍然值得研究，并不是很明白

//查询通信网的数据selectTime
List<ResultData> selectTXW(@Param("selectArea") String area,@Param("selectTime") String time);

//查询配电自动化系统的数据
List<ResultData> selectPDZDHXT(@Param("selectArea") String area ,@Param("selectTime") String time);

//查询一次设备改造数据
List<ResultData> selectYCSBGZ(@Param("selectArea") String area ,@Param("selectTime") String time);

//查询线路数据
List<ResultData> selectXL(@Param("selectArea") String area ,@Param("selectTime") String time);


}
