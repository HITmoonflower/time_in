package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.sql.*;
import model.*;
import database.*;


public class PDOService {
	//添加pdo,sql语句执行失败返回error，无输入指返回noInput，成功返回success
	public boolean add(PDOModel pdo) {
		int colNums = 8;
		String sqlkey = "insert into tablekey values(null,?,?,?,?,?,?,?,?,?)" ;
		String sqlvalue = "insert into tablevalue values(null,?,?,?,?,?,?,?,?,?)";
		String sqlquery = "insert into tablequery values(?,?,?,?,?)";
		String key, value;
		Connection conn = DataConn.getConnection();
		PreparedStatement pst1, pst2, pst3;
		pst1 = pst2 = pst3 = null;
		try {
			pst1 = conn.prepareStatement(sqlkey);
			pst2 = conn.prepareStatement(sqlvalue,Statement.RETURN_GENERATED_KEYS);
			pst3 = conn.prepareStatement(sqlquery);
			pst1.setInt(1, pdo.getUserID());
			pst2.setInt(1, pdo.getUserID());
			pst3.setInt(2, pdo.getUserID());
			int k = 2;
			boolean flag1, flag2, flag3;
			flag1 = flag2 = flag3 = false;
			for (Map.Entry<String, String> entry: pdo.getInfoMap().entrySet()) {
				key = entry.getKey();
				value = entry.getValue();
				colNums = colNums - 1;
				if(colNums < 0)
					break;
				pst1.setString(k, key);
				pst2.setString(k, value);
				k = k + 1;
				if(key.equals("datetime")) {
					pst3.setString(3, value);
					flag1 = true;
				}else if(key.equals("spend")) {
					pst3.setString(4, value);
					flag2 = true;
				}else if(key.equals("place")) {
					pst3.setString(5, value);
					flag3 = true;
				}
			}
			while(colNums > 0) {
				pst1.setNull(k, Types.CHAR);
				pst2.setNull(k, Types.BLOB);
				k = k + 1;
				colNums = colNums - 1;
			}
			if(!flag1) {
				pst3.setNull(3, Types.DATE);
			}
			if(!flag2) {
				pst3.setNull(4, Types.FLOAT);
			}
			if(!flag3) {
				pst3.setNull(5, Types.BLOB);
			}
			pst1.executeUpdate();
			pst2.executeUpdate();
			if(flag1 || flag2 || flag3) {
				ResultSet rs = pst2.getGeneratedKeys();
				rs.next();
				pst3.setInt(1, rs.getInt(1));
				pst3.executeUpdate();
				if(rs != null) {
					rs.close();
				}
			}
			if(pst1 != null)
				pst1.close();
			if(pst2 != null)
				pst2.close();
			if(pst3 != null)
				pst3.close();
			if(conn != null)
				conn.close();
			return true;
			
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	  
	//查询pdo，查询所得的数据以为List<Map<String, String>>形式传递,无输入返回所有在maxdate,mindate之间
	//且在minspend与maxspend之间的所有pdo(可以改成返回"noInput")
	//没有匹配的pdo,如果根据pdoId查不到相应的Pdo返回null
	public List<PDOModel> query(int userId, Map<String, String>info) throws SQLException{
	    String sqlQuery = "";
	    String sqlKey = "";
	    String sqlValue = "";
	    String tableValue = "tablevalue"; //the names of relative tables
	    String tableKey = "tablekey";   //
	    String tableQuery = "tablequery"; //
	    String userInfo = "userID = \'" + userId + "\'"; 
	    String dateInfo = "";
	    String spendInfo = "";
	    String otherInfo = "";
	    dateInfo = " and datetime between '" + info.get("startDate") + "' and '" + info.get("endDate") + "'";
	    spendInfo = " and spend between '" + info.get("minSpend") + "' and '" + info.get("maxSpend") + "'";
	    otherInfo = otherInfo +" and place " +" =\'" + info.get("place") + "\'";
	    if(info.get("place").equals("noPlaceInput")||info.get("place").equals("")) {
	      otherInfo = "";
	    }
	    sqlQuery = "select pdoID from " + tableQuery + " where " + userInfo + dateInfo 
	        + spendInfo  + otherInfo;
	    ResultSet rs = DataOperation.getInstance().query(sqlQuery);
	    List <String> pdoList = new ArrayList<String>();
	    while (rs.next()) {
	        pdoList.add(rs.getString(1));
	    }
	    if (pdoList.size() == 0) {
	      return null;
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
	    List<PDOModel> queryRes = new ArrayList<PDOModel>();
	    while (rsKey.next() && rsValue.next()) {
	        PDOModel pdo = new PDOModel();
	        Map<String, String> map = new HashMap<String, String>();
	        pdo.setPdoID(rsValue.getInt(1));
	        pdo.setUserID(rsValue.getInt(2));
	        for (int i = 3;;i++) {
	            try {
	                if (rsKey.getString(i) == null) {
	                    continue;
	                }
	                map.put(rsKey.getString(i), rsValue.getString(i));
	            } catch(SQLException e) {
	            	e.printStackTrace();
	                break;
	            }
	         }
	         pdo.setInfoMap(map);
	         queryRes.add(pdo);
	    }
	    return queryRes;
	}
	
	//建立两个pdo之间的关系 main key auto incre col1 pdo1 col2 pdo2 pdo1 < pdo2
	public void addrelate(int pdo1, int pdo2){
		int tmp = pdo1;
		if(pdo1 > pdo2) {
			pdo1 = pdo2;
			pdo2 = tmp;
		}
		String sql = "select * from tablerelation where pdo1 = " + pdo1 + " and pdo2 = " + pdo2 + " limit 1";
		try {
			if(!DataOperation.getInstance().query(sql).next()) {
				sql = "insert into tablerelation values (" + pdo1 + "," + pdo2 + ")";
				DataOperation.getInstance().delete_save_updata(sql);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}	
	
	public List<String> showHeader(int pdoId) {
		String sql = "select * from tablekey where pdoId = ?";
		Connection conn = DataConn.getConnection();
		PreparedStatement pst = null;
		List<String> ans = new ArrayList<String>();
		String key = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, pdoId);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				int colNum = 8 + 3;
				int k = 3;
				while(k < colNum) {
					key = rs.getString(k);
					if(key == null)
						break;
					ans.add(key);
					k = k + 1;
				}
			}
			if(rs != null)
				rs.close();
			if(pst != null)
				pst.close();
			if(conn != null)
				conn.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return ans;
	}

	public List<PDOModel> showAll(int userId){
        String sqlKey = "select * from tablekey where userId = " + "\'" + userId + "\'";
        String sqlValue = "select * from tablevalue where userId = " + "\'" + userId + "\'";
	    List<PDOModel> queryRes = new ArrayList<PDOModel>();
	    try {
	    	ResultSet rsKey = DataOperation.getInstance().query(sqlKey);
	    	ResultSet rsValue = DataOperation.getInstance().query(sqlValue);
	    	while (rsKey.next() && rsValue.next()) {
	    	  PDOModel pdo = new PDOModel();
	    		Map<String, String> map = new HashMap<String, String>();
	    		pdo.setPdoID(rsValue.getInt(1));
	    		pdo.setUserID(rsValue.getInt(2));
	    		for (int i = 3;;i++) {
	    			try {
	    				if (rsKey.getString(i) == null) {
	    					break;
	    				}
	    				map.put(rsKey.getString(i), rsValue.getString(i));
	    			} catch(SQLException e) {
	    				e.printStackTrace();
	    				break;
	    			}
	    		}
	    		pdo.setInfoMap(map);
	    		queryRes.add(pdo);
	    	}
	    }catch(SQLException e) {
	    	e.printStackTrace();
	    }
	    return queryRes;		
	}

	public PDOModel getPdoById(int pdoId) {
	      String sqlKey = "select * from tablekey where pdoId = " + "\'" + pdoId + "\'";
	      String sqlValue = "select * from tablevalue where pdoId = " + "\'" + pdoId + "\'";	
		  PDOModel pdo = new PDOModel();
		  Map<String, String> map = new HashMap<String, String>();
	      try {
		    	ResultSet rsKey = DataOperation.getInstance().query(sqlKey);
		    	ResultSet rsValue = DataOperation.getInstance().query(sqlValue);
		    	if (rsKey.next() && rsValue.next()) {
		    		pdo.setPdoID(rsValue.getInt(1));
		    		pdo.setUserID(rsValue.getInt(2));
		    		for (int i = 3;;i++) {
		    			try {
		    				if (rsKey.getString(i) == null) {
		    					break;
		    				}
		    				map.put(rsKey.getString(i), rsValue.getString(i));
		    			} catch(SQLException e) {
		    				e.printStackTrace();
		    				break;
		    			}
		    		}
		    		pdo.setInfoMap(map);
		    	}	    	  
	      }catch(Exception e) {
	    	  e.printStackTrace();
	    	  return null;
	      }
	      return pdo;
	}
	
	public List<PDOModel> getRelate(int pdoId){
		String sql1 = "select pdo1 from tablerelation where pdo2 = " + "\'" + pdoId + "\'";
		String sql2 = "select pdo2 from tablerelation where pdo1 = " + "\'" + pdoId + "\'";
		List<PDOModel> ans = new ArrayList<PDOModel>();
		try {
	    	ResultSet rs1 = DataOperation.getInstance().query(sql1);
	    	ResultSet rs2 = DataOperation.getInstance().query(sql2);
	    	while (rs1.next()) {
	    		ans.add(getPdoById(rs1.getInt(1)));
	    	}
	    	while (rs2.next()) {
	    		ans.add(getPdoById(rs2.getInt(1)));
	    	}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ans;
	}

}
