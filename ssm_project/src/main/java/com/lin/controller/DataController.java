package com.lin.controller;


import java.util.ArrayList;
import java.util.LinkedList;
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
import com.lin.domain.ValueNumber;
import com.lin.service.GuimoService;
import com.lin.service.TouZiService;
import com.lin.service.UserService;

//select * from T_CXFX_MAIN_CQU t where element_name='工业拉升效益' and t.orgno in('37402','37403','37407','37406','37413')

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
	
	
	@RequestMapping(value="/benifit_data_class1.do",method= RequestMethod.POST)
	@ResponseBody
	public String benefit_data_class1(String[] Name){
		logger.info("请求查询效益的数据进入，name{}",Name);
		JSONObject json = new JSONObject(); //用于给子层命名
		List<String> List = new ArrayList<String>();
		for (String l : Name) {
			List.add(l);
			
		}
		try {
			
			for (String s : List) {
				
				List<ValueNumber> list = touziService.select_benefit_class1(s);
				json.put(s, list);
			}
		
			return responseSuccess(json);
		//返回String 形式的JSON数据
		
		
		
	} catch (Exception e) {
		
		return responseFail(e.getMessage());
	}
		
		
	}
	
	
	@RequestMapping(value="/benifit_data_class2.do",method= RequestMethod.POST)
	@ResponseBody
	public String benefit_data_class2(String[] Name){
		logger.info("请求查询效益的数据进入，name{}",Name);
		JSONObject json = new JSONObject(); //用于给子层命名
		List<String> List = new ArrayList<String>();
		for (String l : Name) {
			List.add(l);
			
		}
		try {
			
			for (String s : List) {
				
				List<ValueNumber> list = touziService.select_benefit_class2(s);
				json.put(s, list);
			}
		
			return responseSuccess(json);
		//返回String 形式的JSON数据
		
		
		
	} catch (Exception e) {
		
		return responseFail(e.getMessage());
	}
		
		
	}
	
	
	@RequestMapping(value="/benifit_data_class3.do",method= RequestMethod.POST)
	@ResponseBody
	public String benefit_data_class3(String[] Name){
		logger.info("请求查询效益的数据进入，name{}",Name);
		JSONObject json = new JSONObject(); //用于给子层命名
		List<String> List = new ArrayList<String>();
		for (String l : Name) {
			List.add(l);
			
		}
		try {
			
			for (String s : List) {
				
				List<ValueNumber> list = touziService.select_benefit_class3(s);
				json.put(s, list);
			}
		
			return responseSuccess(json);
		//返回String 形式的JSON数据
		
		
		
	} catch (Exception e) {
		
		return responseFail(e.getMessage());
	}
		
		
	}
	
	/**
	 * 类别1投入产出比，输出json数据流
	 * @param benefitName
	 * @param costName
	 * @return json
	 */
	@RequestMapping(value="/benifit_cost_class1.do",method= RequestMethod.POST)
	@ResponseBody
	public String benefit_cost_class1(String[] benefitName,String[] costName){
		logger.info("请求查询效益的数据进入，name{}",benefitName);
		logger.info("请求查询成本的数据进入，costName{}",costName);
		JSONObject json = new JSONObject(); //用于给子层命名
		try {
			
				List<ValueNumber> list = touziService.benifit_cost_class1(benefitName, costName);
			    json.put("classData", list);


		
			    return responseSuccess(json);	
	} catch (Exception e) {
		
		return responseFail(e.getMessage());
	}
		
		
	}
	
	/**
	 * 类别1投入产出值，输出json数据流
	 * @param benefitName
	 * @param costName
	 * @return json
	 */
	@RequestMapping(value="/benifit_cost_select.do",method= RequestMethod.POST)
	@ResponseBody
	public String benefit_cost_select(String[] searchName){
		logger.info("请求查询效益的数据进入，name{}",searchName);
		JSONObject json = new JSONObject(); //用于给子层命名
		try {
			   List<String> orgno = new LinkedList<String>();
			   orgno.add("37402");
			   orgno.add("37403");
			   orgno.add("37407");
			   orgno.add("37406");
			   orgno.add("37413");
			   for (String s : orgno) {
					List<ValueNumber> list = touziService.benifit_cost_select(searchName, s);
					json.put("s", list);
			}
		
			    return responseSuccess(json);	
	} catch (Exception e) {
		
		return responseFail(e.getMessage());
	}
		
		
	}
	
	
	/**
	 * 类别2投入产出比，输出json数据流
	 * @param benefitName
	 * @param costName
	 * @return json
	 */
	@RequestMapping(value="/benifit_cost_class2.do",method= RequestMethod.POST)
	@ResponseBody
	public String benefit_cost_class2(String[] benefitName,String[] costName){
		logger.info("请求查询效益的数据进入，name{}",benefitName);
		logger.info("请求查询成本的数据进入，costName{}",costName);
		JSONObject json = new JSONObject(); //用于给子层命名
		try {
			
				List<ValueNumber> list = touziService.benifit_cost_class2(benefitName, costName);
			    json.put("classData", list);


		
			    return responseSuccess(json);	
	} catch (Exception e) {
		
		return responseFail(e.getMessage());
	}
		
		
	}
	
	/**
	 * 类别3投入产出比，输出json数据流
	 * @param benefitName
	 * @param costName
	 * @return json
	 */
	@RequestMapping(value="/benifit_cost_class3.do",method= RequestMethod.POST)
	@ResponseBody
	public String benefit_cost_class3(String[] benefitName,String[] costName){
		logger.info("请求查询效益的数据进入，name{}",benefitName);
		logger.info("请求查询成本的数据进入，costName{}",costName);
		JSONObject json = new JSONObject(); //用于给子层命名
		try {
			
				List<ValueNumber> list = touziService.benifit_cost_class3(benefitName, costName);
			    json.put("classData", list);


		
			    return responseSuccess(json);	
	} catch (Exception e) {
		
		return responseFail(e.getMessage());
	}
		
		
	}
	
	
	
	
	
	
	
	
	

}
