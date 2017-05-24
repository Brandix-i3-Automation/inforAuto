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
		// 3. Press "Ctrl + R" button in the keyboard - Verify: Search and Start pop up window is displayed
		// 4. Enter MMS001 in the Textbox - Verify: Code is entered in the textbox
		// 5. Click the Ok button - Verify: MMS001 (Item.Open) Program is opened and is displayed as a tab in the system.
		homePage.goToProgramUsingShrt(program);

		// 6. Click Tools - Verify: Tools list is displayed with the following actions:Add to Start Page Shortcuts,Personalize,User Settings,Export to Excel,Link Manager,Context Publisher
		mms001b.clickTools();
		mms001b.assertToolListMMS001();

		// 7. Click User Settings - Verify: User Settings pop-up window is prompted.
		mms001b.clickUserSettings();
		mms001b.assertPopUpWindowUserSettings();

		// 8. Select Show Program ID - Verify: Show Program ID is selected.
		mms001b.clickCheckBoxProgramId();
		mms001b.assertCheckBoxEnabled();

		// 9. Click Save - Verify: Changes made are saved and user settings pop-up window closes.
		mms001b.clickSaveButton();

		// 10. Click Refresh from the program (Note: Not the Refresh page) - Verify: Program ID MMS001 is displayed on the open tab
		toolBarpage.ClickAction_Refresh();
		mms001b.assertTabWithProgramId(program);
	}
<<<<<<< HEAD
	
=======
>>>>>>> ee8251587b8b89f45bc17583e971ea80ec5d5823
}