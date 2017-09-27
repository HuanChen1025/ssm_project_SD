package com.lin.service;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.lin.baseTest.SpringTestCase;
import com.lin.dao.GuimoDao;
import com.lin.domain.DtuInfo;
import com.lin.domain.ResultData;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:application.xml"})

public class GuimoServiceTest extends SpringTestCase{
	@Resource
	private GuimoService guimoservice;
	Logger logger = LoggerFactory.getLogger(GuimoServiceTest.class);

	
	
//	@Test
//	public void selectDFtu() {
//		 List<DtuInfo> list = guimoservice.selectDFtu("3740101","2016");
//		 logger.debug("查找结果" + list);
//		
//	}
	@Test
	public void selectD() {
		 System.out.println(1);
		
	}
	
//	
//	
//	//建设规模之通信网
//	@Test
//	public void selectTXW() {
//		
//		List<TXW> list = guimoservice.selectTXW("37401");
//		
//		 logger.debug("查找结果" + list);
//	}
	
}
