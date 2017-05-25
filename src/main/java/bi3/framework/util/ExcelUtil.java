package bi3.framework.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import bi3.framework.dto.ExcelData;
import bi3.framework.exceptions.FrameworkException;

/**
 * The Class ExcelFileReader.
 */
public class ExcelUtil {

	/** The logger. */
	//private static Logger logger = Logger.getLogger(ExcelFileReader.class);

	/** The path. */
	public String path;

	/** The fis. */
	public FileInputStream fis = null;

	/** The file out. */
	public FileOutputStream fileOut = null;

	/** The workbook. */
	private static HSSFWorkbook hssfWorkbook = null;

	/** The sheet. */
	private static HSSFSheet hssfSheet = null;

	/** The row. */
	private static HSSFRow hssfRow = null;

	/** The cell. */
	private static HSSFCell hssfCell = null;
	
	/** The XSSF workbook. */
	private static XSSFWorkbook xssfWorkBook;
	
	/** The XSSF sheet. */
	private static XSSFSheet xssfSheet;
	
	/** The XSSF row. */
	private static  XSSFRow xssfRow;
	
	/** The XSSF cell. */
	private static XSSFCell xssfCell;
	
	/** The sheet name. */
	private static String sheetName;

	/**
	 * Instantiates a new excel file reader.
	 *
	 * @param path
	 *            : Fully qualified name where the excel file is, including the
	 *            file name
	 * @param givenSheetName
	 *            : - Method name should have it's own sheet to pull the data,
	 *            and param should be the name of the method
	 */
	public ExcelUtil(final String path, final String givenSheetName) {
		sheetName = givenSheetName;
		this.path = path;
		try {
			fis = new FileInputStream(new File(path));
			hssfWorkbook = new HSSFWorkbook(fis);

			int sheetNumbers = hssfWorkbook.getNumberOfSheets();
			for (int i = 0; i < sheetNumbers; i++) {
				if (givenSheetName.equals(hssfWorkbook.getSheetName(i))) {
					hssfWorkbook.setActiveSheet(i);
					hssfSheet = hssfWorkbook.getSheetAt(i);
					return;
				}
			}
			throw new Exception("File " + path + " does not contains the sheet " + givenSheetName);

		} catch (Exception e) {
			//logger.error("ERROR in ExcelFileReader", e);
			throw new FrameworkException("ERROR in ExcelFileReader", e);
		}
	}
	
