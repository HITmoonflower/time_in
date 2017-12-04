package model;

import java.util.Map;

public class PDOModel {
	private int pdoID;
	private int userID;
	private String name;
	private Map<String, String> infoMap;
	public PDOModel() {
	}
	public int getPdoID() {
		return pdoID;
	}
	public void setPdoID(int pdoID) {
		this.pdoID = pdoID;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public Map<String, String> getInfoMap() {
		return infoMap;
	}
	public void setInfoMap(Map<String, String> infoMap) {
		this.infoMap = infoMap;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
