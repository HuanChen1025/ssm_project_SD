package com.lin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import net.sf.json.JSONObject;

import com.lin.domain.ValueNumber;
import com.lin.service.TouZiService;

public class ceshi {
	

	
	public static void main(String[] args) {
		System.out.println("hello");
		String[] str = {"工业拉升效益"};
		learn l = new learn();
		l.benefit_data_class1(str);
		
	}
	

}

class learn{
	
	@Resource
	private TouZiService touziService;
	private Logger logger = LoggerFactory.getLogger(getClass());
	public  String benefit_data_class1(String[] Name){
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
		
			System.out.println(List);
			//return responseSuccess(json);
		//返回String 形式的JSON数据
		
		
		
	} catch (Exception e) {
		
		return null;
		//return responseFail(e.getMessage());
	}
		return null;
		
		
	}
	
	
	
}
