package bi3.tests.mockrun2

import bi3.pages.LoginPage
import bi3.pages.HomePage
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test
import bi3.pages.ToolbarPage
import bi3.pages.mms001.MMS001
import bi3.framework.config.ConfigKeys
import bi3.framework.util.ExcelUtil
import java.util.HashMap
import org.testng.Assert
import bi3.tests.BaseTest

class AddShortcutWidgetTest extends BaseTest {
	
	LoginPage loginPage
	HomePage homePage
	ToolbarPage toolbarPage
	MMS001 mms001
	
	@BeforeMethod
	def void Initialize() {
		loginPage = new LoginPage(driver);
		homePage = new HomePage(driver);
		toolbarPage = new ToolbarPage(driver);
		mms001 = new MMS001(driver);
	}
	
	/**
	 * @TestCaseID: Sample Test case 8
	 * @CloudSuite: F&B
	 * @Description: This test case includes the steps to add a shortcut to the shortcut widget
	 * @author:	lakshikaj
	 */
	@Test
	def void AddShortcutWidgetTest() {
		
		// TestData
		var String shortcutName = "Item Master";
		var int widgetNumber = 2;
		var String widgetName = "Shortcuts";

		loginPage.GoTo();
		homePage.GoToMMS001();
		toolbarPage.clickTools("Add to Start Page Shortcuts...");
		mms001.createShortcut(shortcutName);
		mms001.close();
		Thread.sleep(2000);
		homePage.addWidget(widgetNumber,widgetName);
		
		// Validate whether the created shortcut exists in the shortcut widget
		Assert.assertTrue(homePage.isShortcutFoundInShortcutWidget(shortcutName),"Shortcut not found");
	}
}
