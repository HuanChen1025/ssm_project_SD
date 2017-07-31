package com.lin.dao;

import java.util.List;


import org.apache.ibatis.annotations.Param;

import com.lin.domain.ResultData;

public interface TouziDao {
	
	List<ResultData> selectSHXY(@Param("selectArea") String area);
	
	List<ResultData> selectQYXY(@Param("selectArea") String area);
	
	List<ResultData> selectYWCB(@Param("selectArea") String area);

}
