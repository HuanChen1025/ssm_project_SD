package com.lin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lin.dao.UserDao;
import com.lin.domain.UserInfo;

@Service
public class UserServiceImpl implements UserService {
	@Resource
	private UserDao userDao;
	
	
	@Override
	public List<UserInfo> selectUserInfo() {
		List<UserInfo> list = userDao.selectUserInfo();
	
		return list;
	}

}
