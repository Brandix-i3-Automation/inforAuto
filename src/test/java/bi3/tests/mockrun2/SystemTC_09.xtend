package bi3.tests.mockrun2

import bi3.tests.BaseTest
import bi3.pages.LoginPage
import bi3.pages.HomePage
import bi3.pages.ToolbarPage
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test
import org.testng.Assert

class SystemTC_09 extends BaseTest {
	LoginPage loginPage
	HomePage homePage
	ToolbarPage toolBarPage

	@BeforeMethod
	def void Initialize() {
		loginPage = new LoginPage(driver)
		homePage = new HomePage(driver)
		toolBarPage = new ToolbarPage(driver);
	}

	/**
	 * @TestCaseID: 9
	 * @CloudSuite: General
	 * @Description: M3 UI Adapter: Export currently selected rows to an excel file
	 * @author:	osandaf
	 */
	@Test
	def void TestExportSelectedRowsToExcel() {
		/* Test Data */
		var String program = "MMS001";

		/* Test*/
		loginPage.GoTo();
		// 3. Press "Ctrl + R" button in the keyboard - Verify:Search and Start pop up window is displayed
		homePage.pressShortcutKeys("R");
		Assert.assertEquals(homePage.verifySearchAndStartPopup(),"Search and Start");
		
		// 4. Enter MMS001 in the Textbox - Verify:Code is entered in the textbox
		// 5. Click the Ok button - Verify: MMS001 (Item.Open) Program is opened and is displayed as a tab in the system.
		homePage.goToProgramUsingShrt(program);
		// TODO: Assert here
		
		// 6. Select any row - Verify: Row selected is highlighted
		
		
		
	}
}
