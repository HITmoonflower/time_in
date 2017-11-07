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

public class PDOAction extends ActionSupport {
	private PDOModel pdo = new PDOModel();
	private PDOService pdoService = new PDOService();
	private ExcelService excelService = new ExcelService();
	private int userId; //use to store the userId now
	private int pdoId; //use to store the pdoId of the form
	private Map<String, String> info; //use to store query conditions
	private List<PDOModel> queryRes; //use to store query result
	private List<String> formHeader; //use to generate form by the pdoId
	private int pdo1, pdo2; //use to link two pdo
	public PDOModel getPdo() {
    return pdo;
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

  private String excelFileName; //use to store the excel's absolute path
	
 	public String addPdo() {
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
		queryRes = pdoService.showAll();
		return SUCCESS;
	}
	
	public String uploadPdo() {
		excelService.setExcelFile(excelFileName);
		
		if(excelService.createWB()) {
			String[] header = excelService.readExcelTitle();
			String[][] content = excelService.readExcelContent();
			pdo.setUserID(userId);
			for(int i = 0; i < content.length; i++) {
				int excelColumn = content[i].length;
				info = new HashMap<String, String>();
				boolean flag = false;
				for(int j = 0; j < header.length; j++) {
					if(j < excelColumn) {
						//不允许有空的value???
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
			return SUCCESS;
		}else
			return "error";
	}
}
