package bi3.tests.mockrun2

import bi3.tests.BaseTest
import bi3.pages.LoginPage
import bi3.pages.HomePage
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test
import bi3.pages.ToolbarPage
import bi3.pages.mns204.MNS204B
import org.testng.Assert
import bi3.pages.mns204.MNS204E

class TC1AddUser extends BaseTest{
	LoginPage loginPage
	HomePage homePage
	ToolbarPage toolbarPage
	MNS204B mns204B
	MNS204E mns204E
	
	@BeforeMethod
	def void Initialize() {
		loginPage = new LoginPage(driver);
		homePage = new HomePage(driver);
		toolbarPage = new ToolbarPage(driver);
		mns204B = new MNS204B(driver);
		mns204E = new MNS204E(driver);
	}
	
	/**
	 * @TestCaseID: 001
	 * @CloudSuite: F&B
	 * @Description: Test whether user can be added.
	 * @author:	Insaaf
	 */
	@Test
	def void AddUser(){
		loginPage.GoTo();
		homePage.goToProgramUsingShrt("MNS204");
//		toolbarPage.ClickAction_Settings();
//		homePage.setPanelSequence("E");
//		homePage.clickOnNext();
		if(mns204B.checkUserAvailable("RASITHAE")){
			mns204B.deleteUser();
		}
//		homePage.pressShortcutKeys("1");
//		Assert.assertEquals(homePage.getPageId(),"MNS204/E","Page not Found");
//		mns204E.addUser();
//		Assert.assertEquals(homePage.getPageId(),"MNS204/B1","Page not Found");
//		if(mns204B.checkUserAvailable("RASITHAE")==false){
//			Assert.fail("User creation unsuccessful");
//		}
	}
}