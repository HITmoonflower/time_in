package action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
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
	private Map<String, String> info = new HashMap<String, String>(); //use to store query conditions
	private Map<String, List<PDOModel>> queryRes; //use to store query result
	private String relateRes; //use to store query relate result
	private List<String> formHeader; //use to generate form by the pdoId
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
	
 	public String addPdo() {
 		System.out.println(pdo.getName());
 		System.out.println(pdo.getUserID());
 		for (Map.Entry<String, String> entry:pdo.getInfoMap().entrySet()) {
 			System.out.println(entry.getKey()+" "+entry.getValue());
 		}
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
	
	public String queryPdo() {
		try{
			queryRes = pdoService.query(userId, info);
			if(queryRes == null)
				return "error";
			return SUCCESS;
		} catch(SQLException e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	public String addRelatePdo() {
		pdoService.addrelate(pdo1, pdo2);
		return SUCCESS;
	}
	
	public String generateForm() {
		formHeader = pdoService.getHeaderByName(userId, tranName);
		return SUCCESS;
	}
	
	public String showAllPdo() {
		queryRes = pdoService.showAll(userId);
		return SUCCESS;
	}
	
	public String uploadPdo() {
		String name = this.getTranName();
		String res = null;
		try {
			FileInputStream is = new FileInputStream(excelFile);
			excelService.setFis(is);
			excelService.setFileName(excelFileName);
			if(excelService.createWB()) {
				String[] header = excelService.readExcelTitle();
				String[][] content = excelService.readExcelContent();
				if(header == null) {
					res = "emptyHeader";
				}else if(content == null) {
					//header = pdoService.getHeaderByName(name);
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
						tmpheader = new ArrayList<String>();
						for (int i = 0; i < header.length; i++) {
							tmpheader.add(header[i]);
						}
						boolean tmpres = pdoService.addHeader(userId, name, tmpheader);
						if(tmpres == true) {
							pdo.setUserID(userId);
							pdo.setName(name);
							for(int i = 0; i < content.length; i++) {
								int excelColumn = content[i].length;
								info = new HashMap<String, String>();
								boolean flag = false;	
								for(int j = 0; j < header.length; j++) {
									if(j < excelColumn) {
										if(header[j].length() == 0 || content[i][j].length() == 0)
											continue;
										info.put(header[j], content[i][j]);
										flag = true;
									}else {
										break;
									}
								}
								if(flag) {
									pdo.setInfoMap(info);
									pdoService.add(pdo);
								}
							}
							res = "addPdoSuccess";
						}else {
							res = "addHeaderFail";	
						}
					}else {
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
									info = new HashMap<String, String>();
									flag = false;	
									for(int j = 0; j < header.length; j++) {
										if(j < excelColumn) {
											if(header[j].length() == 0 || content[i][j].length() == 0)
												continue;
											info.put(header[j], content[i][j]);
											flag = true;
										}else {
											break;
										}
									}
									if(flag) {
										pdo.setInfoMap(info);
										pdoService.add(pdo);
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
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		for (int i=0;i<temp.size();i++) {
			Map<String,String> pdoTemp = temp.get(i).getInfoMap();
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

}
