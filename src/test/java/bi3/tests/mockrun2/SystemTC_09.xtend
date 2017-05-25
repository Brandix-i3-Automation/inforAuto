package bi3.tests.mockrun2

import bi3.tests.BaseTest
import bi3.pages.LoginPage
import bi3.pages.HomePage
import bi3.pages.ToolbarPage
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test
import org.testng.Assert
import bi3.pages.mms001.MMS001B
import bi3.framework.util.ExcelUtil
import bi3.framework.config.ConfigKeys
import bi3.framework.dto.ExcelData
import bi3.framework.business.ExcelDataVerification
import java.util.List

class SystemTC_09 extends BaseTest {
	LoginPage loginPage
	HomePage homePage
	ToolbarPage toolBarPage
	MMS001B mms001b;

	@BeforeMethod
	def void Initialize() {
		loginPage = new LoginPage(driver)
		homePage = new HomePage(driver)
		toolBarPage = new ToolbarPage(driver);
		mms001b = new MMS001B(driver);
	}

	/**
	 * @TestCaseID: 9
	 * @CloudSuite: General
	 * @Description: M3 UI Adapter: Export currently selected rows to an excel file
	 * @author:	osandaf
	 */
	@Test
	def void TestExportSelectedRowsToExcel() {
		
		val int NUMBER_OF_ROWS = 2;
		val List<String> toolsOptionMenu = newArrayList("Add to Start Page Shortcuts...","Personalize","User Settings...","Export to Excel","Link Manager");

		loginPage.GoTo();
		// 3. Press "Ctrl + R" button in the keyboard - Verify:Search and Start pop up window is displayed
		homePage.pressShortcutKeys("R");
		Assert.assertEquals(homePage.verifySearchAndStartPopup(),"Search and Start");
		
		// 4. Enter MMS001 in the Textbox - Verify:Code is entered in the textbox
		// 5. Click the Ok button - Verify: MMS001 (Item.Open) Program is opened and is displayed as a tab in the system.
		homePage.goToProgramUsingShrt("MMS001");
		// TODO: Assert here
		
		// 6. Select any row - Verify: Row selected is highlighted
		mms001b.selectRows(NUMBER_OF_ROWS);
		
		mms001b.clickTools();
		var boolean toolMenuStatus = mms001b.verifyList(toolsOptionMenu, mms001b.getToolsMenuOptions());
		Assert.assertEquals(toolMenuStatus, true);
		mms001b.clickTools();
		
		// 7. Click Tools - Verify:  Tools list is displayed with the following actions: Add to Start Page Shortcuts, Personalize, User Settings, Export to Excel, Link Manager, Context Publisher
		// 8. Click Export to Excel - Verify: Export to Excel pop-up window is prompted.
		mms001b.clickTools("Export to Excel");
		
		// 9. Under Rows, select Export currently selected rows - Verify: Export currently selected row is selected.
		mms001b.clickSelectedRowsBtn();
		Assert.assertEquals(mms001b.isCheckedExportSelectedRows(), "true");
		
		// 10. Under Data Format, select Source Format - Verify: Source Format is selected.
		mms001b.clickSourceFormatBtn();
		Assert.assertEquals(mms001b.isCheckedSourceFormat(), "true");
		
		// 11. Click Export - Verify: Selected Row is exported to an excel file with "Item+Open.xls" filename
		mms001b.clickExportBtn();
		
		Thread.sleep(3000);
		
		// 12. Open Item+Open.xls file - Verify: Check if the Item in the selected row and item in the exported file are the same.
		var ExcelUtil excelUtil = new ExcelUtil(ConfigKeys.EXCEL_DOWNLOAD_PATH);
		var ExcelData eData = excelUtil.readXlsExcel(0);
		
		var ExcelData aData = new ExcelData();
		aData.data = mms001b.getRowsWithHeaders(NUMBER_OF_ROWS);
		
		var ExcelDataVerification ev = new ExcelDataVerification();
		var boolean status = ev.verifyExportTabularData(eData, aData);
		
		Assert.assertEquals(status, true);
	}
}
