package bi3.tests.mockrun2


import bi3.tests.BaseTest
import bi3.pages.LoginPage
import bi3.pages.HomePage
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test
import org.testng.Assert
import bi3.pages.startMenu.AddPage
import bi3.pages.startMenu.StartMenuPage
import bi3.pages.startMenu.MyPages
import bi3.pages.startMenu.MyStartPages
import bi3.pages.startMenu.DeletePage

class SystemTC_13 extends BaseTest {
	
	LoginPage loginPage
	HomePage homePage
	AddPage addPage
	StartMenuPage startMenuPage
	MyPages myPages
	MyStartPages myStartPages
	DeletePage deletePage

	@BeforeMethod
	def void Initialize() {
		loginPage = new LoginPage(driver)
		homePage = new HomePage(driver)
		addPage = new AddPage(driver)
		startMenuPage = new StartMenuPage(driver)
		myPages = new MyPages(driver);
		myStartPages = new  MyStartPages(driver); 
		deletePage = new DeletePage(driver);
		//reorderNewPage = new ReorderNewPage(driver);

	}

	/**
	 * @TestCaseID: System Test case 13
	 * @CloudSuite: F&B
	 * @Description: This test case includes the Reoreder my page flow
	 * @author:	PriyankaraW
	 */
	@Test
	def void reorderPages() {

		var String newPageName = "TestOne"

		loginPage.GoTo();
		Assert.assertEquals(startMenuPage.getStartLblValue, "Start", "Start Not Verified");
		homePage.goToHome();
		Assert.assertEquals(startMenuPage.getStartPageLblValue, "Start Page", "Start Page Not Verified");

		addPage.addNewPages();
		addPage.enterNewPageTitle(newPageName);
		addPage.clickOkay();
		homePage.goToHome();
		
		var menuList = startMenuPage.getTextList()
		Assert.assertTrue(menuList.contains(newPageName), " " + newPageName + "page dose not exist")
		myPages.clickMyPage();

		Assert.assertEquals(myStartPages.getNewPageLblValue(newPageName), newPageName, " " + newPageName + "page dose not exist");

		myStartPages.movingUpNewCreatedPage(newPageName, 1);
		//reorderNewPage.movingDownNewCreatedPage(newPageName,2)
		myStartPages.clickOkay();
		homePage.goToHome();

		Assert.assertEquals(startMenuPage.getAddedPageName, newPageName, " " + newPageName + "page dose not exist");

		deletePage.deletePage();
		deletePage.clickOkayConfirmation();
		homePage.goToHome();
		var menuListAfterDelNewPage = startMenuPage.getTextList()
		Assert.assertFalse(menuListAfterDelNewPage.contains(newPageName))

	}

}


	
	
