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
import database.DataOperation;
import model.*;
import service.*;

import com.opensymphony.xwork2.ActionSupport;

public class PDOAction extends ActionSupport {
	private PDOModel pdo = new PDOModel();
	private PDOService pdoService = new PDOService();
	private int userId; //use to store the userId now
	private int pdoId; //use to store the pdoId of the form
	private Map<String, String> info; //use to store query conditions
	private List<Map<String, String>> queryRes; //use to store query result
	private List<String> formHeader; //use to generate form by the pdoId
	private int pdo1, pdo2; //use to link two pdo
	
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
}
