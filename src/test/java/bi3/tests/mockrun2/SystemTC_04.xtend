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
		
		homePage.pressShortcutKeys("R");
		
		//verify that search and start pop up is displayed
		Assert.assertEquals(homePage.verifySearchAndStartPopup(),"Search and Start");
		
		homePage.goToProgramUsingShrt(program);
		
		toolBarPage.clickHelpLogo();
		
		//verify that drop down options are listed
		Assert.assertEquals(toolBarPage.findElementInHelp("Form Help...").text,"Form Help...");
		Assert.assertEquals(toolBarPage.findElementInHelp("Infocenter").text,"Infocenter");
		
		toolBarPage.clickHelpLogo();
		toolBarPage.clickHelp("Form Help...");
		
		Assert.assertEquals(toolBarPage.getPageTitle(),"Form Help")
		
		//Redirects to M3 Infor Centre - System Bug
			
	}
	
}