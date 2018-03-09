package com.lin.controller;

import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.lin.domain.FormulaInfo;
import com.lin.service.ParasService;
import com.lin.util.PagedResult;

/**
 * 功能概要：UserController
 * @author 
 * @since  2017年7月10日 
 */
@Controller 
@RequestMapping("/user")
public class UserController extends BaseController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private ParasService  parasService;
	
	
	/**
	 * 显示首页
	 * @author 
	 * @since  2017年7月10日 
	 * @return
	 */
	@RequestMapping(value="/main")
	public String main(){
		return "mainView/main";
	}
	
	/**
	 *  显示规模数据的多地区查询界面
	 *  @since 2017年7月10日 
	 * @return
	 */
	@RequestMapping(value="/chart")
	public String chart(){
		
		return "Echart/chart";
	}
	
	/**
	 *  显示单地区的规模数据查询
	 *  @since 2017年7月10日 
	 * @return
	 */
		@RequestMapping(value="/echart")
		public String echart(){
			
			return "Echart/echart";
		}
	
	
		/**
		 *  显示山东地图，用于做评分
		 *  @since 2017年7月10日 
		 * @return
		 */
	@RequestMapping(value="/map")
	public String map(){
		
		return "Echart/map";
	}
	
	/**
	 *  显示山东效益指标的计算公式界面
	 *  @since 2017年7月10日 
	 * @return
	 */
	@RequestMapping("/bootstrapTest1")
	public String bootStrapTest1(){
		return "bootstrap/bootstrapTest1";
	}
	
	/**
	 *  显示效益数据的界面
	 *  @since 2017年7月24日 
	 * @return
	 */
	@RequestMapping("/xiaoyi")
	public String touziANDxiaoyo(){
		return "Echart/xiaoyi";
	}
	/**
	 *  显示建设模式可视化
	 *  @since 2017年7月24日 
	 * @return
	 */
	@RequestMapping("/image")
	public String image(){
		return "Echart/image";
	}
	
	/**
	 *  显示效益数据对比查询
	 *  @since 2017年7月24日 
	 * @return
	 */
	@RequestMapping("/xiaoyiContract")
	public String xiaoyiContract(){
		return "Echart/xiaoyiContract";
	}
	
	
	/**
	 *  显示运维成本数据的单地区查询
	 *  @since 2017年7月24日 
	 * @return
	 */
	@RequestMapping("/Yunwei")
	public String Yunwei(){
		return "Echart/Yunwei";
	}
	
	/**
	 *  显示运维成本数据对比查询
	 *  @since 2017年7月24日 
	 * @return
	 */
	@RequestMapping("/YunweiContract")
	public String YunweiContract(){
		return "Echart/YunweiContract";
	}
	//JsmsLine
	/**
	 *  显示运维成本数据对比查询
	 *  @since 2017年7月24日 
	 * @return
	 */
	@RequestMapping("/JsmsLine")
	public String JsmsLine(){
		return "Echart/JsmsLine";
	}
	//TrcbLine
	/**
	 *  显示运维成本数据对比查询
	 *  @since 2017年7月24日 
	 * @return
	 */
	@RequestMapping("/TrcbLine")
	public String TrcbLine(){
		return "Echart/TrcbLine";
	}
	
	
    /**
     * 分页查询公式信息
     * @author 
     * @since  2015年10月23日 
     * @param page
     * @return
     */
    @RequestMapping(value="/list.do", method= RequestMethod.POST)
    @ResponseBody
    public String list(Integer pageNumber,Integer pageSize ,String userName) {
		logger.info("分页查询用户信息列表请求入参：pageNumber{},pageSize{}", pageNumber,pageSize);
		try {
			//PagedResult<User> pageResult = userService.queryByPage(userName, pageNumber,pageSize);
			PagedResult<FormulaInfo> pageResult = parasService.queryFormulaByPage(userName, pageNumber, pageSize);
    	    return responseSuccess(pageResult); //返回的是JSON对象
    	} catch (Exception e) {
			return responseFail(e.getMessage());
		}
    }
    
    /**
	 *  显示公式修改的弹出层界面。这里没有做完和做好，在后期需要完全重构，采用其他的插件弹出
	 *  @since 2017年7月10日 
	 * @return
	 */
    @RequestMapping(value="/update.do",method=RequestMethod.POST)
    @ResponseBody
    public String updataList(String name){
    	//logger.info("分页查询用户信息列表请求入参：pageNumber{},pageSize{}", pageNumber,pageSize);
		try {
			//PagedResult<User> pageResult = userService.queryByPage(userName, pageNumber,pageSize);
			FormulaInfo formu = parasService.updataFormulaByName(name);
    	    return responseSuccess(formu); //返回的是JSON对象
    	} catch (Exception e) {
			return responseFail(e.getMessage());
		}
    	
    	
    }
    
    /**
	 *  显示运维成本数据对比查询
	 *  @since 2017年7月24日 
	 * @return
	 */
	@RequestMapping("/compute")
	public String compute(){
		return "Echart/compute";
	}
	
    /**
	 *  显示关联分析部分的查询
	 *  @since 2017年7月24日 
	 * @return
	 */
	@RequestMapping("/link_TRCCB")
	public String link_TRCCB(){
		return "Echart/link_TRCCB";
	}
    

}
