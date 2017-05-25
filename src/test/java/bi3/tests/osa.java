package bi3.tests;

import java.util.ArrayList;
import java.util.List;

import org.testng.Assert;
import org.testng.annotations.Test;

import bi3.framework.business.ExcelDataVerification;
import bi3.framework.dto.ExcelData;
import bi3.framework.util.ExcelUtil;
import bi3.framework.util.FileUtil;

public class osa {

	@Test
	public void tt() {
		ExcelData eData = new ExcelData();
		List<List<String>> eAll = new ArrayList<List<String>>();
		List<String> e1 = new ArrayList<String>();
		e1.add("A");
		e1.add("B");
		e1.add("C");
		e1.add("D");
		
		List<String> e2 = new ArrayList<String>();
		e2.add("A2");
		e2.add("B2");
		e2.add("C2");
		e2.add("D2");
		
		eAll.add(e1);
		eAll.add(e2);
		
		eData.setData(eAll);
		
		
//		ExcelData aData = new ExcelData();
//		List<List<String>> aAll = new ArrayList<List<String>>();
//		List<String> a1 = new ArrayList<String>();
//		a1.add("A");
//		a1.add("B");
//		a1.add("C");
//		a1.add("D");
//		
//		List<String> a2 = new ArrayList<String>();
//		a2.add("A2");
//		a2.add("B2");
//		a2.add("C2");
//		a2.add("D2");
//		
//		aAll.add(a1);
//		aAll.add(a2);
//		
//		aData.setData(aAll);
		
		ExcelUtil eu = new ExcelUtil("E:\\Chrome");
		ExcelData aData = eu.readXlsExcel(0);
		
		ExcelDataVerification ev = new ExcelDataVerification();
		boolean status = ev.verifyExportTabularData(eData, aData);
		Assert.assertEquals(status, true);
		
		

	}
	
}
