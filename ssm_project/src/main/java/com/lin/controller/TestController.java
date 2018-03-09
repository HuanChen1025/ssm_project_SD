package com.lin.controller;

import java.util.Date;
import javax.annotation.Resource;
import com.lin.common.HttpConstants;
import com.lin.json.JsonDateValueProcessor;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.lin.service.GuimoService;

/**
 * 测试使用，无实际意义
 * @author 
 *
 */

public class TestController  {


	public static void main(String[] args) {
		
		
		
		
	}

}

	/**
	 * 功能： 将查询出来的数据封装成json数据，并且json数据由两层组成
	 * @author 
	 * @since 2017年7 月 20日
	 * 
	 */
	class test{
	
	@Resource
	private GuimoService guimoService;
	
    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    
    protected final static String DATE_FORMATE = "yyyy-MM-dd";
    
	
	/**
	 * 返回成功
	 * @param obj 输出对象
	 * @return 输出成功的JSON格式数据
	 */
	public String responseSuccess(Object obj){
		JSONObject jsonObj = null;
		if(obj != null){
		    logger.info("后端返回对象：{}", obj);
		    JsonConfig jsonConfig = new JsonConfig(); 
		    jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		    jsonObj = JSONObject.fromObject(obj, jsonConfig);
		    logger.info("后端返回数据：" + jsonObj);
		    jsonObj.element(HttpConstants.RESPONSE_RESULT_FLAG_ISERROR, false);
		    jsonObj.element(HttpConstants.SERVICE_RESPONSE_RESULT_MSG, "");
		}
		logger.info("输出结果：{}", jsonObj.toString());
		return jsonObj.toString();
		
	}
	
}
