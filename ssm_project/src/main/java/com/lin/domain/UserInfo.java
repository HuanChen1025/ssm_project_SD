package com.lin.domain;

public class UserInfo {
	private String name;//不一定非要这里保持大写，但是这里一定是与数据库中存储的相似的，变量的结构相似，但是大小写形式可以不同，SQL的语法中不区分大小写。
	private String PASSWORD;
	private String IP;
	 private String USERROLE;
	 private String TELEPHONE;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPASSWORD() {
		return PASSWORD;
	}
	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}
	public String getIP() {
		return IP;
	}
	public void setIP(String iP) {
		IP = iP;
	}
	public String getUSERROLE() {
		return USERROLE;
	}
	public void setUSERROLE(String uSERROLE) {
		USERROLE = uSERROLE;
	}
	public String getTELEPHONE() {
		return TELEPHONE;
	}
	public void setTELEPHONE(String tELEPHONE) {
		TELEPHONE = tELEPHONE;
	}
	
	@Override
	public String toString() {
		return "公式信息 [name=" + name + ", PASSWORD=" + PASSWORD + ", IP="
				+ IP + ", USERROLE=" + USERROLE + ", TELEPHONE=" + TELEPHONE
				+ "]";
	}
	
	
	
	

}
