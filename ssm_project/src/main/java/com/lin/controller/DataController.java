package com.lin.controller;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

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
	
	
	/**
	 * 社会效益
	 * @param city
	 * @return
	 */
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
	/**
	 * 企业效益
	 * @param city
	 * @return
	 */
	
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
	
	
	/**
	 * 测试传输多地区数据，传输企业效益数据
	 * @param 城市名称city
	 * @author chenhuan
	 * @return 
	 * @since 2017年7月31日
	 */
	@RequestMapping(value="/contrastQuery_QYXY.do",method= RequestMethod.POST)
	@ResponseBody
	public String contrastQuery_QYXY(long[] city){
		logger.info("请求企业效益数据的城市进入，city{}",city);
		JSONObject json = new JSONObject(); //用于给子层命名
		List<String> cityList = new ArrayList<String>();
		for (long l : city) {
			cityList.add(String.valueOf(l));
		}
		
		try {
				
				for (String s : cityList) {
					
					List<ResultData> list = touziService.selectQYXY(s);
					json.put(s, list);
				}
			
				return responseSuccess(json);
			//返回String 形式的JSON数据
			
			
			
		} catch (Exception e) {
			
			return responseFail(e.getMessage());
		}
	}
	
	/**
	 * 测试传输多地区数据，传输企业效益数据
	 * @param 城市名称city
	 * @author chenhuan
	 * @return 
	 * @since 2017年7月31日
	 */
	@RequestMapping(value="/contrastQuery_SHXY.do",method= RequestMethod.POST)
	@ResponseBody
	public String contrastQuery_SHXY(long[] city){
		logger.info("请求企业效益数据的城市进入，city{}",city);
		JSONObject json = new JSONObject(); //用于给子层命名
		List<String> cityList = new ArrayList<String>();
		for (long l : city) {
			cityList.add(String.valueOf(l));
		}
		
		try {
				
				for (String s : cityList) {
					
					List<ResultData> list = touziService.selectSHXY(s);
					json.put(s, list);
				}
			
				return responseSuccess(json);
			//返回String 形式的JSON数据
			
			
			
		} catch (Exception e) {
			
			return responseFail(e.getMessage());
		}
	}
	
	/**
	 * 运维成本，单地区查询
	 * @param city
	 * @return
	 */
	@RequestMapping(value="/YWCB.do",method= RequestMethod.POST)
	@ResponseBody
	public String ywcbData(String city){
		logger.info("请求运维成本数据的城市进入，city{}",city);
		try {
			List<ResultData> list = touziService.selectYWCB(city);
				//返回String 形式的JSON数据
			return responseArraySuccess(list); 
			
			
		} catch (Exception e) {
			
			return responseFail(e.getMessage());
		}
		
	}
	
	/**
	 * 测试传输多地区数据，传输运维成本数据
	 * @param 城市名称city
	 * @author chenhuan
	 * @return 
	 * @since 2017年7月31日
	 */
	@RequestMapping(value="/contrastQuery_YWCB.do",method= RequestMethod.POST)
	@ResponseBody
	public String contrastQuery_YWCB(long[] city){
		logger.info("请求运维成本数据的城市进入，city{}",city);
		JSONObject json = new JSONObject(); //用于给子层命名
		List<String> cityList = new ArrayList<String>();
		for (long l : city) {
			cityList.add(String.valueOf(l));
		}
		
		try {
				
				for (String s : cityList) {
					
					List<ResultData> list = touziService.selectYWCB(s);
					json.put(s, list);
				}
			
				return responseSuccess(json);
			//返回String 形式的JSON数据
			
			
			
		} catch (Exception e) {
			
			return responseFail(e.getMessage());
		}
	}
	
	
	

}
