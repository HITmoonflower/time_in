package action;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.*;
import org.apache.poi.*;
import org.apache.struts2.ServletActionContext;
import database.DataOperation;
import model.*;
import service.*;


import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.*;

public class PDOAction extends ActionSupport implements ModelDriven<Object>{
	private PDOModel pdo = new PDOModel();
	private PDOService pdoService = new PDOService();
	private ExcelService excelService = new ExcelService();
	private int userId; //use to store the userId now
	private int pdoId; //use to store the pdoId of the form
	private Map<String, String> info = new LinkedHashMap<String, String>(); //use to store query conditions
	private List<String> infokey;
	private List<String> infovalue;
	private Map<String, List<PDOModel>> queryRes; //use to store query result
	private Map<String, List<PDOModel>> queryT;
	private String queryP;
	private String relateRes; //use to store query relate result
	private List<String> formHeader; //use to generate form by the pdoId
	private List<String> header;
	private int pdo1, pdo2; //use to link two pdo
    private File excelFile; 
    private String excelFileName; //use to store the excel's name
    private String importRes;
    private String tranName;


  public String getTranName() {
		return tranName;
	}

	public void setTranName(String tranName) {
		this.tranName = tranName;
	}
	


public String getRelateRes() {
		return relateRes;
	}

	public void setRelateRes(String relateRes) {
		this.relateRes = relateRes;
	}

public int getPdoId() {
    return pdoId;
  }

  public void setPdoId(int pdoId) {
    this.pdoId = pdoId;
  }

  public List<String> getFormHeader() {
    return formHeader;
  }

  public void setFormHeader(List<String> formHeader) {
    this.formHeader = formHeader;
  }
  
      public List<String> getHeader() {
	    return header;
	  }

	  public void setHeader(List<String> header) {
	    this.header = header;
	  }

  public File getExcelFile() {
    return excelFile;
  }

  public void setExcelFile(File excelFile) {
    this.excelFile = excelFile;
  }

  public int getPdo1() {
    return pdo1;
  }

  public void setPdo1(int pdo1) {
    this.pdo1 = pdo1;
  }

  public int getPdo2() {
    return pdo2;
  }

  public void setPdo2(int pdo2) {
    this.pdo2 = pdo2;
  }

  public int getUserId() {
    return userId;
  }

  public void setUserId(int userId) {
    this.userId = userId;
  }

  public Map<String, List<PDOModel>> getQueryRes() {
    return queryRes;
  }

  public void setQueryRes(Map<String, List<PDOModel>> queryRes) {
    this.queryRes = queryRes;
  }

  public PDOModel getPdo() {
    return pdo;
  }

  public Map<String, String> getInfo() {
    return info;
  }

  public void setInfo(Map<String, String> info) {
    this.info = info;
  }

  public PDOService getPdoService() {
    return pdoService;
  }

  public void setPdoService(PDOService pdoService) {
    this.pdoService = pdoService;
  }

  public ExcelService getExcelService() {
    return excelService;
  }

  public void setExcelService(ExcelService excelService) {
    this.excelService = excelService;
  }

  public void setPdo(PDOModel pdo) {
    this.pdo = pdo;
  }
	public String getExcelFileName() {
		return excelFileName;
	}

	public void setExcelFileName(String excelFileName) {
		this.excelFileName = excelFileName;
	}
	
 	public String addPdoData() {
 		Map<String, String> mp = new LinkedHashMap<String, String>();
 		for(int i = 0; i < infokey.size(); i++) {
 			mp.put(infokey.get(i), infovalue.get(i));
 		}
 		pdo.setInfoMap(mp);
		boolean res = pdoService.add(pdo);
		Map<String, String> map = new HashMap<String,String>();
		if(res) {
			map.put("result", "pdo数据添加成功");
		}
		else {
			map.put("result", "pdo数据添加失败");
		}
		relateRes = JSONObject.fromObject(map).toString();
		return SUCCESS;
	}
 	
 	public String addPdo() {
 		boolean res = pdoService.addHeader(userId, tranName, header);
		Map<String, String> map = new HashMap<String,String>();
		if(res) {
			map.put("result", "pdo模板添加成功");
		}
		else {
			map.put("result", "pdo模板添加失败");
		}
		relateRes = JSONObject.fromObject(map).toString();
 		return SUCCESS;
 	}
	
