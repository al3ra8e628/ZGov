package com.hu.gov.business;

public class Employee extends Person{

	
	private int employee_id ; 
	
	private int department_id ; 
	private String jobTitle ;
	
	public Employee(){
	
	}

	public Employee(int employee_id, int person_id, int department_id, String jobTitle) {
	
		this.employee_id = employee_id;
		
		this.department_id = department_id;
		this.jobTitle = jobTitle;
	
	}

	public int getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}

	

	public int getDepartment_id() {
		return department_id;
	}

	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	} 
	
	
}
