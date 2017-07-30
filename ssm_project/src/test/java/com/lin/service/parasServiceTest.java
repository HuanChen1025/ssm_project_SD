package com.lin.service;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.lin.baseTest.SpringTestCase;
import com.lin.dao.ParaDao;
import com.lin.domain.FormulaInfo;
import com.lin.domain.Paras;
import com.lin.util.PagedResult;

/**
 * 功能概要：UserService单元测试
 * 
 * @author linbingwen
 * @since  2015年9月28日 
 */
public class parasServiceTest extends SpringTestCase	{
	@Resource
	private ParasService parasService;
	Logger logger = LoggerFactory.getLogger(parasServiceTest.class);
	
	
//	@Test
//	public void selectFormulaByName() {
//		List<FormulaInfo> list = parasService.selectFormulaByName("遥控效益");
//		logger.debug("查找结果" + list);
//	}
//	
//	@Test
//	public void updataFormulaByName() {
//	FormulaInfo formu= parasService.updataFormulaByName("遥控效益");
//	logger.debug("查找结果" + formu);
//	}
	
	

}
