package com.hu.gov.business;

public class Process {
	private int department_id;
	private int process_num;
	private String process_name;
	
	
	
	public Process(){}
	
	
	public Process(int deparmtenet_id , int process_num , String process_name){
		super();
		this.department_id = deparmtenet_id;
		this.process_num = process_num;
		this.process_name  = process_name;
	}


	public int getDepartment_id() {
		return department_id;
	}


	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}


	public int getProcess_num() {
		return process_num;
	}


	public void setProcess_num(int process_num) {
		this.process_num = process_num;
	}


	public String getProcess_name() {
		return process_name;
	}


	public void setProcess_name(String process_name) {
		this.process_name = process_name;
	}
	
	
	

}
