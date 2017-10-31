package action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.DataOperation;

import com.opensymphony.xwork2.ActionSupport;

public class PDO extends ActionSupport {
  private String userID;
  private String pdoID;
  private Map<String, String> addInfo = new HashMap<String, String>();
  public String getUserID() {
    return userID;
  }
  public void setUserID(String userID) {
    this.userID = userID;
  }
  public String getPdoID() {
    return pdoID;
  }
  public void setPdoID(String pdoID) {
    this.pdoID = pdoID;
  }
  public Map<String, String> getAddInfo() {
    return addInfo;
  }
  public void setAddInfo(Map<String, String> addInfo) {
    this.addInfo = addInfo;
  }
  public Map<String, String> modifyAddInfo(){
    Map<String, String> info = this.getAddInfo();
    List<String> temp = new ArrayList<String>();
    Map<String, String> map = new HashMap<String, String>();
    for (Map.Entry<String, String> entry : info.entrySet()) {
     temp.add(entry.getValue());
    }
    for (int i = 0; i<temp.size();i = i + 2) {
      map.put(temp.get(i + 1), temp.get(i));
    }
    return map;
  }
  public String addPdo() {
    String sqlAddValue = "'" + this.getUserID()+"','"+this.getPdoID()+"',";
    String sqlAddKey = sqlAddValue;
    String sqlAddQuery = sqlAddValue;
    String tableValue = "tableValue"; //the names of relative tables
    String tableKey = "tableKey";     //
    String tableQuery = "tableQuery"; //
    Map<String, String> info = modifyAddInfo();
    if (info == null) {
      return ERROR;
    }
    Iterator<String> iterator = info.keySet().iterator();
    String[] key = null;
    String[] value = null;
    while (iterator.hasNext()) {
      String tempKey = iterator.next();
      String tempValue = info.get(tempKey);
      key = tempKey.split(", ");
      value = tempValue.split(", ");
    }
    int i = 0;
    int j = 0;
    for (i = 0; i <key.length;i++) {
      if (i < key.length - 1) {
        sqlAddValue = sqlAddValue + "'" + value[i] + "',";
        sqlAddKey = sqlAddKey + "'" + key[i] + "',";
      }
      else {
        sqlAddValue = sqlAddValue + "'" + value[i] + "'";
        sqlAddKey = sqlAddKey + "'" + key[i] + "'";
      }
      if (j < 2) {
        sqlAddQuery = sqlAddQuery + "'" + value[i] + "',";
      }
      else if (j == 2) {
        sqlAddQuery = sqlAddQuery + "'" + value[j] + "'";
      }
      j++;
    }
    sqlAddValue = "insert into " + tableValue + " values (" + sqlAddValue +")";
    sqlAddKey = "insert into " + tableKey + " values (" + sqlAddKey +")";
    sqlAddQuery = "insert into " + tableQuery + " values (" + sqlAddQuery +")";
    System.out.println(sqlAddValue);
    System.out.println(sqlAddQuery);
    int result1 = DataOperation.getInstance().delete_save_updata(sqlAddValue);
    int result2 = DataOperation.getInstance().delete_save_updata(sqlAddKey);
    int result3 = DataOperation.getInstance().delete_save_updata(sqlAddQuery);
    if (result1 == 0 || result2 == 0 || result3 == 0) {
      return ERROR;
    }
    return SUCCESS;
  }
  public String queryPdo() throws SQLException {
    String sqlQuery = "";
    String sqlKey = "";
    String sqlValue = "";
    String minDate = "2000-1-1";
    String maxDate = "2100-12-31";
    String minSpend = "0";
    String maxSpend = "100000";
    String tableValue = "tableValue"; //the names of relative tables
    String tableKey = "tableKey";   //
    String tableQuery = "tableQuery"; //
    String userInfo = "userID = \'" + this.getUserID() + "\'"; 
    String dateInfo = "";
    String spendInfo = "";
    String otherInfo = "";
    Map<String, String> returnQueryInfo = new HashMap<String, String>();
    Map<String, String> info = modifyAddInfo();
    if (info == null) {
      return ERROR;
    }
    Iterator<String> iterator = info.keySet().iterator();
    String[] key = null;
    String[] value = null;
    while (iterator.hasNext()) {
      String tempKey = iterator.next();
      String tempValue = info.get(tempKey);
      key = tempKey.split(", ");
      value = tempValue.split(", ");
    }
    if (key[0].equals("noStartDate")||key[0].equals("")) {
      key[0] = minDate;
    }
    if (value[0].equals("noEndDate")||value[0].equals("")) {
      value[0] = maxDate;
    }
    dateInfo = "date between " + key[0] + " and " + value[0];
    if (key[1].equals("noMinSpend")||key[1].equals("")) {
        key[1] = minSpend;
      }
      if (value[1].equals("noMaxSpend")||value[1].equals("")) {
        value[1] = maxSpend;
      }
      spendInfo = "spend between " + key[1] + " and " + value[1];
    for (int i = 2;i < key.length;i++) {
      otherInfo = key[i] +" =\'" + value[i] + "\'";
    }
    sqlQuery = "select pdoID from " + tableQuery + " where " + userInfo +" and "+ dateInfo 
        + " and " + spendInfo + " and " + otherInfo;
    System.out.println(sqlQuery);
    ResultSet rs = DataOperation.getInstance().query(sqlQuery);
    List <String> pdoList = new ArrayList<String>();
    while (rs.next()) {
      pdoList.add(rs.getString(1));
    }
    if (pdoList.size() == 0) {
      return "noPdo";
    }
    int i = 0;
    String pdoIdInfo = "";
    while (i < pdoList.size() - 1) {
      pdoIdInfo = pdoIdInfo + pdoList.get(i) + ",";
    }
    pdoIdInfo = pdoIdInfo + pdoList.get(pdoList.size());
    sqlKey = "select * from " + tableKey + "where pdoID in (" + pdoIdInfo + ")";
    sqlValue = "select * from " + tableValue + "where pdoID in (" + pdoIdInfo + ")";
    ResultSet rsKey = DataOperation.getInstance().query(sqlKey);
    ResultSet rsValue = DataOperation.getInstance().query(sqlValue);
    while (rsKey.next() && rsValue.next()) {
      returnQueryInfo.put(rsKey.getString(1), rsValue.getString(1));
    }
    this.setAddInfo(returnQueryInfo);
    return SUCCESS;
  }
}
