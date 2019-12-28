package com.hu.gov.business;

public class Department {

	
	 private int departmentId ; 
	 private String departmentName ; 
	 private String departmentAddress ;
	 private int maxNumOfProcess;
	 
	 public Department() {

	 }

	public Department(int departmentId, String departmentName, String departmentAddress, int maxNumOfProcess) {
		super();
		this.departmentId = departmentId;
		this.departmentName = departmentName;
		this.departmentAddress = departmentAddress;
		this.maxNumOfProcess = maxNumOfProcess;
	}

	public int getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getDepartmentAddress() {
		return departmentAddress;
	}

	public void setDepartmentAddress(String departmentAddress) {
		this.departmentAddress = departmentAddress;
	}

	public int getMaxNumOfProcess() {
		return maxNumOfProcess;
	}

	public void setMaxNumOfProcess(int maxNumOfProcess) {
		this.maxNumOfProcess = maxNumOfProcess;
	}


	
}
