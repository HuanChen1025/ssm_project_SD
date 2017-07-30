package com.lin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lin.domain.ResultData;
import com.lin.domain.UserInfo;



public interface UserDao {
	
	List<UserInfo>  selectUserInfo(); //查找出系统中用户的所有信息，并在首页上展示出来
	

}
