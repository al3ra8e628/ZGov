package com.hu.gov.commands;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class CommandBase {
	
	
	protected final String OPEN_ANGULER_PRACET = "<";
	protected final String CLOSE_ANGULER_PRACET = ">";
	protected final String TABLE_START_TAG = "<table DIR='RTL'>";
	protected final String TABLE_END_TAG = "</table>";
	protected final String TABLE_ROW_START_TAG = "<tr>";
	protected final String TABLE_ROW_END_TAG = "</tr>";
	protected final String TABLE_DATA_START_TAG = "<td>";
	protected final String TABLE_DATA_END_TAG = "</td>";
	protected final String TABLE_HEAD_START_TAG = "<th>";
	protected final String TABLE_HEAD_END_TAG = "</th>";
	protected final String NEW_DOCUMENT_BTN = "<input type='submit' value='اضافة جديد'/>";
	protected final String HIDDEN_INPUT_START_TAG = "<input type='hidden'";
	protected final String FORM_START_TAG = "<form action=\"GovSystem\" method=\"post\">";
	protected final String FORM_END_TAG = "</form>";
	protected final String A_START_TAG = "<a href=\"";
	protected final String A_END_TAG = "</a>";
	protected final String OPEN_ICON_TAG = "<img alt='open' src='./photos/open.png' class='open-icon'/>";
	protected final String DELETE_ICON_TAG = "";
	
	protected final String HEAD_START_TAG = "<head>";
	protected final String HEAD_END_TAG = "</head>";
	protected final String DIV_END_TAG = "</div>";
	protected final String DIV_START_TAG = "<div>";
	protected final String BODY_START_TAG = "<body>";
	protected final String BODY_END_TAG = "</body>";
	
	protected final String LINK_STYLE_TAG = "<link rel='stylesheet' href='./bootstrap_libraries/css/open_application_style.css'/>";
	
	protected final String LINK_JS_TAG = "<script src='./bootstrap_libraries/js/delete_doc_fun.js'></script>";
	protected final String LINK_JQUERY_TAG = "<script src='./bootstrap_libraries/js/jquery-3.2.1.js'></script>";
	
	protected final String META_TAG = "<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />";
		
	

	public abstract void execute(HttpServletRequest request, HttpServletResponse response) throws IOException;
}
