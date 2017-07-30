package com.lin.service;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import com.lin.baseTest.SpringTestCase;
import com.lin.domain.UserInfo;

public class UserServiceTest extends SpringTestCase {
	@Resource
	private UserService userService;
	Logger logger = LoggerFactory.getLogger(UserServiceTest.class);
	
	
	
	
//	@Test
//	public void selectUserInfo() {
//		List<UserInfo> list = userService.selectUserInfo();
//		logger.debug("查找结果" + list);
//	
//	}
	

}
