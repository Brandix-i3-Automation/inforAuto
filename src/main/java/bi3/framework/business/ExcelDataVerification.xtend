package bi3.framework.business

import bi3.framework.dto.ExcelData
import java.util.List

/**
 * Excel data Verification class.
 * 
 * @author OsandaF
 */
class ExcelDataVerification {
	
	/**
	 * Verify excel tabular format data.
	 * 
	 * @return boolean
	 */
	def boolean verifyExportTabularData(ExcelData excelData, ExcelData appData) {
		
		var boolean verified = false;
		
//		for (List<String> excelRow : excelData.data) {
//			
//			for (List<String> appRow : appData.data) {
//				verified = excelRow.containsAll(appRow);
//				
//				if (!verified) {
//					return verified;
//				} else {
//					appData.data.remove(appRow);
//					verified = true;
//				}
//			}
//			excelData.data.remove(excelRow);
//		}

		verified = excelData.data.containsAll(appData.data);
		
		return verified;
	}
	
}