package com.lin.service;

import java.util.List;
import com.lin.domain.DtuInfo;
import com.lin.domain.ResultData;



public interface GuimoService {
	
	/**
	 * 
	 * @param area
	 * @param time
	 * @return DTU、FTU的信息
	 */
	 List<DtuInfo> selectDFtu(String area,String time) ;	
	 /**
	  * 
	  * @param city
	  * @return 通信网数据
	  * @author chenhuan
	  */
	 List<ResultData> selectTXW( String city,String time);
	 /**
	  * 
	  * @param city
	  * @return 配电自动化系统数据
	  * @author chenhuan
	  */
	 List<ResultData> selectPDZDHXT(String city);
	 /**
	  * 
	  * @param city
	  * @return 一次设备改造数据
	  * @author chenhuan
	  */
	 List<ResultData> selectYCSBGZ(String city);
	 /**
	  * 
	  * @param city
	  * @return 线路数据
	  * @author chenhuan
	  */
	 List<ResultData> selectXL(String city);
}
