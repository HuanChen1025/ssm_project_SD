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

/**
 * 功能概要：ChartController
 * @author chenhuan
 * @since 2017年 7月 15日
 *
 */

@Controller
@RequestMapping("/user") 
public class ChartController  extends BaseController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	@Resource
	private GuimoService guimoService;
	
		
	/**
	 * 测试传输多地区数据，通信网数据
	 * @param 城市名称city
	 * @author chenhuan
	 * @return 
	 * @since 2017年7月20日
	 */
	@RequestMapping(value="/contrastQuery1.do",method= RequestMethod.POST)
	@ResponseBody
	public String contrastQuery1(long[] city){
		logger.info("请求通信网数据的城市进入，city{}",city);
		JSONObject json = new JSONObject(); //用于给子层命名
		List<String> cityList = new ArrayList<String>();
		for (long l : city) {
			cityList.add(String.valueOf(l));
		}
		
		try {
				
				for (String s : cityList) {
					
					List<ResultData> list = guimoService.selectTXW(s);
					json.put(s, list);
				}
			
				return responseSuccess(json);
			//返回String 形式的JSON数据
			
			
			
		} catch (Exception e) {
			
			return responseFail(e.getMessage());
		}
		
	}
	
	/**
	 * 测试传输多地区数据，配电自动化系统的数据
	 * @param 城市名称city
	 * @author chenhuan
	 * @return 
	 * @since 2017年7月24日
	 */
	@RequestMapping(value="/contrastQuery2.do",method= RequestMethod.POST)
	@ResponseBody
	public String contrastQuery2(long[] city){
		logger.info("请求通信网数据的城市进入，city{}",city);
		JSONObject json = new JSONObject(); //用于给子层命名
		List<String> cityList = new ArrayList<String>();
		for (long l : city) {
			cityList.add(String.valueOf(l));
		}
		
		try {
				
				for (String s : cityList) {
					
					List<ResultData> list = guimoService.selectPDZDHXT(s);
					json.put(s, list);
				}
			
				return responseSuccess(json);
			//返回String 形式的JSON数据
			
			
			
		} catch (Exception e) {
			
			return responseFail(e.getMessage());
		}
	}
	
	/**
	 * 测试传输多地区数据，一次设备改造的数据
	 * @param 城市名称city
	 * @author chenhuan
	 * @return 
	 * @since 2017年7月24日
	 */
	@RequestMapping(value="/contrastQuery3.do",method= RequestMethod.POST)
	@ResponseBody
	public String contrastQuery3(long[] city){
		logger.info("请求通信网数据的城市进入，city{}",city);
		JSONObject json = new JSONObject(); //用于给子层命名
		List<String> cityList = new ArrayList<String>();
		for (long l : city) {
			cityList.add(String.valueOf(l));
		}
		
		try {
				
				for (String s : cityList) {
					
					List<ResultData> list = guimoService.selectYCSBGZ(s);
					json.put(s, list);
				}
			
				return responseSuccess(json);
			//返回String 形式的JSON数据
			
			
			
		} catch (Exception e) {
			
			return responseFail(e.getMessage());
		}
		
	}
	
	/**
	 * 测试传输多地区数据，线路数据
	 * @param 城市名称city
	 * @author chenhuan
	 * @return 
	 * @since 2017年7月24日
	 */
	@RequestMapping(value="/contrastQuery4.do",method= RequestMethod.POST)
	@ResponseBody
	public String contrastQuery4(long[] city){
		logger.info("请求通信网数据的城市进入，city{}",city);
		JSONObject json = new JSONObject(); //用于给子层命名
		List<String> cityList = new ArrayList<String>();
		for (long l : city) {
			cityList.add(String.valueOf(l));
		}
		
		try {
				
				for (String s : cityList) {
					
					List<ResultData> list = guimoService.selectXL(s);
					json.put(s, list);
				}
			
				return responseSuccess(json);
			//返回String 形式的JSON数据
			
			
			
		} catch (Exception e) {
			
			return responseFail(e.getMessage());
		}
		
	}
	
	

	/**
	 * 单地区查询 通信网数据
	 * @param city
	 * @return
	 * @author chenhuan
	 * @since 2017年7月18日
	 */
	@RequestMapping(value="/chart1.do",method= RequestMethod.POST)
	@ResponseBody
	public String chart1(String city){
		logger.info("请求通信网数据的城市进入，city{}",city);
		
		try {
			List<ResultData> list = guimoService.selectTXW(city);
				//返回String 形式的JSON数据
			return responseArraySuccess(list); 
			
			
		} catch (Exception e) {
			
			return responseFail(e.getMessage());
		}
		
	}
	
	
	/**
	 * 单地区查询  配电自动化系统数据
	 * @author chenhuan
	 * @since 2017年7月18日
	 * @param city
	 * @return
	 */
	@RequestMapping(value="/chart2.do",method= RequestMethod.POST)
	@ResponseBody
	public String chart2(String city){
		logger.info("请求配电自动化系统数据的城市进入，city{}",city);
		
		try {
			List<ResultData> list = guimoService.selectPDZDHXT(city);
				//返回String 形式的JSON数据
			return responseArraySuccess(list); 
			
			
		} catch (Exception e) {
			
			return responseFail(e.getMessage());
		}
		
	}
	
	
	/**
	 * 单地区查询 一次设备改造数据
	 * @author chenhuan
	 * @since 2017年7月18日
	 * @param city
	 * @return
	 */
	@RequestMapping(value="/chart3.do",method= RequestMethod.POST)
	@ResponseBody
	public String chart3(String city){
		logger.info("请求一次设备改造数据的城市进入，city{}",city);
		
		try {
			List<ResultData> list = guimoService.selectYCSBGZ(city);
				//返回String 形式的JSON数据
			return responseArraySuccess(list); 
			
			
		} catch (Exception e) {
			
			return responseFail(e.getMessage());
		}
		
	}
	
	
	/**
	 * 单地区查询 线路数据
	 * @author chenhuan
	 * @since 2017年7月18日
	 * @param city
	 * @return
	 */
	@RequestMapping(value="/chart4.do",method= RequestMethod.POST)
	@ResponseBody
	public String chart4(String city){
		logger.info("请求线路数据的城市进入，city{}",city);
		
		
		try {
			List<ResultData> list = guimoService.selectXL(city);
				//返回String 形式的JSON数据
			return responseArraySuccess(list); 
			
			
		} catch (Exception e) {
			
			return responseFail(e.getMessage());
		}
		
	}
	
	
}
