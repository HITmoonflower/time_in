package service;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.xssf.usermodel.*;
import org.apache.struts2.dispatcher.Parameter.File;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.hssf.usermodel.*;

/**
 * 操作Excel表格的功能类
 */
public class ExcelService {
    private String excelFileName;
    private FileInputStream fis;
    private Workbook wb;
    private Sheet sheet;
    private Row row;

    public void setFis(FileInputStream fis) {
    	this.fis = fis;
    }
    public void setFileName(String name) {
    	this.excelFileName = name;
    }
    
    public boolean createWB() {
    	try {
    		if(excelFileName.endsWith(".xls")) {
    			wb = new HSSFWorkbook(fis);
    		}else if(excelFileName.endsWith(".xlsx")) {
    			wb = new XSSFWorkbook(fis);
    		}else {
    			return false;
    		}
    	}catch(IOException e) {
    		e.printStackTrace();
    		return false;
    	}
    	return true;
    }
    
    /**
     * 读取Excel表格表头的内容
     * @param InputStream
     * @return String 表头内容的数组
     */
    public String[] readExcelTitle() {
        sheet = wb.getSheetAt(0);
        if(sheet.getLastRowNum() == 0)
        	return null;
        row = sheet.getRow(0);
        // 标题总列数
        int colNum = row.getPhysicalNumberOfCells();
        String[] title = new String[colNum];
        for (int i = 0; i < colNum; i++) {
            //title[i] = getStringCellValue(row.getCell((short) i));
            title[i] = getCellFormatValue(row.getCell((short) i));
        }
        return title;
    }

    /**
     * 读取Excel数据内容
     * @param InputStream
     * @return Map 包含单元格数据内容的Map对象
     */
    public String[][] readExcelContent() {
        sheet = wb.getSheetAt(0);
        // 得到总行数
        int rowNum = sheet.getLastRowNum();
        if(rowNum <= 1)
        	return null;
        row = sheet.getRow(0);
        int colNum = row.getPhysicalNumberOfCells();
        String[][] content = new String[rowNum - 1][colNum];
        // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = 1; i < rowNum; i++) {
            row = sheet.getRow(i);
            int j = 0;
            while (j < colNum) {
                // 每个单元格的数据内容用"-"分割开，以后需要时用String类的replace()方法还原数据
                // 也可以将每个单元格的数据设置到一个javabean的属性中，此时需要新建一个javabean
                // str += getStringCellValue(row.getCell((short) j)).trim() +
                // "-";
                content[i - 1][j] = getCellFormatValue(row.getCell((short) j)).trim();
                j++;
            }
        }
        return content;
    }

    /**
     * 获取单元格数据内容为字符串类型的数据
     * 
     * @param cell Excel单元格
     * @return String 单元格数据内容
     */
    private String getStringCellValue(Cell cell) {
        String strCell = "";
        if(cell == null)
        	return "";
        switch (cell.getCellTypeEnum()) {
        case STRING:
            strCell = cell.getStringCellValue();
            break;
        case NUMERIC:
            strCell = String.valueOf(cell.getNumericCellValue());
            break;
        case BOOLEAN:
            strCell = String.valueOf(cell.getBooleanCellValue());
            break;
        case BLANK:
            strCell = "";
            break;
        default:
            strCell = "";
            break;
        }
        return strCell;
    }

    /**
     * 获取单元格数据内容为日期类型的数据
     * 
     * @param cell
     *            Excel单元格
     * @return String 单元格数据内容
     */
    private String getDateCellValue(Cell cell) {
        String result = "";
        try {
            CellType cellType = cell.getCellTypeEnum();
            if (cellType == CellType.NUMERIC) {
                Date date = cell.getDateCellValue();
                result = (date.getYear() + 1900) + "-" + (date.getMonth() + 1)
                        + "-" + date.getDate();
            } else if (cellType == CellType.STRING) {
                String date = cell.getStringCellValue();
                result = date.replaceAll("[年月]", "-").replace("日", "").trim();
            } else if (cellType == CellType.BLANK) {
                result = "";
            }
        } catch (Exception e) {
            System.out.println("日期格式不正确!");
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 根据HSSFCell类型设置数据
     * @param cell
     * @return
     */
    private String getCellFormatValue(Cell cell) {
        String cellvalue = "";
        if (cell != null) {
            // 判断当前Cell的Type
            switch (cell.getCellTypeEnum()) {
            case NUMERIC:
            	cellvalue = cell.getNumericCellValue() + "";
            case FORMULA: {
                // 判断当前的cell是否为Date
                if (DateUtil.isCellDateFormatted(cell)) {
                    // 如果是Date类型则，转化为Data格式
                    //方法1：这样子的data格式是带时分秒的：2011-10-12 0:00:00
                    //cellvalue = cell.getDateCellValue().toLocaleString();
                    //方法2：这样子的data格式是不带带时分秒的：2011-10-12
                    Date date = cell.getDateCellValue();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    cellvalue = sdf.format(date);
                }
                // 如果是纯数字
                else {
                    cellvalue = String.valueOf(cell.getNumericCellValue());
                }
                break;
            }
            case STRING:
                cellvalue = cell.getRichStringCellValue().getString();
                break;
            case BOOLEAN:
            	if(cell.getBooleanCellValue())
            		cellvalue = "1";
            	else
            		cellvalue = "0";
            	break;
            default:
                cellvalue = "";
            }
        } else {
            cellvalue = "";
        }
        return cellvalue;
    }
}