package com.lin.controller;


import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lin.domain.ResultData;
import com.lin.service.GuimoService;
import com.lin.service.TouZiService;
import com.lin.service.UserService;



@Controller
@RequestMapping("/user")  
public class DataController extends BaseController {
	@Resource
	private TouZiService touziService;
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	
	
	@RequestMapping(value="/SHXY.do",method= RequestMethod.POST)
	@ResponseBody
	public String touZiData_SHXY(String city){
		logger.info("请求社会效益数据的城市进入，city{}",city);
		try {
			List<ResultData> list = touziService.selectSHXY(city);
				//返回String 形式的JSON数据
			return responseArraySuccess(list); 
			
			
		} catch (Exception e) {
			
			return responseFail(e.getMessage());
		}
		
	}
	
	@RequestMapping(value="/QYXY.do",method= RequestMethod.POST)
	@ResponseBody
	public String touZiData_QYXY(String city){
		logger.info("请求企业效益数据的城市进入，city{}",city);
		try {
			List<ResultData> list = touziService.selectQYXY(city);
				//返回String 形式的JSON数据
			return responseArraySuccess(list); 
			
			
		} catch (Exception e) {
			
			return responseFail(e.getMessage());
		}
		
	}
	
	

}