	public String queryPdo() {
		Map<String, String> map = new HashMap<String, String>();
	  String el = "^((\\d{2}(([02468][048])|([13579][26]))[\\-\\-\\s]?((((0?" +
	      "[13578])|(1[02]))[\\-\\-\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))" +
	          "|(((0?[469])|(11))[\\-\\-\\s]?((0?[1-9])|([1-2][0-9])|(30)))|" +
	      "(0?2[\\-\\-\\s]?((0?[1-9])|([1-2][0-9])))))|(\\d{2}(([02468][12" +
	          "35679])|([13579][01345789]))[\\-\\-\\s]?((((0?[13578])|(1[02]))" +
	      "[\\-\\-\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))" +
	          "[\\-\\-\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\-\\s]?((0?[" +
	      "1-9])|(1[0-9])|(2[0-8]))))))";
	      Pattern pattern = Pattern.compile(el);
	      Matcher matcher1 = pattern.matcher(info.get("startDate"));
	      boolean rst1=!matcher1.matches();
	      Matcher matcher2 = pattern.matcher(info.get("endDate"));
	      boolean rst2=!matcher2.matches();
	      if(rst1&&!info.get("startDate").equals("")) {
	        map.put("result","时间格式不符");
	        relateRes = JSONObject.fromObject(map).toString();
	        return SUCCESS;
	      }
	      if(rst2&&!info.get("endDate").equals("")) {
	        map.put("result","时间格式不符");
	        relateRes = JSONObject.fromObject(map).toString();
	        return SUCCESS;
	      }
		try{
			queryRes = pdoService.query(userId, info);
			if(queryRes == null)
				map.put("result", "查询数据失败");
			else
				map.put("result", "success");
		} catch(SQLException e) {
			e.printStackTrace();
			map.put("result", "查询数据失败");
		}
		relateRes = JSONObject.fromObject(map).toString();
		return SUCCESS;
	}

	
	public String queryPdoSuccess() {
		try{
			queryRes = pdoService.query(userId, info);
			setQueryT(pdoService.queryTime(userId, info));
	    Map<String, List<PDOModel>> temQuery = pdoService.queryPlace(userId, info);
	    queryP = JSONObject.fromObject(temQuery).toString();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String addRelatePdo() {
		pdoService.addrelate(pdo1, pdo2);
		return SUCCESS;
	}
	
	public String generateForm() {
	  List <String> header=new ArrayList<String>();
	  header.add(this.getTranName());
		header.addAll(pdoService.getHeaderByName(userId, tranName));
		this.setFormHeader(header);
		Map<String,List<String>> map = new LinkedHashMap<String,List<String>>();
		map.put("header", formHeader);
		importRes = JSONObject.fromObject(map).toString();
		return SUCCESS;
	}
	
	public String showAllPdo() {
	  info.put("startDate", "2000-01-01");
	  info.put("endDate", "2500-01-01");
	  info.put("minSpend", "");
	  info.put("maxSpend", "");
	  info.put("place", "");
	  queryRes = pdoService.showAll(userId);
	  try {
		  setQueryT(pdoService.queryTime(userId, info));
		  Map<String, List<PDOModel>> temQuery = pdoService.queryPlace(userId, info);
		  queryP = JSONObject.fromObject(temQuery).toString();
      } catch (SQLException e) {
          e.printStackTrace();
      }
		return SUCCESS;
	}
	
	public String uploadPdo() {
		String name = this.getTranName();
		String res = null;
		int successimp = 0;
		int failimp = 0;
		try {
			FileInputStream is = new FileInputStream(excelFile);
			excelService.setFis(is);
			excelService.setFileName(excelFileName);
			if(excelService.createWB()) {
				String[] header = excelService.readExcelTitle();
				String[][] content = excelService.readExcelContent();			
				if(header == null) {
					res = "emptyHeader";
					System.out.println("header empty");
				}else if(content == null) {
					//header = pdoService.getHeaderByName(name);
					System.out.println("content empty");
					List<String> tmpheader = pdoService.getHeaderByName(userId, name);
					if (tmpheader == null) {
						tmpheader = new ArrayList<String>();
						for (int i = 0; i < header.length; i++) {
							tmpheader.add(header[i]);
						}
						boolean tmpres = pdoService.addHeader(userId, name, tmpheader);
						if(tmpres == true)
							res = "addHeaderSuccess";
						else
							res = "addHeaderFail";
					}else {
						res = "existPdo";
					}
				}else {
					List<String> tmpheader = pdoService.getHeaderByName(userId, name);
					
					if(tmpheader == null) {
						System.out.println("no header");
						tmpheader = new ArrayList<String>();
						for (int i = 0; i < header.length; i++) {
							tmpheader.add(header[i]);
						}
						boolean tmpres = pdoService.addHeader(userId, name, tmpheader);
						if(tmpres == true) {
							pdo.setUserID(userId);
							pdo.setName(name);
							for(int i = 0; i < content.length; i++) {
								info = new LinkedHashMap<String, String>();
								boolean flag = false;	
								for(int j = 0; j < header.length; j++) {
									info.put(header[j], content[i][j]);
									if(content[i][j].length() != 0)
										flag = true;
								}
								if(flag) {
									pdo.setInfoMap(info);
									if(pdoService.add(pdo)) {
										successimp ++;
									}else
										failimp++;
								}
							}
							res = "addPdoSuccess";
						}else {
							res = "addHeaderFail";	
						}
					}else {
						System.out.println(tmpheader.size());
						for(int i = 0; i < tmpheader.size(); i++)
							System.out.println(tmpheader.get(i));
						System.out.println(header.length);
						for(int i = 0; i < header.length; i++)
							System.out.println(header[i]);
						
						if (header.length == tmpheader.size()) {
							boolean flag = true;
							for (int i = 0; i < header.length; i++) {
								if (header[i].equals(tmpheader.get(i)) == false) {
									res = "notSameHeader";
									flag = false;
									break;
								}
							}
							if(flag) {
								pdo.setUserID(userId);
								pdo.setName(name);
								for(int i = 0; i < content.length; i++) {
									int excelColumn = content[i].length;
									info = new LinkedHashMap<String, String>();
									boolean flag1 = false;	
									for(int j = 0; j < header.length; j++) {
										info.put(header[j], content[i][j]);
										if(content[i][j].length() != 0)
											flag1 = true;	
									}
									if(flag1) {
										pdo.setInfoMap(info);
										if(pdoService.add(pdo))
											successimp ++;
										else
											failimp++;
									}
								}
								res = "addPdoSuccess";								
							}
						}else {
							res = "notSameHeader";
						}
					}
				}

			}else {
				res = "typeError";
			}
			if(is != null)
				is.close();
		}catch(FileNotFoundException e) {
			e.printStackTrace();
			res = "fileNotFound";
		}catch(IOException e) {
			e.printStackTrace();
			res = "error";
		}
		Map<String, String> jsonMap = new HashMap<String, String>();
		jsonMap.put("importRes", res);
		jsonMap.put("successimp", successimp+"");
		jsonMap.put("failimp", failimp+"");
		importRes = JSONObject.fromObject(jsonMap).toString();
		return SUCCESS;
	}
	
	public String showDetailPdo() {
		pdo = pdoService.getPdoById(pdoId);
		if (pdo != null)
			return SUCCESS;
		return "error";
	}
	
	public String showRelatePdo() {
		List<PDOModel> temp = pdoService.getRelate(pdoId);
		System.out.println(pdoId);
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		for (int i=0;i<temp.size();i++) {
			Map<String,String> pdoTemp = temp.get(i).getInfoMap();
			pdoTemp.put("name", temp.get(i).getName());
			pdoTemp.put("pdoId", Integer.toString(temp.get(i).getPdoID()));
			list.add(pdoTemp);
		}
		map.put("datas", list);
		relateRes = JSONObject.fromObject(map).toString();
		return SUCCESS;
	}
	
	public String jumpPage() {
	  return SUCCESS;
	}
	@Override
   public Object getModel() {
    return pdo;
   }

	public String getImportRes() {
		return importRes;
	}

	public void setImportRes(String importRes) {
		this.importRes = importRes;
	}

  public Map<String, List<PDOModel>> getQueryT() {
    return queryT;
  }

  public void setQueryT(Map<String, List<PDOModel>> queryT) {
    this.queryT = queryT;
  }

public List<String> getInfokey() {
	return infokey;
}

public void setInfokey(List<String> infokey) {
	this.infokey = infokey;
}

public List<String> getInfovalue() {
	return infovalue;
}

public void setInfovalue(List<String> infovalue) {
	this.infovalue = infovalue;
}

public String getQueryP() {
  return queryP;
}

public void setQueryP(String queryP) {
  this.queryP = queryP;
}


}
