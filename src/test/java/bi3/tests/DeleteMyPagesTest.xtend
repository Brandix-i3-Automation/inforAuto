package bi3.tests

import bi3.pages.LoginPage
import bi3.pages.HomePage
import bi3.pages.BasePage
import bi3.pages.StartPage
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test
import org.testng.Assert
import java.util.List

class DeleteMyPagesTest extends BaseTest {
	
	LoginPage loginPage
	HomePage homePage
	BasePage basePage
	StartPage startPage
	
	
	@BeforeMethod
	def void Initialize() {
		loginPage = new LoginPage(driver);
		homePage = new HomePage(driver);
		basePage = new BasePage(driver);
		startPage = new StartPage(driver);
	}
	
	/**
	 * @TestCaseID: System Test case 12
	 * @CloudSuite: F&B
	 * @Description: This test case includes the steps to delete a page
	 * @author:	lakshikaj
	 */
	@Test
	def void DeletePagesTest() {
		
		var List<String> startItemsList;
		var String newPageName = "NewTest";
		
		loginPage.GoTo();
		Assert.assertEquals(startPage.getStartPageText,"Start","Start page is not displayed");
		
		basePage.goToHome();
		startItemsList = startPage.getStartMenuItemNames();
		
		//validate the start list
		Assert.assertEquals(startItemsList.get(0),"Start Page");
		Assert.assertEquals(startItemsList.get(1),"Add Widget...");
		Assert.assertEquals(startItemsList.get(2),"Add Page...");
		Assert.assertEquals(startItemsList.get(3),"Add Page from Library...");
		Assert.assertEquals(startItemsList.get(4),"Delete Page...");
		Assert.assertEquals(startItemsList.get(5),"Remove Favorite Page ...");
		Assert.assertEquals(startItemsList.get(6),"Refresh");
		
		/*
		// check whether a page exists
		if(startPage.checkNewPageExists()){
			print("exist");
			//startPage.deletePage("NewTest");
		}
		else{
			print("new page not exist");
		}
		*/
		
		startPage.addNewPage(newPageName);
		basePage.goToHome();
		// validate the start list with the new page
		
		startPage.gotoNewPage("NewTest");
		
	}
}