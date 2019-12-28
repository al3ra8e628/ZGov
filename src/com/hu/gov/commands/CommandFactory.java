package com.hu.gov.commands;

import java.util.HashMap;
import java.util.Map;

import com.hu.gov.commands.adminCommands.AddCivilDepartment;
import com.hu.gov.commands.adminCommands.AddDepartment;
import com.hu.gov.commands.adminCommands.AddEmployee;
import com.hu.gov.commands.adminCommands.AddHealthDepartment;
import com.hu.gov.commands.adminCommands.AddMunicipal;
import com.hu.gov.commands.adminCommands.AddPerson;
import com.hu.gov.commands.adminCommands.AddPoliceDepartment;
import com.hu.gov.commands.adminCommands.AddPrivilege;
import com.hu.gov.commands.adminCommands.AddUser;
import com.hu.gov.commands.adminCommands.GetDepartmentById;
import com.hu.gov.commands.adminCommands.GetPersonById;
import com.hu.gov.commands.adminCommands.GetUserById;
import com.hu.gov.commands.adminCommands.RemovePrivilege;
import com.hu.gov.commands.AddProcess;

public class CommandFactory {
	
	@SuppressWarnings("rawtypes")
	private static Map<String, Class> commands = new HashMap<>();
	@SuppressWarnings("rawtypes")
	public static Map<String, Class> getCommands() {
		return commands;
	}
	public static void init() {
		commands.put("OPEN_APPLICATION", OpenApplication.class);
		commands.put("LOG_IN", Login.class);
		commands.put("GET_PERSON_BY_ID", GetPersonById.class);
		commands.put("GET_DEPARTMENT_BY_ID", GetDepartmentById.class);
		commands.put("ADD_PERSON", AddPerson.class);
		commands.put("ADD_EMPLOYEE", AddEmployee.class);
		commands.put("ADD_USER", AddUser.class);
		commands.put("ADD_DEPARTMENT", AddDepartment.class);
		commands.put("ADD_PRIVILEGE", AddPrivilege.class);
		commands.put("REMOVE_PRIVILEGE", RemovePrivilege.class);
		commands.put("ADD_MUNICIPAL", AddMunicipal.class);
		commands.put("GET_USER_BY_ID", GetUserById.class);
		commands.put("ADD_POLICE_DEPARTMENT", AddPoliceDepartment.class);
		commands.put("ADD_CIVIL_DEPARTMENTS", AddCivilDepartment.class);
		commands.put("ADD_HEALTH_DEPARTMENT", AddHealthDepartment.class);
		commands.put("SAVE_DOCUMENT", SaveDocument.class);
		commands.put("OPEN_FILE",OpenFile.class);
		commands.put("OPEN_LOGIN",OpenLogin.class);
		commands.put("ADD_PROCESS", AddProcess.class);
		commands.put("OPEN_DOCUMENT", OpenDocument.class);
		commands.put("DELETE_DOCUMENT", DeleteProcess.class);
		
	}

}
