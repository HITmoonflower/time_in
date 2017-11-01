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
  private int userID;
  private int pdoID;
  private String relateID;
  private Map<String, String> addInfo = new HashMap<String, String>();
  private List<Map<String, String>> queryResult = new ArrayList<Map<String, String>>();
  
  public int getUserID() {
    return userID;
  }
  public void setUserID(int userID) {
    this.userID = userID;
  }
  public int getPdoID() {
    return pdoID;
  }
  public void setPdoID(int pdoID) {
    this.pdoID = pdoID;
  }
  public Map<String, String> getAddInfo() {
    return addInfo;
  }
  public void setAddInfo(Map<String, String> addInfo) {
    this.addInfo = addInfo;
  }
  
  
  public List<Map<String, String>> getQueryResult() {
    return queryResult;
  }
  public void setQueryResult(List<Map<String, String>> queryResult) {
    this.queryResult = queryResult;
  }
  //修饰前端传递的Map，可能会根据前端的变化而变化  
  public Map<String, String> modifyAddInfo(){
    Map<String, String> info = this.getAddInfo();
    List<String> temp = new ArrayList<String>();
    Map<String, String> map = new HashMap<String, String>();
    for (Map.Entry<String, String> entry : info.entrySet()) {
     temp.add(entry.getValue());
    }
    for (int i = 0; i<temp.size();i = i + 2) {
     //如果两个都是空话...      
      map.put(temp.get(i + 1), temp.get(i));
    }
    return map;
  }
  
  //添加pdo,sql语句执行失败返回error，无输入指返回noInput，成功返回success
  public String addPdo() {
    String sqlAddValue = "'" + this.getUserID()+"'";
    String sqlAddKey = sqlAddValue;
    String sqlAddQuery = sqlAddValue;
    String sqlValue = "userID";
    String sqlKey = "userID";
    String sqlQuery = "userID";
    String tableValue = "tableValue"; //the names of relative tables
    String tableKey = "tableKey";     //
    String tableQuery = "tableQuery"; //
    Map<String, String> info = modifyAddInfo();
    Iterator<String> iterator = info.keySet().iterator();
    String[] key = null;
    String[] value = null;
    while (iterator.hasNext()) {
      String tempKey = iterator.next();
      String tempValue = info.get(tempKey);
      key = tempKey.split(", ");
      value = tempValue.split(", ");
    }
    List<String> queryKey = new ArrayList<String> ();
    List<String> queryValue = new ArrayList<String>();
    int i = 0;
    int offset = 0;
    if (key.length == 0) {
      return "noInput";
    }
    for (i = 0; i <key.length;i++) {
      if (value[i].equals("")||key[i].equals("")) {
        offset++;
        continue;
      }
      if (key[i].equals("datetime")||key[i].equals("spend")||key[i].equals("place")) {
        queryKey.add(key[i]);
        queryValue.add(value[i]);
      }
      sqlAddValue = sqlAddValue + ",'" + value[i] + "'";
      sqlAddKey = sqlAddKey + ",'" + key[i] + "'";
      sqlValue = sqlValue + ",value" + (i-offset);
      sqlKey = sqlKey + ",key" + (i-offset);
    }
    for (int j = 0; j < queryKey.size();j++) {
      sqlAddQuery = sqlAddQuery +",'" + queryValue.get(j) +"'";
      sqlQuery = sqlQuery + "," + queryKey.get(j);
    }
    sqlAddValue = "insert into " + tableValue +"("+ sqlValue +")" + " values (" + sqlAddValue +")";
    sqlAddKey = "insert into " + tableKey + "("+ sqlKey +")" + " values (" + sqlAddKey +")";
    sqlAddQuery = "insert into " + tableQuery + "("+ sqlQuery +")" + " values (" + sqlAddQuery +")";
    System.out.println(sqlAddValue);
    System.out.println(sqlAddKey);
    System.out.println(sqlAddQuery);
    int result1 = DataOperation.getInstance().delete_save_updata(sqlAddValue);
    int result2 = DataOperation.getInstance().delete_save_updata(sqlAddKey);
    int result3 = DataOperation.getInstance().delete_save_updata(sqlAddQuery);
    if (result1 == 0 || result2 == 0 || result3 == 0) {
      System.out.println(""+ result1 + result2 + result3);
      return ERROR;
    }
    return SUCCESS;
  }
  
  //查询pdo，查询所得的数据以为List<Map<String, String>>形式传递,无输入返回所有在maxdate,mindate之间
  //且在minspend与maxspend之间的所有pdo(可以改成返回"noInput")
  //没有匹配的pdo返回"noPdo",如果根据pdoId查不到相应的Pdo返回"error"
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
    Map<String, String> info = modifyAddInfo();
    Iterator<String> iterator = info.keySet().iterator();
    String[] key = null;
    String[] value = null;
    while (iterator.hasNext()) {
      String tempKey = iterator.next();
      String tempValue = info.get(tempKey);
      key = tempKey.split(",");
      value = tempValue.split(",");
    }
    if (key[0].equals("")) {
      key[0] = minDate;
    }
    if (value[0].equals("")) {
      value[0] = maxDate;
    }
    dateInfo = " and datetime between '" + key[0] + "' and '" + value[0] + "'";
    if (key[1].equals(" ")) {
        key[1] = minSpend;
      }
    if (value[1].equals(" ")) {
      value[1] = maxSpend;
    }
      spendInfo = " and spend between '" + key[1] + "' and '" + value[1] + "'";
    for (int i = 2;i < key.length;i++) {
      if (key[i].equals(" ")||value[i].equals(" ")) {
        continue;
      }
      otherInfo = otherInfo +" and " + key[i] +" =\'" + value[i] + "\'";
    }
    sqlQuery = "select pdoID from " + tableQuery + " where " + userInfo + dateInfo 
        + spendInfo  + otherInfo;
    System.out.println(sqlQuery);
    ResultSet rs = DataOperation.getInstance().query(sqlQuery);
    List <String> pdoList = new ArrayList<String>();
    while (rs.next()) {
      pdoList.add(rs.getString(1));
    }
    if (pdoList.size() == 0) {
      return "noPdo";
    }
    String pdoIdInfo = "";
    for (int i = 0; i<pdoList.size()-1;i++) {
      pdoIdInfo = pdoIdInfo +" pdoID = '" +  pdoList.get(i) + "'or";
    }
    pdoIdInfo = pdoIdInfo +" pdoID = '" +pdoList.get(pdoList.size()-1) + "'";
    sqlKey = "select * from " + tableKey + " where"+ pdoIdInfo;
    sqlValue = "select * from " + tableValue + " where"+  pdoIdInfo;
    ResultSet rsKey = DataOperation.getInstance().query(sqlKey);
    ResultSet rsValue = DataOperation.getInstance().query(sqlValue);
    List<Map<String, String>> query = new ArrayList<Map<String,String>>();
    while (rsKey.next() && rsValue.next()) {
      Map<String, String> map = new HashMap<String, String>();
      map.put("pdoID",  rsValue.getString(1));
      map.put("userID", rsValue.getString(2));
      for (int i = 3;;i++) {
        try {
          if (rsKey.getString(i) == null) {
            continue;
          }
          map.put(rsKey.getString(i), rsValue.getString(i));
        }
        catch(SQLException e) {
          break;
        }
      }
      query.add(map);
    }
    if(query.size() == 0) {
      return ERROR;
    }
    // for (int i = 0;i<query.size();i++) {
      // for (Map.Entry<String, String> entry : query.get(i).entrySet()) { 
        // System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());  
    // }  
    // }
    this.setQueryResult(query);
    return SUCCESS;
  }
  //建立两个pdo之间的关系 main key auto incre col1 pdo1 col2 pdo2
  //pdo1 < pdo2
  public void addrelatePdo() throws SQLException{
	  String tmp;
//	  if(pdoID.compareTo(relateID) > 0) {
//		  tmp = pdoID;
//		  pdoID = relateID;
//		  relateID = tmp;
//	  }
	  String sql = "select * from tablerelation where pdo1 = " + pdoID + "and pdo2 = " + relateID + "limit 1";
	  if(DataOperation.getInstance().query(sql).wasNull()) {
		  sql = "insert into tablerelation values = (" + pdoID + "," + relateID + ")";
		  DataOperation.getInstance().delete_save_updata(sql);
	  }
  }
  
}
