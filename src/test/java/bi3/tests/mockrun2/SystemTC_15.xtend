package bi3.tests.mockrun2

import bi3.tests.BaseTest
import bi3.pages.HomePage
import bi3.pages.LoginPage
import bi3.pages.ToolbarPage
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test
import org.testng.Assert
import bi3.pages.mns105.MNS105B

class SystemTC_15 extends BaseTest {
	LoginPage loginPage
	HomePage homePage
	ToolbarPage toolBarPage
	MNS105B mns105B
	
	@BeforeMethod
	def void Initialize() {
		loginPage = new LoginPage(driver)
		homePage = new HomePage(driver)
		toolBarPage = new ToolbarPage(driver);
		mns105B = new MNS105B(driver);
		
	}
	
	/**
	 * @TestCaseID: 15
	 * @CloudSuite: General
	 * @Description: This test case includes accessing current system languages
	 * @author:	poojas
	 */
	@Test
	def void accessCurrrentSystemLanguagesTest(){
		/* Test Data */
		var String program = "MNS105";
		
		
		/* Test*/
		loginPage.GoTo();

		homePage.pressShortcutKeys("R");
		
		//verify that search and start pop up is displayed
		Assert.assertEquals(homePage.verifySearchAndStartPopup(),"Search and Start");
		
		homePage.goToProgramUsingShrt(program);
		
		//verify system languages are displayed in grid
		Assert.assertEquals(mns105B.gridContainsSystemLanguages(),true);		
	}
	
}