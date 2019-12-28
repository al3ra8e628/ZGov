package com.hu.gov.business;

public class Person {

	
	private Long personId ; 
	private String firstName ; 
	private String midName ; 
	private String lastName ; 
	private String birthDate ; 
	private String address ;
	private String phoneNumber ;
	
	public Person(){
		
	}
	
	public Person(Long personId, String firstName, String midName, String lastName, String birthDate, String adress,
			String phoneNumber) {
		super();
		this.personId = personId;
		this.firstName = firstName;
		this.midName = midName;
		this.lastName = lastName;
		this.birthDate = birthDate;
		this.address = adress;
		this.phoneNumber = phoneNumber;
	}

	
	
	
	public Long getPersonId() {
		return personId;
	}

	public void setPersonId(Long personId) {
		this.personId = personId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMidName() {
		return midName;
	}

	public void setMidName(String midName) {
		this.midName = midName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	} 
}
