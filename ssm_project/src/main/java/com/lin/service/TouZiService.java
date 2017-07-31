package com.lin.service;

import java.util.List;

import com.lin.domain.ResultData;

public interface TouZiService {
	
	 List<ResultData> selectSHXY(String city);
	 
	 List<ResultData> selectQYXY(String city);
	 
	 List<ResultData> selectYWCB(String city);

}
