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
	private List<PDOModel> queryRes; //use to store query result
	private List<PDOModel> relateRes; //use to store query relate result
	private List<String> formHeader; //use to generate form by the pdoId
	private int pdo1, pdo2; //use to link two pdo
    private File excelFile; 
    private String excelFileName; //use to store the excel's name
    private String importRes;
	
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

  public List<PDOModel> getQueryRes() {
    return queryRes;
  }

  public void setQueryRes(List<PDOModel> queryRes) {
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
  public List<PDOModel> getRelateRes() {
	return relateRes;
  }

  public void setRelateRes(List<PDOModel> relateRes) {
		this.relateRes = relateRes;
  }
	public String getExcelFileName() {
		return excelFileName;
	}

	public void setExcelFileName(String excelFileName) {
		this.excelFileName = excelFileName;
	}
	
 	public String addPdo() {
 	  System.out.println(pdo.getUserID());
		boolean res = pdoService.add(pdo);
		if(res) {
			return SUCCESS;
		}
		return "error";
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
		formHeader = pdoService.showHeader(pdoId);
		return SUCCESS;
	}
	
	public String showAllPdo() {
		queryRes = pdoService.showAll(userId);
		return SUCCESS;
	}
	
	public String uploadPdo() {
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
					res = "emptyContent";
				}else {
					pdo.setUserID(userId);
					for(int i = 0; i < content.length; i++) {
						int excelColumn = content[i].length;
						info = new HashMap<String, String>();
						boolean flag = false;	
						for(int j = 0; j < header.length; j++) {
							if(j < excelColumn) {
							//不允许有空的行???
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
					res = "success";
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
		Map<String, String> jsonMap = new HashMap();
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
		setRelateRes(pdoService.getRelate(pdoId));
		return SUCCESS;
	}
	@Override
  public Object getModel() {
    // TODO Auto-generated method stub
    return pdo;
  }

	public String getImportRes() {
		return importRes;
	}

	public void setImportRes(String importRes) {
		this.importRes = importRes;
	}

}
