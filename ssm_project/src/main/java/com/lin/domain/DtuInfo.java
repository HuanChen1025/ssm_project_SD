package com.lin.domain;

public class DtuInfo {
	//DTU二遥
	private  String DTU_2;
	private  String DTU_3;
	private  String FTU_2;
	private  String FTU_3;
	public String getDTU_2() {
		return DTU_2;
	}
	public void setDTU_2(String dTU_2) {
		DTU_2 = dTU_2;
	}
	public String getDTU_3() {
		return DTU_3;
	}
	public void setDTU_3(String dTU_3) {
		DTU_3 = dTU_3;
	}
	public String getFTU_2() {
		return FTU_2;
	}
	public void setFTU_2(String fTU_2) {
		FTU_2 = fTU_2;
	}
	public String getFTU_3() {
		return FTU_3;
	}
	public void setFTU_3(String fTU_3) {
		FTU_3 = fTU_3;
	}
	@Override
	public String toString() {
		return "DtuInfo [DTU_2=" + DTU_2 + ", DTU_3=" + DTU_3 + ", FTU_2="
				+ FTU_2 + ", FTU_3=" + FTU_3 + "]";
	}
	

}
