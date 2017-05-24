package bi3.tests.mockrun2

import bi3.tests.BaseTest
import bi3.pages.HomePage
import bi3.pages.LoginPage
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test
import bi3.framework.elements.inforelements.InforGrid
import org.testng.Assert
import bi3.pages.mms001.MMS001
import bi3.pages.ToolbarPage
import bi3.pages.mms001.MMS001B


class SystemTC_10 extends BaseTest{
	LoginPage loginPage
	HomePage homePage
	MMS001 mms001
	MMS001B mms001b
	ToolbarPage toolBarpage

	@BeforeMethod
	def void Initialize() {
		loginPage = new LoginPage(driver);
		homePage = new HomePage(driver);
		mms001 = new MMS001(driver);
		toolBarpage = new ToolbarPage(driver);
		mms001b = new MMS001B(driver);
	}
	
	/**
	 * @Params : 
	 * @Result :M3 UI Adapter: Change default options via User Settings
	 * @Purpose:To validate if changes in user settings default options will take effect upon saved GOALS
	 * @Description : System Test TestCaseNo 10
	 */
	@Test
	def void TestCaseNumber10() {
		
		var String program = "MMS001";
		var String shortKey = "r";
		
		loginPage.GoTo();
		
		//homePage.GoToMMS001();
		//homePage.pressShortcutKeys(shortKey);
		homePage.goToProgramUsingShrt(program);
		//homePage.assertInsertedProgram(program);
		
		//Clicking Tools
		mms001b.clickTools();
	
		//Asserting The Elements In It
		mms001b.assertToolListMMS001();
		
		//Clicking User Settings
		mms001b.clickUserSettings();
		
		//Asserting The PopUp 
		mms001b.assertPopUpWindowUserSettings();
		
		//Enable CheckBox ProgramID
		mms001b.clickCheckBoxProgramId();
		
		//Asserting CheckBox After Enabling
		mms001b.assertCheckBoxEnabled();
		
		//Clicking Save Button 
		mms001b.clickSaveButton();
		
		//Refreshing The Page
		toolBarpage.ClickAction_Refresh();
		
		//Asserting The Tab with ProgramID
		homePage.goToProgramUsingShrt(program);
		
		//Asserting Tab With ProgramID
		mms001b.assertTabWithProgramId(program);
	}
}