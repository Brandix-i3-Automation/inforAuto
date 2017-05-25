package bi3.tests.mockrun2

import bi3.tests.BaseTest
import bi3.pages.LoginPage
import bi3.pages.HomePage
import bi3.pages.ToolbarPage
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test
import org.testng.Assert


class SystemTC_05 extends BaseTest {
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
	 * @TestCaseID: 5
	 * @CloudSuite: General
	 * @Description: This test case includes Start Infocenter via M3 Business Engine
	 * @author:	poojas
	 */
	@Test
	def void StartInfocenterTest(){
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
		toolBarPage.clickHelp("Infocenter");
		
		Assert.assertEquals(toolBarPage.getPageTitle(),"M3 Infocenter")
	}
	
}