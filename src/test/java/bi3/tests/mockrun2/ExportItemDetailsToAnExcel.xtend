/**
 * @TestCaseID : 7
 * @CloudSuite : f&b
 * @Description : Export Items Details to an Excel
 * @Author : NipuniP
 * 
 */
package bi3.tests.mockrun2

import bi3.tests.BaseTest
import bi3.pages.LoginPage
import org.testng.annotations.BeforeMethod
import bi3.pages.HomePage
import org.testng.annotations.Test
import bi3.pages.mms001.MMS001
import org.testng.Assert
import bi3.pages.ToolbarPage

class ExportItemDetailsToAnExcel extends BaseTest {
	LoginPage loginPage
	HomePage homePage
	MMS001 mms001
	ToolbarPage toolBarPage
	
	@BeforeMethod
	def void Initialize()
	{
		loginPage = new LoginPage(driver)
		homePage = new HomePage(driver)
		mms001 = new MMS001(driver)
		toolBarPage = new ToolbarPage(driver)
	}
	
	@Test
	def void exportItemDetailsToAnExcel()
	{
		//Navigate to MMS001
		loginPage.GoTo();
		homePage.goToProgram("MMS001");
		
		//Set the sorting order to 1
		mms001.setSortingOrder("1-Item number");
		
		//Verify the Panel MMS001/B
		Assert.assertEquals(mms001.pageId, "MMS001/B")
		
		//Select First Five Rows
		mms001.selsctRows();
		
		toolBarPage.clickTools("Export to Excel");
		
		//Verify the Header of the export Excel
		Assert.assertEquals(mms001.excelExportheading(),"Export to Excel")
		
		//Do the Export Procedure
		mms001.clickSelectedRowRbtn();
		mms001.clickKeepSourceRbtn();
		mms001.clickExportBtn();
		
		//Close All tabs
		mms001.closeAllTabs();
	}
	
}