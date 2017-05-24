package bi3.tests.mockrun2

import bi3.tests.BaseTest
import bi3.pages.LoginPage
import bi3.pages.HomePage
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test
import org.testng.Assert
import bi3.pages.startMenu.MyPages
import bi3.pages.startMenu.StartMenuPage
import bi3.pages.startMenu.AddPage
import bi3.pages.startMenu.PageSettings
import bi3.framework.util.DateUtil
import bi3.pages.startMenu.DeletePage

class SharePagesToOtherUsers extends BaseTest {
	
	LoginPage loginPage
	HomePage homePage
	MyPages myPages
	StartMenuPage startMenuPage
	AddPage addPage
	PageSettings pageSettings
	DeletePage deletePage
	
	@BeforeMethod
	def void Initialize() {
		loginPage = new LoginPage(driver);
		homePage = new HomePage(driver);
		myPages = new MyPages(driver);
		startMenuPage = new StartMenuPage(driver);
		addPage = new AddPage(driver);
		pageSettings = new PageSettings(driver);
		deletePage = new DeletePage(driver);
	}
	
	/**
      * @TestCaseID:   14
      * @CloudSuite:   F&B
      * @Description: M3 UI Adapter: Share My Pages to other users
      * @author: AnushkaC
      */
	@Test
	def void sharePagesToOthers(){
		loginPage.GoTo();
		
		//Assertion No.2
		Assert.assertEquals(homePage.verifyStartPageExist, "Start");
		
		/**
		 * Adding a new page.
		 */
		homePage.clickStart();
		startMenuPage.goToAddPage();
		addPage.enterNewPageTitle("AC Test Page");
		addPage.clickOkay();
		
		/**
		 * Share pages.
		 */
		homePage.clickStart();
		//Assertion No.3
		startMenuPage.goToMyPages();
		//Assertion No.4
		myPages.clickPageSettings("AC Test Page");
		//Assertion No.5
		pageSettings.toggleShareButton();
		//Assertion No.6
		//Assert.assertEquals(myPages.getTogglecolor(), "#007FEA");
		pageSettings.savePageSettings();
		//Assertion No.7
		Assert.assertFalse(pageSettings.isSettingsPageClosed());
		Assert.assertTrue(myPages.isShareIconAvailable("AC Test Page"));
		Assert.assertEquals(myPages.getChangedDate("AC Test Page"), DateUtil.getCurrentDate("yyyy-MM-dd"), "Changed date is not equal to current system date");
		
		/**
		 * Deleting a created page.
		 */
		 myPages.clickDeleteIcon("AC Test Page");
		 deletePage.confirmDeletion();
		 
		/**
		 * Closing My Pages panel.
		 */
		 myPages.closeMyPages();
		 //Assertion No.8
		Assert.assertFalse(myPages.isMyPageClosed());
	}
	
}