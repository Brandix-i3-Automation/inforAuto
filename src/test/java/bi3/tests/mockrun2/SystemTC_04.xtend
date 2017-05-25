package bi3.tests.mockrun2

import bi3.pages.LoginPage
import bi3.pages.HomePage
import bi3.pages.ToolbarPage
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test
import org.testng.Assert
import bi3.tests.BaseTest

class SystemTC_04 extends BaseTest{
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
	 * @TestCaseID: 4
	 * @CloudSuite: General
	 * @Description: This test case includes Start Form Help via M3 Business Engine
	 * @author:	poojas
	 */
	@Test
	def void StartFormHelpTest(){
		/* Test Data */
		var String program = "MMS001";
		
		
		/* Test*/
		loginPage.GoTo();
		// 3. Press "Ctrl + R" button in the keyboard - Verify:Search and Start pop up window is displayed 		
		homePage.pressShortcutKeys("R");
		Assert.assertEquals(homePage.verifySearchAndStartPopup(),"Search and Start");
		
		// 4. Enter MMS001 in the Textbox - Verify:Code is entered in the textbox
		homePage.goToProgramUsingShrt(program);
		
		// 5. Click "?" dropdown arrow in the upper right portion of the page - Verify:Form Help and Infocenter options are listed	
		toolBarPage.clickHelpLogo();
		Assert.assertEquals(toolBarPage.findElementInHelp("Form Help...").text,"Form Help...");
		Assert.assertEquals(toolBarPage.findElementInHelp("Infocenter").text,"Infocenter");		
		toolBarPage.clickHelpLogo();
		
		// 6. Click Form Help - Verify:Create Item topic is opened in the main section and all topic matches with MMS001 are listed on the left panel section.
		toolBarPage.clickHelp("Form Help...");		
		Assert.assertEquals(toolBarPage.getPageTitle(),"Form Help")
		
		//Redirects to M3 Infor Centre - System Bug			
	}
	
}