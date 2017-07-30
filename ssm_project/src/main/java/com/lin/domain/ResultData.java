package com.lin.domain;

public class ResultData {
	private String element_name;
	private String value;
	

	public ResultData() {
	
	}
	
	public ResultData(String element_name, String value) {
		super();
		this.element_name = element_name;
		this.value = value;
	}


	public String getElement_name() {
		return element_name;
	}


	public void setElement_name(String element_name) {
		this.element_name = element_name;
	}


	public String getValue() {
		return value;
	}


	public void setValue(String value) {
		this.value = value;
	}


	@Override
	public String toString() {
		return "通信网数据 [element=" + element_name + ", value=" + value
				+ "]";
	}
	
	


	
	

}