	public ExcelUtil(final String path){
		File file = FileUtil.getFile(path);
		try {
			Boolean fileTypeHssf = POIFSFileSystem.hasPOIFSHeader(new BufferedInputStream(new FileInputStream(file)));
			
			if(fileTypeHssf) { // HSSF
				FileInputStream fis = new FileInputStream(file);
				hssfWorkbook = new HSSFWorkbook(fis);
				
			} else { // XSSF
				xssfWorkBook = new XSSFWorkbook(file);
			}
			
		} catch (InvalidFormatException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	

	/**
	 * Gets the row count in an active sheet of the opened excel sheet
	 *
	 * @return the row count active sheet
	 */
	public int getRowCountActiveSheet() {
		int number = hssfSheet.getLastRowNum() + 1;
		return number;
	}

	/**
	 * Gets the excel active sheet first two column data.
	 *
	 * @return the excel active sheet first two column data
	 * @throws Exception
	 *             the exception
	 */

	public HashMap<String, String> getExcelActiveSheetFirstTwoColumnData() throws Exception {
		HashMap<String, String> recordsMap = new HashMap<String, String>();
		int lastRow = hssfSheet.getLastRowNum() + 2;
		try {
			// Finding whether shee has any data...
			if (lastRow < 1) {
				throw new Exception("Give sheet " + hssfSheet.getSheetName() + "Does not have any records");
			}
			for (int i = 1; i < lastRow; i++) {
				recordsMap.put(getCellData(0, i), getCellData(1, i));
			}

			return recordsMap;
		} catch (Exception e) {
			//logger.error("ERROR in getExcelActiveSheetFirstTwoColumnData", e);
			throw new FrameworkException("date sheet seems to be empty or some other error", e);
		}
	}

	/**
	 * Gets the row count.
	 *
	 * @param sheetName
	 *            the sheet name
	 * @return returns the row count in a sheet
	 */
	public int getRowCount(String sheetName) {
		int index = hssfWorkbook.getSheetIndex(sheetName);
		if (index == -1) {
			return 0;
		} else {
			hssfSheet = hssfWorkbook.getSheetAt(index);
			int number = hssfSheet.getLastRowNum() + 1;
			return number;
		}

	}

	/**
	 * Gets the cell data.
	 *
	 * @param colNum
	 *            the col num
	 * @param rowNum
	 *            the row num
	 * @return the cell data
	 */
	private String getCellData(final int colNum, final int rowNum) {

		try {
			if (rowNum <= 0) {
				return "";
			}
			hssfRow = hssfSheet.getRow(rowNum - 1);
			if (hssfRow == null) {
				return "";
			}
			hssfCell = hssfRow.getCell(colNum);
			if (hssfCell == null) {
				return "";
			}
			hssfCell.setCellType(Cell.CELL_TYPE_STRING);
			return hssfCell.getStringCellValue().trim();
		} catch (Exception e) {
			//logger.error("ERROR in getCellData", e);
			throw new FrameworkException("ERROR in getCellData", e);
		}

	}

	/**
	 * Gets the cell data.
	 *
	 * @param sheetName
	 *            the sheet name
	 * @param colName
	 *            the col name
	 * @param rowNum
	 *            the row num
	 * @return returns the data from a cell
	 */
	public String getCellData(final String sheetName, final String colName, final int rowNum) {
		try {
			if (rowNum <= 0) {
				return "";
			}

			int index = hssfWorkbook.getSheetIndex(sheetName);
			int col_Num = -1;
			if (index == -1) {
				return "";
			}

			hssfSheet = hssfWorkbook.getSheetAt(index);
			hssfRow = hssfSheet.getRow(0);
			for (int i = 0; i < hssfRow.getLastCellNum(); i++) {
				if (hssfRow.getCell(i).getStringCellValue().trim().equals(colName.trim()))
					col_Num = i;
			}
			if (col_Num == -1) {
				return "";
			}

			hssfSheet = hssfWorkbook.getSheetAt(index);
			hssfRow = hssfSheet.getRow(rowNum - 1);
			if (hssfRow == null) {
				return "";
			}
			hssfCell = hssfRow.getCell(col_Num);

			if (hssfCell == null) {
				return "";
			}
			if (hssfCell.getCellType() == Cell.CELL_TYPE_STRING) {
				return hssfCell.getStringCellValue();
			}
			else if (hssfCell.getCellType() == Cell.CELL_TYPE_NUMERIC
					|| hssfCell.getCellType() == Cell.CELL_TYPE_FORMULA) {

				String cellText = String.valueOf(hssfCell.getNumericCellValue());
				if (HSSFDateUtil.isCellDateFormatted(hssfCell)) {
					// format in form of M/D/YY
					double d = hssfCell.getNumericCellValue();

					Calendar cal = Calendar.getInstance();
					cal.setTime(HSSFDateUtil.getJavaDate(d));
					cellText = (String.valueOf(cal.get(Calendar.YEAR))).substring(2);
					cellText = cal.get(Calendar.DAY_OF_MONTH) + "/" + cal.get(Calendar.MONTH) + 1 + "/"
							+ cellText;
				}

				return cellText;
			} else if (hssfCell.getCellType() == Cell.CELL_TYPE_BLANK) {
				return "";
			}
			else {
				return String.valueOf(hssfCell.getBooleanCellValue());
			}

		} catch (Exception e) {
			//logger.error("ERROR in getCellData", e);
			throw new FrameworkException("ERROR in getCellData", e);
		}
	}

	/**
	 * Gets the cell data.
	 *
	 * @param sheetName
	 *            the sheet name
	 * @param colNum
	 *            the col num
	 * @param rowNum
	 *            the row num
	 * @return the cell data
	 */
	public String getCellData(final String sheetName, final int colNum, final int rowNum) {
		try {
			if (rowNum <= 0) {
				return "";
			}

			int index = hssfWorkbook.getSheetIndex(sheetName);

			if (index == -1) {
				return "";
			}

			hssfSheet = hssfWorkbook.getSheetAt(index);
			hssfRow = hssfSheet.getRow(rowNum - 1);
			if (hssfRow == null) {
				return "";
			}
			hssfCell = hssfRow.getCell(colNum);
			if (hssfCell == null) {
				return "";
			}

			if (hssfCell.getCellType() == Cell.CELL_TYPE_STRING) {
				return hssfCell.getStringCellValue();
			}
			else if (hssfCell.getCellType() == Cell.CELL_TYPE_NUMERIC
					|| hssfCell.getCellType() == Cell.CELL_TYPE_FORMULA) {

				String cellText = String.valueOf(hssfCell.getNumericCellValue());
				if (HSSFDateUtil.isCellDateFormatted(hssfCell)) {
					// format in form of M/D/YY
					double d = hssfCell.getNumericCellValue();

					Calendar cal = Calendar.getInstance();
					cal.setTime(HSSFDateUtil.getJavaDate(d));
					cellText = (String.valueOf(cal.get(Calendar.YEAR))).substring(2);
					cellText = cal.get(Calendar.MONTH) + 1 + "/" + cal.get(Calendar.DAY_OF_MONTH) + "/"
							+ cellText;
				}

				return cellText;
			} else if (hssfCell.getCellType() == Cell.CELL_TYPE_BLANK) {
				return "";
			}
			else {
				return String.valueOf(hssfCell.getBooleanCellValue());
			}
		} catch (Exception e) {
			//logger.error("ERROR in getCellData", e);
			throw new FrameworkException("ERROR in getCellData", e);
		}
	}

	/**
	 * Gets the date from a cell of the active sheet
	 *
	 * @param colName
	 *            the col name
	 * @param rowNum
	 *            the row num
	 * @return the celldata from active sheet
	 */
	public String getCelldataFromActiveSheet(final String colName, final int rowNum) {
		try {
			if (rowNum <= 0) {
				return "";
			}

			int index = hssfWorkbook.getSheetIndex(sheetName);
			int col_Num = -1;
			if (index == -1) {
				return "";
			}

			hssfSheet = hssfWorkbook.getSheetAt(index);
			hssfRow = hssfSheet.getRow(0);
			for (int i = 0; i < hssfRow.getLastCellNum(); i++) {
				if (hssfRow.getCell(i).getStringCellValue().trim().equals(colName.trim()))
					col_Num = i;
			}
			if (col_Num == -1) {
				return "";
			}

			hssfSheet = hssfWorkbook.getSheetAt(index);
			hssfRow = hssfSheet.getRow(rowNum - 1);
			if (hssfRow == null) {
				return "";
			}
			hssfCell = hssfRow.getCell(col_Num);

			if (hssfCell == null) {
				return "";
			}
			if (hssfCell.getCellType() == Cell.CELL_TYPE_STRING) {
				return hssfCell.getStringCellValue();
			}
			else if (hssfCell.getCellType() == Cell.CELL_TYPE_NUMERIC
					|| hssfCell.getCellType() == Cell.CELL_TYPE_FORMULA) {

				String cellText = String.valueOf(hssfCell.getNumericCellValue());
				if (HSSFDateUtil.isCellDateFormatted(hssfCell)) {
					// format in form of M/D/YY
					double d = hssfCell.getNumericCellValue();

					Calendar cal = Calendar.getInstance();
					cal.setTime(HSSFDateUtil.getJavaDate(d));
					cellText = (String.valueOf(cal.get(Calendar.YEAR))).substring(2);
					cellText = cal.get(Calendar.DAY_OF_MONTH) + "/" + cal.get(Calendar.MONTH) + 1 + "/"
							+ cellText;
				}

				return cellText;
			} else if (hssfCell.getCellType() == Cell.CELL_TYPE_BLANK) {
				return "";
			} else {
				return String.valueOf(hssfCell.getBooleanCellValue());
			}

		} catch (Exception e) {
			//logger.error("ERROR in getCellData", e);
			throw new FrameworkException("ERROR in getCellData", e);
		}
	}

	/**
	 * Checks if is sheet exist.
	 *
	 * @param sheetName
	 *            the sheet name
	 * @return true, if is sheet exist
	 */
	public boolean isSheetExist(final String sheetName) {
		int index = hssfWorkbook.getSheetIndex(sheetName);
		if (index == -1) {
			index = hssfWorkbook.getSheetIndex(sheetName.toUpperCase());
			return false;
		} else {
			return true;
		}
	}
	
	public ExcelData readXlsxExcel(Integer sheetIndex) {
		
		ExcelData data = new ExcelData();
		List<List<String>> rtnData = new ArrayList<List<String>>();
		
		xssfSheet = xssfWorkBook.getSheetAt(sheetIndex);
		Iterator<Row> rowIterator = xssfSheet.iterator();
		
		while (rowIterator.hasNext()){
			xssfRow = (XSSFRow) rowIterator.next();
			Iterator <Cell> cellIterator = xssfRow.cellIterator();
			List<String> tmp = new ArrayList<String>();
			
			while (cellIterator.hasNext()) {
	            xssfCell = (XSSFCell) cellIterator.next();
	            
	            if (xssfCell != null && xssfCell.getCellType() != Cell.CELL_TYPE_BLANK) {
	                
	            	switch (xssfCell.getCellType()) {
		               case Cell.CELL_TYPE_NUMERIC:
		            	   //tmp.add(xssfCell.getNumericCellValue());
		            	   break;
		               
		               case Cell.CELL_TYPE_STRING:
		            	   tmp.add(xssfCell.getStringCellValue());
		            	   break;
		            }
	            } else {
	            	tmp.add("");
	            }
	         }
			rtnData.add(tmp);
		}

		data.setData(rtnData);
		return data;
	}
	
	public ExcelData readXlsExcel(Integer sheetIndex){
		
		ExcelData data = new ExcelData();
		List<List<String>> rtnData = new ArrayList<List<String>>();
		
		hssfSheet = hssfWorkbook.getSheetAt(sheetIndex);
		Iterator<Row> rowIterator = hssfSheet.iterator();
		
		while (rowIterator.hasNext()){
			hssfRow = (HSSFRow) rowIterator.next();
			Iterator <Cell> cellIterator = hssfRow.cellIterator();
			List<String> tmp = new ArrayList<String>();
			
			while (cellIterator.hasNext()) {
	            hssfCell = (HSSFCell) cellIterator.next();
	            
	            if (hssfCell != null && hssfCell.getCellType() != Cell.CELL_TYPE_BLANK) {
	                
	            	switch (hssfCell.getCellType()) {
		               case Cell.CELL_TYPE_NUMERIC:
		            	   //tmp.add(xssfCell.getNumericCellValue());
		            	   break;
		               
		               case Cell.CELL_TYPE_STRING:
		            	   tmp.add(hssfCell.getStringCellValue().trim());
		            	   break;
		            }
	            } else {
	            	tmp.add("");
	            }
	         }
			rtnData.add(tmp);
		}

		data.setData(rtnData);
		return data;
	}
}
