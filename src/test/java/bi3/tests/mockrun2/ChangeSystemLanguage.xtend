package bi3.tests.mockrun2

import bi3.tests.BaseTest
import bi3.pages.LoginPage
import bi3.pages.HomePage
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test

class ChangeSystemLanguage extends BaseTest {
	
	LoginPage loginPage;
	HomePage homePage;
	
	@BeforeMethod
	def void Initialize(){
		loginPage = new LoginPage(driver)
		homePage = new HomePage(driver)
		
	}
	/**
	 * @TestCaseID:	16
	 * @CloudSuite:	F&B
	 * @Description: M3 BE Function: Change User Account's System Language
	 * @author: DeepikaG
	 **/
	@Test
	def void changeSystemLanguageTest(){
		loginPage.GoTo();
	}
	
}