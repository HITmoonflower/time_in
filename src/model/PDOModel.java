package model;

import java.util.Map;

public class PDOModel {
	private int pdoID;
	private int userID;
	private Map<String, String> infoMap;
	public PDOModel() {
	}
	public int getpdoID() {
		return pdoID;
	}
	public void setpdoID(int pdoID) {
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
}
